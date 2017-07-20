<?php
class ModelNilkanthinfoNilkanthinfoNewsletter extends Model 
{ 
	public function SubmitNewsletter($email) 
	{
		$query =  $this->db->query("select email from " . DB_PREFIX . "nilkanthinfo_newsletter where email = '".$this->db->escape($email)."' ");
		if($query->row) 
		{
			return "Already Subscribed!!!";
		}		
 		$this->db->query("insert into " . DB_PREFIX . "nilkanthinfo_newsletter set email = '".$this->db->escape($email)."' , status = 0");
		return "Subscribed Successfully!!!";
	}
}
?>