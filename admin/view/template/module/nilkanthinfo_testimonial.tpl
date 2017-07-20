<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
	  		
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_admin_approved; ?></label>
            <div class="col-sm-10">
			
			 <?php if (isset($testimonial_admin_approved)) { ?>
	          <input type="checkbox" name="testimonial_admin_approved" value="1" checked="checked" />
	          <?php } else { ?>
	          <input type="checkbox" name="testimonial_admin_approved" value="0"  />
	          <?php } ?>
		
             <!-- <?php if (isset($testimonial_admin_approved)) {
			  if($testimonial_admin_approved==0){ ?>
              <input type="checkbox" name="testimonial_admin_approved" value="0" checked="checked" class="form-control" />
              <?php } else { ?>
              <input type="checkbox" name="testimonial_admin_approved" value="0" class="form-control" />
              <?php }
			  } ?>-->
             </div>
          </div>
		  
		  <?php if (!isset($testimonial_default_rating)) $testimonial_default_rating = '3'; ?>
		  
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_default_rating; ?></label>
            <div class="col-sm-10"><span><?php echo $entry_bad; ?></span>
              <input type="radio" name="testimonial_default_rating" value="1" style="margin: 0;" class="form-horizontal" <?php if ( $testimonial_default_rating == 1 ) echo 'checked="checked"'; ?>  />
              &nbsp;
              <input type="radio" name="testimonial_default_rating" value="2" style="margin: 0;" class="form-horizontal" <?php if ( $testimonial_default_rating == 2 ) echo 'checked="checked"';?> />
              &nbsp;
              <input type="radio" name="testimonial_default_rating" value="3" style="margin: 0;" class="form-horizontal" <?php if ( $testimonial_default_rating == 3 ) echo 'checked="checked"';?> />
              &nbsp;
              <input type="radio" name="testimonial_default_rating" value="4" style="margin: 0;" class="form-horizontal" <?php if ( $testimonial_default_rating == 4 ) echo 'checked="checked"';?> />
              &nbsp;
              <input type="radio" name="testimonial_default_rating" value="5" style="margin: 0;" class="form-horizontal" <?php if ( $testimonial_default_rating == 5 ) echo 'checked="checked"';?> />
              &nbsp; <span><?php echo $entry_good; ?></span> 
            </div>
          </div>
		  
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_send_to_admin; ?></label>
            <div class="col-sm-10">
			 <?php if (isset($testimonial_send_to_admin)) { ?>
	          <input type="checkbox" name="testimonial_send_to_admin" value="1" checked="checked" />
	          <?php } else { ?>
	          <input type="checkbox" name="testimonial_send_to_admin" value="0" />
	          <?php } ?>
			
            <!-- <?php if (isset($testimonial_send_to_admin)) { 
			 if($testimonial_send_to_admin==0){?>
              <input type="checkbox" name="testimonial_send_to_admin" value="0" checked="checked" class="form-horizontal"/>
              <?php } else { ?>
              <input type="checkbox" name="testimonial_send_to_admin" value="0" class="form-horizontal" />
              <?php }
			  } ?>-->
            </div>
          </div>
		  
		 <!-- <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_all_page_limit; ?></label>
            <div class="col-sm-10">
            <input type="text" name="testimonial_all_page_limit" class="form-horizontal" value="<?php if (isset($testimonial_all_page_limit)) echo $testimonial_all_page_limit; else echo "20"; ?>" size="3" />
            </div>
          </div>-->
		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
		  
        		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
		  
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
		  
        </form>
      </div>
    </div>
  </div>
  
</div>
<?php echo $footer; ?>
