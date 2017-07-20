<?php
class ModelSupportTicket extends Model {
	public function getTicketsAll($start = 0, $limit = 20) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_support WHERE custid='".(int)$this->customer->getId()."' and storeid='".(int)$this->config->get('config_store_id')."' ORDER BY id DESC LIMIT " . (int)$start . "," . (int)$limit);
		return $query->rows;
	}

	public function getTicketsByID($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_support WHERE id=".$id." and custid='".(int)$this->customer->getId()."' and storeid='".(int)$this->config->get('config_store_id')."'");
		return $query->row;
	}

	public function getTicketsReply() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_support as cs INNER JOIN " . DB_PREFIX . "customer_support_details as csd ON cs.id = csd.ticketid WHERE cs.custid='".(int)$this->customer->getId()."' and cs.storeid='".(int)$this->config->get('config_store_id')."' ");
		return $query->rows;
	}

	public function getTicketUniqueCode($code) {
		$query = $this->db->query("SELECT COUNT(*) as total FROM " . DB_PREFIX . "customer_support WHERE ticketno='".$code."'");
		return @$query->rows['total'];
	}

	public function getCurrentStore($data = array()) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "store WHERE store_id='".(int)$this->config->get('config_store_id')."'");
		return $query->row;
	}
	
	public function addTicket($data) {
		if (isset($data['customer_id'])) {
			$customer_id = $data['customer_id'];
		} else {
			$customer_id = 0;
		}

		$this->db->query("INSERT INTO `" . DB_PREFIX . "customer_support` SET `ticketno` = '" . $this->db->escape($data['ticketno']) . "', `title` = '" . $this->db->escape($data['title']) . "', `description` = '" . $this->db->escape($data['description']) . "', `custid` = '" . (int)$this->customer->getId() . "', `storeid` = '" . (int)$this->config->get('config_store_id') . "'");
		$ticket_id = $this->db->getLastId();
		return $ticket_id;
	}

	public function addTicketRely($data) {
		if (isset($data['customer_id'])) {
			$customer_id = $data['customer_id'];
		} else {
			$customer_id = 0;
		}

		$this->db->query("INSERT INTO `" . DB_PREFIX . "customer_support_details` SET `ticketid` = '" . $this->db->escape($data['ticketid']) . "', `replydescription` = '" . $this->db->escape($data['commentdescription']) . "'");
		$ticket_id = $this->db->getLastId();
		return $ticket_id;
	}

	public function editTicket($data) {

	}

	public function getTotalTickets() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_support WHERE custid='".(int)$this->customer->getId()."' and storeid='".(int)$this->config->get('config_store_id')."'");

		return $query->row['total'];
	}
}