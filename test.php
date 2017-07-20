<!--<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=537097489815055";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script async defer src="//assets.pinterest.com/js/pinit.js"></script>
</head>
<body>

<div>

<div id="fb-root"></div>
<span>Loading</span>
<div class="fb-page" data-href="https://www.facebook.com/mytoch/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/mytoch/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/mytoch/">TOCH</a></blockquote></div>
</div>

<a class="twitter-timeline" data-width="350" data-height="500" data-theme="light" href="https://twitter.com/my_toch">Tweets by my_toch</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<a data-pin-do="embedUser" data-pin-board-width="350" data-pin-scale-height="500" data-pin-scale-width="350" href="https://in.pinterest.com/mytoch/vogueme-interactive-videos/"></a>

</body>
</html>-->


<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
function randomString(len, charSet) {
    charSet = charSet || 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var randomString = '';
    for (var i = 0; i < len; i++) {
        var randomPoz = Math.floor(Math.random() * charSet.length);
        randomString += charSet.substring(randomPoz,randomPoz+1);
    }
    return randomString;
}
$(document).ready(function(){
    var oauth_nonce = randomString(5);
    var oauth_timestamp = $.now();
    var oauth_consumer_key = "dj0yJmk9TmFwZmh5YmVwZlhFJmQ9WVdrOWRVaEVRMVJhTkcwbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD00OA--";
    var oauth_signature_method 	= "plaintext";
    var oauth_signature = "4eca998a2b32de587d7f64c026b18b3b546ad051";
   var main_url = "//api.login.yahoo.com/oauth/v2/get_request_token?oauth_nonce="+oauth_nonce+"&oauth_timestamp="+oauth_timestamp+"&oauth_consumer_key="+oauth_consumer_key+"&oauth_signature_method=plaintext&oauth_signature="+oauth_signature+"&oauth_version=1.0&xoauth_lang_pref=en-us&oauth_callback=http://linkites.com/meteor/response.php"    
console.log(main_url,"main_url");
     $("button").click(function(){
        $.ajax({

		    url: main_url,
		    type: 'POST',
		    crossDomain: true,
		    success: function() { alert("Success"); },
		    error: function() { alert('Failed!'); },
		    
		});
    });
});
</script>
</head>
<body>

<button>Send an HTTP POST request to a page and get the result back</button>

</body>
</html>
