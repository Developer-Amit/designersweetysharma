<?php
class ModelNilkanthinfoNiBlog extends Model {
	
	public function addBlog($data) {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "nilkanthinfo_blog SET  `published_date` = NOW() , `status` = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', `viewed` = '" . (int)$data['viewed'] . "'");
		
		$blog_id = $this->db->getLastId();
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "nilkanthinfo_blog SET image = '" . $this->db->escape($data['image']) . "' WHERE blog_id = '" . (int)$blog_id . "'");
		}
	
		foreach ($data['blog_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "nilkanthinfo_blog_description SET blog_id = '" . (int)$blog_id . "', language_id = '" . (int)$language_id . "',`blog_name` = '" . $this->db->escape($value['name']) . "', `description` = '" . $this->db->escape($value['description']) . "',`meta_tag_description` = '" . $this->db->escape($value['meta_description']) . "', `meta_tag_keyword` = '" . $this->db->escape($value['meta_keyword']) . "', `tags` = '" . $this->db->escape($value['meta_tags']) . "', `author` = '" . $this->db->escape($value['author']) . "', `keyword` = '" . $this->db->escape($value['keyword']) . "'");
		}
	}

	public function editBlog($blog_id, $data) {
	
		
		$this->db->query("UPDATE " . DB_PREFIX . "nilkanthinfo_blog SET  `status` = '" . (int)$data['status'] . "',sort_order = '" . (int)$data['sort_order'] . "', `viewed` = '" . (int)$data['viewed'] . "' WHERE `blog_id` = '" . (int)$blog_id . "'");
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "nilkanthinfo_blog SET image = '" . $this->db->escape($data['image']) . "' WHERE blog_id = '" . (int)$blog_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "nilkanthinfo_blog_description WHERE blog_id = '" . (int)$blog_id . "'");
		
		foreach ($data['blog_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "nilkanthinfo_blog_description SET blog_id = '" . (int)$blog_id . "', language_id = '" . (int)$language_id . "',`blog_name` = '" . $this->db->escape($value['name']) . "', `description` = '" . $this->db->escape($value['description']) . "',`meta_tag_description` = '" . $this->db->escape($value['meta_description']) . "', `meta_tag_keyword` = '" . $this->db->escape($value['meta_keyword']) . "', `tags` = '" . $this->db->escape($value['meta_tags']) . "', `author` = '" . $this->db->escape($value['author']) . "', `keyword` = '" . $this->db->escape($value['keyword']) . "'");
		}

	}

	public function deleteBlog($blog_id) {
	
		$this->db->query("DELETE FROM " . DB_PREFIX . "nilkanthinfo_blog WHERE blog_id = '" . (int)$blog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "nilkanthinfo_blog_description WHERE blog_id = '" . (int)$blog_id . "'");
	
	}

	public function getBlog($blog_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "nilkanthinfo_blog WHERE blog_id = '" . (int)$blog_id . "'");

		return $query->row;
	}

	public function getBlogs($data = array()) {
		$sql = "SELECT b.*,bd.blog_name FROM " . DB_PREFIX . "nilkanthinfo_blog as b,". DB_PREFIX . "nilkanthinfo_blog_description as bd WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b.blog_id = bd.blog_id "  ;
		
		$sql .= " GROUP BY b.blog_id";

		$sort_data = array(
			'bd.blog_name',
			
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY bd.blog_name";
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

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalBlogs() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "nilkanthinfo_blog");

		return $query->row['total'];
	}
	
	public function getComment($comment_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "nilkanthinfo_blog_comment WHERE comment_id = '" . (int)$comment_id . "'");

		return $query->row;
	}
	
	public function getComments($data = array()) {
		$sql = "SELECT bc.*,bd.blog_name,cd.* FROM " . DB_PREFIX . "nilkanthinfo_blog_comment as bc,". DB_PREFIX . "nilkanthinfo_blog_description as bd,". DB_PREFIX . "nilkanthinfo_blog_comment_description as cd WHERE  bc.comment_id = cd.comment_id AND bc.blog_id = bd.blog_id  AND  cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND  bd.language_id = '" . (int)$this->config->get('config_language_id') . "'" ;
		
		//$sql .= " ";

		$sort_data = array(
			'cd.comment',
			
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY cd.comment";
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

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	public function getTotalComments() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "nilkanthinfo_blog_comment");

		return $query->row['total'];
	}
	
	public function editComment($comment_id, $data) {
	
		
		$this->db->query("UPDATE " . DB_PREFIX . "nilkanthinfo_blog_comment  `status` = '" . (int)$data['status'] . "' WHERE `comment_id` = '" . (int)$comment_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "nilkanthinfo_blog_comment_description WHERE comment_id = '" . (int)$comment_id . "'");
		
		foreach ($data['comment_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "nilkanthinfo_blog_comment_description SET comment_id = '" . (int)$comment_id . "', language_id = '" . (int)$language_id . "',`comment` = '" . $this->db->escape($value['comment']) . "', `user` = '" . $this->db->escape($value['user']) . "'");
		}

	}

	public function deleteComment($comment_id) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "nilkanthinfo_blog_comment WHERE comment_id = '" . (int)$comment_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "nilkanthinfo_blog_comment_description WHERE comment_id = '" . (int)$comment_id . "'");
	
	}
	
	public function getBlogDescriptions($blog_id) {
		$blog_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "nilkanthinfo_blog_description WHERE blog_id = '" . (int)$blog_id . "'");

		foreach ($query->rows as $result) {
			$blog_description_data[$result['language_id']] = array(
				'name'       => $result['blog_name'],
				'description' => $result['description'],
				'meta_tags' => $result['tags'],
				'meta_description' => $result['meta_tag_description'],
				'meta_keyword' => $result['meta_tag_keyword'],
				'author' => $result['author'],
				'keyword' => $result['keyword'],
				
				
			);
		}
		
		return $blog_description_data;
	}
	
	
	public function getCommentDescriptions($comment_id) {
		$comment_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "nilkanthinfo_blog_comment_description WHERE comment_id = '" . (int)$comment_id . "'");

		foreach ($query->rows as $result) {
			$comment_description_data[$result['language_id']] = array(
				'comment'       => $result['comment'],
				'user'          => $result['user'],
			);
		}
		
		return $comment_description_data;
	}
	
	
	public function createDatabaseTables() {
    	$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "nilkanthinfo_blog` ( ";
        $sql .= "`blog_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`image` varchar(256) COLLATE utf8_general_ci NULL, ";
	  	$sql .= "`published_date` datetime COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`status` tinyint(1) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`sort_order` int(11) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`viewed` int(15) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "PRIMARY KEY (`blog_id`) ";
        $sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";
        $this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "nilkanthinfo_blog_description` ( ";
        $sql .= "`blog_description_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`blog_id` int(11) NOT NULL , ";
		$sql .= "`language_id` int(11) NOT NULL , ";
        $sql .= "`blog_name` varchar(96) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`description` text COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`meta_tag_description` varchar(255) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`meta_tag_keyword` varchar(255) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`tags` text COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`author` varchar(255) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`keyword` text COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "PRIMARY KEY (`blog_description_id`) ";
        $sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";
        $this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "nilkanthinfo_blog_comment` ( ";
        $sql .= "`comment_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`blog_id` int(11) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`created` datetime COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`email_id` text COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`status` tinyint(1) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "PRIMARY KEY (`comment_id`) ";
        $sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";
        $this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "nilkanthinfo_blog_comment_description` ( ";
        $sql .= "`comment_description_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`language_id` int(11) NOT NULL , ";
        $sql .= "`comment_id` int(11) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`comment` text COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`user` varchar(255) COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "PRIMARY KEY (`comment_description_id`) ";
        $sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";
        $this->db->query($sql);
    }

    public function dropDatabaseTables() {
 		$sql = "DROP TABLE IF EXISTS `" . DB_PREFIX . "nilkanthinfo_blog`;";
        $this->db->query($sql);
		
		$sql = "DROP TABLE IF EXISTS `" . DB_PREFIX . "nilkanthinfo_blog_description`;";
        $this->db->query($sql);
		
		$sql = "DROP TABLE IF EXISTS `" . DB_PREFIX . "nilkanthinfo_blog_comment`;";
        $this->db->query($sql);
		
		$sql = "DROP TABLE IF EXISTS `" . DB_PREFIX . "nilkanthinfo_blog_comment_description`;";
        $this->db->query($sql);
    }
}
