


<!--write testimonial page for testimonial-->
<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="NI_istestimonial <?php echo $class; ?>"><?php echo $content_top; ?>
<h1><?php echo $heading_title; ?></h1>   
   
   

	
  	
  	<p><?php echo $text_conditions ?></p>
  
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="testimonial">
		<div class="content">
        <table width="100%">
          <tr class="form-group">
            <td><label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label><br />
               <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				 <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" /></td>
          </tr>
		  
		  <tr>
            <td><?php echo $entry_title ?><br />
              <input type="text" name="title" value="<?php echo $title; ?>" size = 90 />
              <?php if ($error_title) { ?>
              <span class="error"><?php echo $error_title; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_enquiry ?><span class="required">*</span><br />
              <textarea name="description" style="width: 99%;" rows="10"><?php echo $description; ?></textarea><br />

              <?php if ($error_enquiry) { ?>
              <span class="error"><?php echo $error_enquiry; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_name ?><br />
              <input type="text" name="name" value="<?php echo $name; ?>" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?>
		</td>
          </tr>
		  
		    <!--Image by Nilkanthinfo-->
<!--				 <div class="form-group">
                <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                <div class="col-sm-10">
                 <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				 <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                </div>
              </div> --> 
			  
			 
          <tr>
             <td><?php echo $entry_city ?><br />
			<input type="text" name="city" value="<?php echo $city; ?>" />
		</td>
          </tr>
          <tr>
            <td>
		  <?php echo $entry_email ?><br />
              <input type="text" name="email" value="<?php echo $email; ?>" />
              <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><br><?php echo $entry_rating; ?> &nbsp;&nbsp;&nbsp; <span><?php echo $entry_bad; ?></span>&nbsp;
        		<input type="radio" name="rating" value="1" style="margin: 0;" <?php if ( $rating == 1 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="2" style="margin: 0;" <?php if ( $rating == 2 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="3" style="margin: 0;" <?php if ( $rating == 3 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="4" style="margin: 0;" <?php if ( $rating == 4 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="rating" value="5" style="margin: 0;" <?php if ( $rating == 5 ) echo 'checked="checked"';?> />
        		&nbsp; <span><?php echo $entry_good; ?></span><br /><br>

          	</td>
          </tr>
          <tr>
            <td>
              <?php if ($error_captcha) { ?>
              <span class="error"><?php echo $error_captcha; ?></span>
              <?php } ?>
               
              <img src="index.php?route=captcha/basic_captcha/captcha" /> <br>
		<?php echo $entry_captcha; ?><span class="required">*</span> <br>

              <input type="text" name="captcha" value="<?php echo $captcha; ?>" /><br>
		</td>
          </tr>
        </table>
	  </div>
	  
      <div class="buttons clearfix">
        <table width=100%>
          <tr>
            <td width=50%><a  onclick="$('#testimonial').submit();" class="button btn btn-default"><span><?php echo $button_send; ?></span></a></td>
			<td align="right"><a class="button btn btn-primary" href="<?php echo $showall_url;?>"><span><?php echo $show_all; ?></span></a></td>
          </tr>
        </table>

      </div>
    </form>
  
      
	  <?php echo $content_bottom; ?>
	  </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

