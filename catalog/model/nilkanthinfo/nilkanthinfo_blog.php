<?php
class ModelNilkanthinfonilkanthinfoBlog extends Model {
	
	public function getTotalBlogs() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "nilkanthinfo_blog b LEFT JOIN " . DB_PREFIX . "nilkanthinfo_blog_description bd ON (b.blog_id = bd.blog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b.status = '1'");
			
		return $query->row['total'];
	}
	
	public function getBlogs($start = 0, $limit = 20, $random = false) {
		if ($random == false)
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "nilkanthinfo_blog b LEFT JOIN " . DB_PREFIX . "nilkanthinfo_blog_description bd ON (b.blog_id = bd.blog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b.status = '1' ORDER BY b.published_date DESC LIMIT " . (int)$start . "," . (int)$limit);
		else
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "nilkanthinfo_blog b LEFT JOIN " . DB_PREFIX . "nilkanthinfo_blog_description bd ON (b.blog_id = bd.blog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b.status = '1' ORDER BY RAND() LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}
	
	public function getLatestBlogs($limit=3) {
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "nilkanthinfo_blog b LEFT JOIN " . DB_PREFIX . "nilkanthinfo_blog_description bd ON (b.blog_id = bd.blog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b.status = '1' ORDER BY b.published_date DESC LIMIT " . (int)$limit);
		

		return $query->rows;
	}
	
	public function getAllBlog(){
		$query = $this->db->query("SELECT b.*,bd.* FROM " . DB_PREFIX . "nilkanthinfo_blog b," . DB_PREFIX . "nilkanthinfo_blog_description bd WHERE b.blog_id=bd.blog_id  AND b.status='1' AND  bd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
			
		return $query->rows;
	}
	
	
	public function getBlog($blog_id){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "nilkanthinfo_blog b LEFT JOIN " . DB_PREFIX . "nilkanthinfo_blog_description bd ON (b.blog_id = bd.blog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b.status = '1' AND b.blog_id = " . $blog_id . " ORDER BY b.published_date DESC ");
		return $query->rows;
	}
	
	public function getTotalComments($blog_id){
		$query = $this->db->query("SELECT COUNT(*) as total FROM " . DB_PREFIX . "nilkanthinfo_blog_comment WHERE blog_id = " .  $blog_id . " AND status = '1'");
		return $query->row['total'];
	}
	
	
	public function getComments($blog_id){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "nilkanthinfo_blog_comment c LEFT JOIN " . DB_PREFIX . "nilkanthinfo_blog_comment_description cd ON (c.comment_id = cd.comment_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c.status = '1' AND c.blog_id = " . $blog_id );
		return $query->rows;
	}

		
	public function addComment($data, $status) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "nilkanthinfo_blog_comment SET status = '".$status."',email_id='".$this->db->escape($data['email'])."', blog_id = '".$this->db->escape($data['blog_id'])."', created = NOW()");

		$comment_id = $this->db->getLastId(); 
		
		$results = $this->db->query("SELECT * FROM " . DB_PREFIX . "language ORDER BY sort_order, name"); 

		foreach ($results->rows as $result) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "nilkanthinfo_blog_comment_description SET comment_id = '" . (int)$comment_id . "', language_id = '".(int)$result['language_id']."', user = '" . $this->db->escape($data['user']) . "', comment = '" . $this->db->escape($data['newcomment']) . "'");
		}

			
	}
}
?>