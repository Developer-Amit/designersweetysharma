<?php
class ControllerSupportTicket extends Controller {
	private $error = array();
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		$this->load->model('support/ticket');

		$data['heading_title'] = "Support Ticket";

		$this->document->setTitle($data['heading_title']);
		
		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		if(isset($this->session->data['success'])){
			$data['success'] = $this->session->data['success'];
		}else{
			$data['success'] = "";
		}
		$data['warning'] = '';
		$data['breadcrumbs'] = array();
		$url = "";
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Support',
			'href' => $this->url->link('support/ticket', $url, true)
		);

		$data['addticket_url'] = $this->url->link('support/ticket/add');
		$data['view'] = $this->url->link('support/ticket/view');
		$data['button_view'] = "view";
		$data['button_addticket'] = "Add Ticket";
		$order_total = $this->model_support_ticket->getTotalTickets();
		$data['tickets'] = $this->model_support_ticket->getTicketsAll(($page - 1) * 10, 10);

		$pagination = new Pagination();
		$pagination->total = $order_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('support/ticket', 'page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($order_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($order_total - 10)) ? $order_total : ((($page - 1) * 10) + 10), $order_total, ceil($order_total / 10));

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('support/ticket_list', $data));
	}

	public function add() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}
		$this->load->language('catalog/information');
		$data['heading_title'] = "Add Ticket";

		$this->document->setTitle($this->language->get($data['heading_title']));

		$this->load->model('support/ticket');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$ticket_id = $this->model_support_ticket->addTicket($this->request->post);

			$this->session->data['success'] = "Ticket successfully added";

			$store_data = $this->model_support_ticket->getCurrentStore();
			if($this->config->get('config_store_id')==0){
				$data['store_name'] = "Vogueme";
				$subject = 'Vogueme - '. $this->request->post['title'];
			}else{
				$data['store_name'] = $store_data['name'];
				$subject = $store_data['name'].' - '. $this->request->post['title'];
			}
			$data['store_url'] = $this->config->get('config_url').'index.php?route=support/ticket/view&id='.$ticket_id;
			$data['logo'] = $this->config->get('config_url') . 'image/' . $this->config->get('config_logo');
			$data['text_support_detail_heading'] = ",";
			$data['text_support_detail'] = "You have received the new ticket by customer.";
			$data['text_support_subdetail'] = "Click <a href='".$data['store_url']."'>here</a> to see this on the ticket.";
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($data['store_name'], ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setHtml($this->load->view('mail/ticketpost', $data));
			$mail->setText($text);
			$mail->send();

			$url = '';
			$this->response->redirect($this->url->link('support/ticket', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function reply() {
		$this->load->model('support/ticket');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$ticket_reply_id = $this->model_support_ticket->addTicketRely($this->request->post);
			$ticket_id = $this->request->post['ticketid'];
			$store_data = $this->model_support_ticket->getCurrentStore();
			if($this->config->get('config_store_id')==0){
				$data['store_name'] = "Vogueme";
				$subject = 'Vogueme - '. $this->request->post['commenttitle'];
			}else{
				$data['store_name'] = $store_data['name'];
				$subject = $store_data['name'].' - '. $this->request->post['commenttitle'];
			}
			$data['store_url'] = $this->config->get('config_url').'index.php?route=support/ticket/view&id='.$ticket_id;
			$data['logo'] = $this->config->get('config_url') . 'image/' . $this->config->get('config_logo');
			$data['text_support_detail_heading'] = ",";
			$data['text_support_detail'] = "You have received the following reply to your post from customer.";
			$data['text_support_subdetail'] = "Click <a href='".$data['store_url']."'>here</a> to see this on the ticket.";
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($data['store_name'], ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setHtml($this->load->view('mail/ticketpost', $data));
			$mail->setText($text);
			$mail->send();

			$url = '';
			$this->response->redirect($this->url->link('support/ticket/view&id='.$ticket_id, 'token=' . $this->session->data['token'] . $url, true));
		}
	}

	public function view() {
		$id = $this->request->get['id'];
		$data['breadcrumbs'] = array();
		$url = "";
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'View ticket',
			'href' => $this->url->link('support/ticket/view', $url, true)
		);

		$this->load->model('support/ticket');
		$data['heading_title'] = "View Ticket";
		$this->document->setTitle($data['heading_title']);
		$ticketrow = $this->model_support_ticket->getTicketsByID($id);
		$data['replyes'] = $this->model_support_ticket->getTicketsReply();
		if(isset($ticketrow['id'])){
			$data['ticketid'] = $ticketrow['id'];
		}else{
			$data['ticketid'] = "";
		}
		if(isset($ticketrow['title'])){
			$data['title'] = $ticketrow['title'];
		}else{
			$data['title'] = "";
		}
		if(isset($ticketrow['description'])){
			$data['description'] = html_entity_decode($ticketrow['description'], ENT_QUOTES, 'UTF-8');
		}else{
			$data['description'] = "";
		}
		$data['error_message'] = "";
		$data['action'] = $this->url->link('support/ticket/reply');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('support/ticket_info', $data));
	}

	protected function getForm(){
		$this->load->model('support/ticket');
		$data['action'] = $this->url->link('support/ticket/add');
		$data['heading_title'] = "Add Ticket";
		$data['entry_title'] = "Title";
		$data['ticket_number'] = $this->generateCode();
		$data['breadcrumbs'] = array();
		$url = "";
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Support',
			'href' => $this->url->link('support/ticket', $url, true)
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Add Ticket',
			'href' => $this->url->link('support/ticket/add', $url, true)
		);

		if (isset($this->request->post['title'])) {
			$data['title'] = $this->request->post['title'];
		} elseif (!empty($information_info)) {
			$data['title'] = $information_info['title'];
		} else {
			$data['title'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->request->post['description'])) {
			$data['description'] = $this->request->post['description'];
		} elseif (!empty($information_info)) {
			$data['description'] = $information_info['description'];
		} else {
			$data['description'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = array();
		}

		if (isset($this->error['description'])) {
			$data['error_message'] = $this->error['description'];
		} else {
			$data['error_message'] = array();
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('support/addticket', $data));
	}

	protected function validateForm() {
		if (isset($this->request->post['title']) && $this->request->post['title']=="") {
			$this->error['title'] = 'Please enter title';
		}

		if (isset($this->request->post['description']) && $this->request->post['description']=="") {
			$this->error['description'] = 'Please enter description';
		}
		return !$this->error;
	}

	public function generateCode(){
		$this->load->model('support/ticket');
	    $unique =   FALSE;
	    $length =   7;
	    $chrDb  =   array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9');

	    while (!$unique){

	          $str = '';
	          for ($count = 0; $count < $length; $count++){

	              $chr = $chrDb[rand(0,count($chrDb)-1)];

	              if (rand(0,1) == 0){
	                 $chr = strtolower($chr);
	              }
	              if (3 == $count){
	                 $str .= '-';
	              }
	              $str .= $chr;
	          }

	          /* check if unique */
	          //$existingCode = UNIQUE CHECK GOES HERE  
	          $existingCode = $this->model_support_ticket->getTicketUniqueCode($str);
	          if ($existingCode==0){
	             $unique = TRUE;
	          }
	    }
	    return $str;
	}
}
