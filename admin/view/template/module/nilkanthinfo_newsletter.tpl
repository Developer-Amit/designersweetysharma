<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-newsletter" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Only 1 sub module of Nilkanthinfo Newsletter module can be created.
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-newsletter" class="form-horizontal">
		 <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
         </ul>
			    
		<div class="tab-content"> 
          <div class="tab-pane active" id="tab-general">
		   <ul class="nav nav-tabs" id="language">
              <?php foreach ($languages as $language) { ?>
              <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
              <?php } ?>
            </ul>
            <div class="tab-content">
              <?php foreach ($languages as $language) { ?>
              <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
			  
				  <input type="hidden" name="name" value="Footer" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
				  
				   <!--set as popup?-->
				  <div class="form-group">
					<label class="col-sm-2 control-label" for="is-popup"><?php echo $entry_popup; ?></label>
					<div class="col-sm-10">
					  <input type="checkbox" id="is_popup<?php echo $language['language_id']; ?>" name="module_description[<?php echo $language['language_id']; ?>][is_popup]" <?php if($is_popup[$language['language_id']]=='on'){echo 'checked';}else{echo '';} ?>/>
					</div>
				  </div>
				  
				  <div id="popup_section<?php echo $language['language_id']; ?>" style="<?php if($is_popup[$language['language_id']]=='on'){echo '';}else{echo 'display:none';} ?>">
					  <!--heading-->
					  	  <div class="form-group">
						<label class="col-sm-2 control-label" for="input-heading"><?php echo $entry_heading; ?></label>
						<div class="col-sm-10">
						  <input type="text" name="module_description[<?php echo $language['language_id']; ?>][heading]" value="<?php echo $heading[$language['language_id']]; ?>" placeholder="<?php echo $entry_heading; ?>" id="input-heading<?php echo $language['language_id']; ?>" class="form-control" />
						</div>
					  </div>
					  
					  <!--description-->
					 	  <div class="form-group">
						<label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?></label>
						<div class="col-sm-10">
						  <textarea name="module_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="description<?php echo $language['language_id']; ?>" class="form-control" ><?php echo $description[$language['language_id']]; ?></textarea>
						</div>
					  </div>
					  
					  <!--Background image-->
					  	  <div class="form-group">
						<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
						<div class="col-sm-10"> 
							<a href="" id="thumb-image<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb[$language['language_id']]; ?>" alt="" title="" data-placeholder="<?php echo $placeholder[$language['language_id']]; ?>" /></a>
						  <input type="hidden" name="module_description[<?php echo $language['language_id']; ?>][image]" value="<?php echo $image[$language['language_id']]; ?>" id="input-image<?php echo $language['language_id']; ?>" />
						</div>
					  </div>
					  
					  <!--Backgroung image position-->
					  	  <div class="form-group">
							<label class="col-sm-2 control-label" for="input-position"><?php echo $entry_position; ?></label>
							<div class="col-sm-10">
							  <select name="module_description[<?php echo $language['language_id']; ?>][position]" id="position<?php echo $language['language_id']; ?>" class="form-control">
								  <option value="left top" <?php if($position[$language['language_id']] == 'left top'){echo 'selected';} ?>><?php echo $entry_lefttop; ?></option>
								  <option value="left center" <?php if($position[$language['language_id']] == 'left center'){echo 'selected';} ?>><?php echo $entry_leftcenter; ?></option>
								  <option value="left bottom" <?php if($position[$language['language_id']] == 'left bottom'){echo 'selected';} ?>><?php echo $entry_leftbottom; ?></option>
								  <option value="center top" <?php if($position[$language['language_id']] == 'center top'){echo 'selected';} ?>><?php echo $entry_centertop; ?></option>
								  <option value="center center" <?php if($position[$language['language_id']] == 'center center'){echo 'selected';} ?>><?php echo $entry_centercenter; ?></option>
								  <option value="center bottom" <?php if($position[$language['language_id']] == 'center bottom'){echo 'selected';} ?>><?php echo $entry_centerbottom; ?></option>
								  <option value="right top" <?php if($position[$language['language_id']] == 'right top'){echo 'selected';} ?>><?php echo $entry_righttop; ?></option>
								  <option value="right center" <?php if($position[$language['language_id']] == 'right center'){echo 'selected';} ?>><?php echo $entry_rightcenter; ?></option>
								  <option value="right bottom" <?php if($position[$language['language_id']] == 'right bottom'){echo 'selected';} ?>><?php echo $entry_rightbottom; ?></option>
							  </select>
							</div>
					 	 </div>
					  
					  <!--Backgroung image repeat-->
					  	<div class="form-group">
							<label class="col-sm-2 control-label" for="input-repeat"><?php echo $entry_repeat; ?></label>
							<div class="col-sm-10">
							  <select name="module_description[<?php echo $language['language_id']; ?>][repeat]" id="repeat<?php echo $language['language_id']; ?>" class="form-control">
								  <option value="repeat" <?php if($repeat[$language['language_id']] == 'repeat'){echo 'selected';} ?>><?php echo $entry_repeatopt; ?></option>
								  <option value="no-repeat" <?php if($repeat[$language['language_id']] == 'no-repeat'){echo 'selected';} ?>><?php echo $entry_norepeat; ?></option>
							  </select>
							</div>
					 	 </div>
					  
					  
				  </div>
				  
				  
		  
		  	</div>
			   <?php } ?>
            </div>
          </div>
		  
		  
		  <div class="tab-pane" id="tab-data">
		  	<!--status-->  
				  <div class="form-group">
					<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
					<div class="col-sm-10">
					  <select name="status" id="input-status" class="form-control">
						<?php if ($status) { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
						<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<?php } ?>
					  </select>
					</div>
				  </div>
		  </div>
		</div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
<?php foreach ($languages as $language) { ?>
$(document).ready(function(){
	
	if($('#is_popup<?php echo $language['language_id']; ?>').prop('checked')){
		$('#popup_section<?php echo $language['language_id']; ?>').css('display','block');
	}
	else{
		$('#popup_section<?php echo $language['language_id']; ?>').css('display','none');
	}
});

$("#is_popup<?php echo $language['language_id']; ?>").click(function(){

	if($('#is_popup<?php echo $language['language_id']; ?>').prop('checked')){
		$('#popup_section<?php echo $language['language_id']; ?>').css('display','block');
	}
	else{
		$('#popup_section<?php echo $language['language_id']; ?>').css('display','none');
	}
});
<?php } ?>
$('#language a:first').tab('show');
</script>
<?php echo $footer; ?>
<!--------------------------------->

