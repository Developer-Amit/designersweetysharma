<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>



<!--Edited by Nilkanthinfo-->
<?php if($popup_newsletter == 'on'){?>
<script type="text/javascript">
$(document).ready(function(){
	
  		$.colorbox({inline:true, href:".ajax",className:'NI_newsletter_popup', transition:"fade", width:"600px", height:"410px"});
 	
});


</script>
<div style='display:none'>
	<div class='ajax' >
		<div class="block newsletter_popup_box" style="background:transparent url(image/<?php echo $image; ?>)  <?php echo $position; ?> <?php echo $repeat; ?> ;" >
			<div class="left_block">
				<div class="box-heading"><?php echo $heading; ?></div>
				<div class="box-description"><?php echo $description; ?></div>
				<div class="box-content">
					<p id="nilkanthinfo_newsletter_response1"></p>
					<input style="padding:10px;" type="text" name="nilkanthinfo_newsletter_email" id="nilkanthinfo_newsletter_email1" value=""  placeholder="Enter Your Email" />
					<input class="button" type="button" name="submit_nilkanthinfo_newsletter" id="submit_nilkanthinfo_newsletter1" value="Subscribe" onclick="return ValidateEmail1(document.getElementById('nilkanthinfo_newsletter_email1').value)" />
				</div>
			</div>
			<div class="right_block">
				<div class="image"  ></div>
			</div>
			
			
			
		</div>
	</div>
</div>
<script type="text/javascript">
function ValidateEmail1(mail)   
{  
	mail = document.getElementById("nilkanthinfo_newsletter_email1").value;
	
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))  
	{  
		AjaxNewsletterRequest1();
		return (true) ; 
	}  	

		alert("You have entered an invalid email address!")  
		return (false)  
	}  
</script>
<script>
function AjaxNewsletterRequest1()
{
	email = document.getElementById("nilkanthinfo_newsletter_email1").value;
	var xmlhttp;
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("nilkanthinfo_newsletter_response1").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET","index.php?route=module/nilkanthinfo_newsletter/submitnilkanthinfo_newsletter&email="+email,true);
	xmlhttp.send();
}
</script>
<?php } ?>

<?php echo $footer; ?>