<?php
session_start();
include("config.php");

if(DB_DRIVER == 'mysqli'){
	$mysql_con = mysqli_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD,DB_DATABASE,DB_PORT);
	//mysqli_query($mysql_con,"CREATE TABLE IF NOT EXISTS ". DB_PREFIX . "fb_logins (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,fb_id LONGTEXT,customer_id LONGTEXT,fb_ts TIMESTAMP)");
} else {
	$mysql_con = mysql_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD);
	$db_sel = mysql_select_db(DB_DATABASE, $mysql_con);
}


if(isset($_POST['fb_login'])){
	if(DB_DRIVER == 'mysqli'){


$chk_user = mysqli_query($mysql_con,"select * from ". DB_PREFIX . "fb_logins where fb_id='".$_POST['fb_id']."'");

if(mysqli_num_rows($chk_user)>0){
	$sel_user = mysqli_fetch_assoc(mysqli_query($mysql_con,"SELECT * FROM " . DB_PREFIX . "fb_logins where fb_id='".$_POST['fb_id']."'"));
	$sel_user_details = mysqli_fetch_assoc(mysqli_query($mysql_con,"SELECT * FROM " . DB_PREFIX . "customer where customer_id='".$sel_user['customer_id']."'"));
	$_SESSION['default']['customer_id'] = $sel_user['customer_id'];
	$_SESSION['customer_id'] = $sel_user['customer_id'];
	
	if(trim($sel_user_details['email'])=='' || trim($sel_user_details['telephone'])==''){
		echo json_encode(array("a"=>"profile_pass","firstname"=>$sel_user_details['firstname'],"lastname"=>$sel_user_details['lastname']));
	} else {
		echo json_encode(array("a"=>"log_pass"));
	}
} else {
	$explode_name = explode(" ",$_POST['fb_name']);
	mysqli_query($mysql_con,"INSERT INTO " . DB_PREFIX . "customer(firstname,lastname,email,status,customer_group_id,approved,password) VALUES('".$explode_name[0]."','".$explode_name[1]."','".$_POST['fb_email']."',1,1,1,'".md5(uniqid())."')");
	$last_id = $mysql_con->insert_id;
	mysqli_query($mysql_con,"INSERT INTO " . DB_PREFIX . "fb_logins(fb_id,customer_id) VALUES('".$_POST['fb_id']."','".$last_id."')");
	$_SESSION['default']['customer_id'] = $last_id;
	$_SESSION['customer_id'] = $last_id;
	echo json_encode(array("a"=>"reg_pass","firstname"=>$explode_name[0],"lastname"=>$explode_name[1],"email"=>$_POST['fb_email']));
}

} else {
	
	$chk_user = mysql_query("select * from ". DB_PREFIX . "fb_logins where fb_id='".$_POST['fb_id']."'");
	
if(mysql_num_rows($chk_user)>0){
	$sel_user = mysql_fetch_assoc(mysql_query("SELECT * FROM " . DB_PREFIX . "fb_logins where fb_id='".$_POST['fb_id']."'"));
	$sel_user_details = mysql_fetch_assoc(mysql_query("SELECT * FROM " . DB_PREFIX . "customer where customer_id='".$sel_user['customer_id']."'"));
	$_SESSION['default']['customer_id'] = $sel_user['customer_id'];
	$_SESSION['customer_id'] = $sel_user['customer_id'];
	
	if(trim($sel_user_details['email'])=='' || trim($sel_user_details['telephone'])==''){
		echo json_encode(array("a"=>"profile_pass"));
	} else {
		echo json_encode(array("a"=>"log_pass"));
	}
} else {
	$explode_name = explode(" ",$_POST['fb_name']);
	mysql_query("INSERT INTO " . DB_PREFIX . "customer(firstname,lastname,email,status,customer_group_id,approved,password) VALUES('".$explode_name[0]."','".$explode_name[1]."','".$_POST['fb_email']."',1,1,1,'".md5(uniqid())."')");
	$last_id = $mysql_con->insert_id;
	mysql_query("INSERT INTO " . DB_PREFIX . "fb_logins(fb_id,customer_id) VALUES('".$_POST['fb_id']."','".$last_id."')");
	$_SESSION['default']['customer_id'] = $last_id;
	$_SESSION['customer_id'] = $last_id;
	echo json_encode(array("a"=>"reg_pass","firstname"=>$explode_name[0],"lastname"=>$explode_name[1],"email"=>$_POST['fb_email']));
}
	
	
}
} elseif(isset($_POST['user_form']))
{
	if(trim($_POST['firstname'])=='' || trim($_POST['lastname'])=='' || trim($_POST['email'])=='' || 
	trim($_POST['telephone'])==''){
		echo json_encode(array("user_data"=>"all_fields"));
	} elseif(!filter_var($_POST['email'],FILTER_VALIDATE_EMAIL) !== false){
		echo json_encode(array("user_data"=>"inv_email"));
	} else {
		if(DB_DRIVER == 'mysqli'){
			mysqli_query($mysql_con,"UPDATE ". DB_PREFIX . "customer set firstname='".addslashes($_POST['firstname'])."',lastname='".addslashes($_POST['lastname'])."',email='".addslashes($_POST['email'])."',telephone='".addslashes(
			$_POST['telephone'])."' where customer_id='".$_SESSION['customer_id']."'");
			echo json_encode(array("user_data"=>"update_success"));
		} else {
			mysql_query("UPDATE ". DB_PREFIX . "customer set firstname='".addslashes($_POST['firstname'])."',lastname='".addslashes($_POST['lastname'])."',email='".addslashes($_POST['email'])."',telephone='".addslashes($_POST['telephone'])."' where customer_id='".$_SESSION['customer_id']."'");
			echo json_encode(array("user_data"=>"update_success"));
		}
	}
}


?>