<div class="block newsletter_block">
  <h5 class="block-heading"><?php echo $heading_title; ?></h5>
  <div class="block-content">					
  <span class="newsicon"></span>
  	<p id="nilkanthinfo_newsletter_response"></p>
	<div class="news-block">
    	<input style="padding:10px;" type="text" name="nilkanthinfo_newsletter_email" id="nilkanthinfo_newsletter_email" value="" placeholder="Enter Your Email" />
		<div class="news-button">
		<i class="fa fa-paper-plane" aria-hidden="true"></i>
		<input class="button" type="button" name="submit_nilkanthinfo_newsletter" id="submit_nilkanthinfo_newsletter" value="Subscribe" onclick="return ValidateEmail()" />
  	</div>
	</div>
  </div>
</div>
<script>
function ValidateEmail(mail)   
{  
	mail = document.getElementById("nilkanthinfo_newsletter_email").value;
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))  
	{  
		AjaxNewsletterRequest();
		return (true) ; 
	}  
		alert("You have entered an invalid email address!")  
		return (false)  
	}  
</script>
<script>
function AjaxNewsletterRequest()
{
	email = document.getElementById("nilkanthinfo_newsletter_email").value;
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
			document.getElementById("nilkanthinfo_newsletter_response").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET","index.php?route=module/nilkanthinfo_newsletter/submitnilkanthinfo_newsletter&email="+email,true);
	xmlhttp.send();
}
</script>