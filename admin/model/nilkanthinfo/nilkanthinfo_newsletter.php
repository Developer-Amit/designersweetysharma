<?php

class ModelNilkanthinfoNilkanthinfoNewsletter extends Model {

    public function addNewsletter($data) {

        $this->db->query("INSERT INTO " . DB_PREFIX . "nilkanthinfo_newsletter SET email = '" . $this->db->escape($data['email']) . "',  status = '" . (int) $data['status'] . "'");

        $nilkanthinfo_newsletter_id = $this->db->getLastId();

        $this->cache->delete('nilkanthinfo_newsletter');


        return $nilkanthinfo_newsletter_id;
    }

    public function editNewsletter($nilkanthinfo_newsletter_id, $data) {

        $this->db->query("UPDATE " . DB_PREFIX . "nilkanthinfo_newsletter SET email = '" . $this->db->escape($data['email']) . "',   status = '" . (int) $data['status'] . "' WHERE nilkanthinfo_newsletter_id = '" . (int) $nilkanthinfo_newsletter_id . "'");

        $this->cache->delete('nilkanthinfo_newsletter');
    }

    public function deleteNewsletter($nilkanthinfo_newsletter_id) {

        $this->db->query("DELETE FROM " . DB_PREFIX . "nilkanthinfo_newsletter WHERE nilkanthinfo_newsletter_id = '" . (int) $nilkanthinfo_newsletter_id . "'");

        $this->cache->delete('nilkanthinfo_newsletter');
    }

    public function getNewsletter($nilkanthinfo_newsletter_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "nilkanthinfo_newsletter WHERE nilkanthinfo_newsletter_id = '" . (int) $nilkanthinfo_newsletter_id . "'");

        return $query->row;
    }

    public function getNewsletters($data = array()) {
        $sql = "SELECT * FROM " . DB_PREFIX . "nilkanthinfo_newsletter";

        $implode = array();

	
		if (isset($data['status']) && !is_null($data['status'])) {
			$implode[] = "status = " . (int)$data['status'] ;
		}

		

		if ($implode) {
			$sql .= " WHERE " . implode("", $implode);
		}

        $sort_data = array(
            'email',
            'status'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY email";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getTotalNewsletters() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "nilkanthinfo_newsletter");
		
	    return $query->row['total'];
    }

    public function createDatabaseTables() {
        $sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "nilkanthinfo_newsletter` ( ";
        $sql .= "`nilkanthinfo_newsletter_id` int(11) NOT NULL AUTO_INCREMENT, ";
        $sql .= "`email` varchar(96) COLLATE utf8_bin DEFAULT NULL, ";
        $sql .= "`status` int(1) NOT NULL DEFAULT '0', ";
        $sql .= "PRIMARY KEY (`nilkanthinfo_newsletter_id`) ";
        $sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";
        $this->db->query($sql);
    }

    public function dropDatabaseTables() {
        $sql = "DROP TABLE IF EXISTS `" . DB_PREFIX . "nilkanthinfo_newsletter`;";
        $this->db->query($sql);
    }

}
