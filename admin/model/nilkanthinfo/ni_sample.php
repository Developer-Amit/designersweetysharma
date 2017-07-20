<?php
class ModelNilkanthinfoNiSample extends Model {
	public function install() {
	
		$file = DIR_APPLICATION . 'nilkanthinfo/query.sql';
		
		if (!file_exists($file)) {
			exit('Could not load sql file: ' . $file);
		}
		$lines = file($file);
		if ($lines) {
			$sql = '';
		
			
			for($i=0;$i<sizeof($lines);$i++) {
			
				if ($lines[$i] && (substr($lines[$i], 0, 2) != '--') && (substr($lines[$i], 0, 1) != '#')) {
					$sql .= $lines[$i];
					
					if (preg_match('/;\s*$/', $lines[$i])) {
						$sql = str_replace("DROP TABLE IF EXISTS `oc_", "DROP TABLE IF EXISTS `" .  DB_PREFIX, $sql);
						$sql = str_replace("CREATE TABLE `oc_", "CREATE TABLE `" .  DB_PREFIX, $sql);
						$sql = str_replace("INSERT INTO `oc_", "INSERT INTO `" .  DB_PREFIX, $sql);
					
						$this->db->query($sql);
					
						$sql = '';
					}
				}
			}
			
			
			
		}
	}
}