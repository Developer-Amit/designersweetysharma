<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-nilkanthinfo_blog" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-nilkanthinfo_blog" class="form-horizontal">
			<input type="hidden" name="name" value="Blog"  id="input-name" class="form-control" />
         
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
		  
		  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-top"><span data-toggle="tooltip" title="<?php echo $help_top; ?>"><?php echo $entry_top; ?></span></label>
                <div class="col-sm-10">
                  <div class="checkbox">
                    <label>
                      <?php if ($top) { ?>
                      <input type="checkbox" name="top" value="1" checked="checked" id="input-top" />
                      <?php } else { ?>
                      <input type="checkbox" name="top" value="1" id="input-top" />
                      <?php } ?>
                      &nbsp; </label>
                  </div>
                </div>
              </div>
			  
		   <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-blog-home-width"><?php echo $entry_image_blog_home; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_blog_home_width" value="<?php if(isset($config_image_blog_home_width)){ echo $config_image_blog_home_width;}  ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-blog-home-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_blog_home_height" value="<?php if(isset($config_image_blog_home_height)) { echo $config_image_blog_home_height; } ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_blog_home) { ?>
                  <div class="text-danger"><?php echo $error_image_blog_home; ?></div>
                  <?php } ?>
                </div>
              </div>
			  
		  <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-blog-leftcolumn-width"><?php echo $entry_image_blog_leftcolumn; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_blog_leftcolumn_width" value="<?php if(isset($config_image_blog_leftcolumn_width)){ echo $config_image_blog_leftcolumn_width;} ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-blog-leftcolumn-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_blog_leftcolumn_height" value="<?php if(isset($config_image_blog_leftcolumn_height)) { echo $config_image_blog_leftcolumn_height; } ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_blog_leftcolumn) { ?>
                  <div class="text-danger"><?php echo $error_image_blog_leftcolumn; ?></div>
                  <?php } ?>
                </div>
              </div>
			  
		 <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-blog-detail-width"><?php echo $entry_image_blog_detail; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_blog_detail_width" value="<?php if(isset($config_image_blog_detail_width)) { echo $config_image_blog_detail_width; } ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-blog-detail-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_blog_detail_height" value="<?php if(isset($config_image_blog_detail_height)) { echo $config_image_blog_detail_height; } ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_blog_detail) { ?>
                  <div class="text-danger"><?php echo $error_image_blog_detail; ?></div>
                  <?php } ?>
                </div>
              </div>
		  
		  <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-blog-list-width"><?php echo $entry_image_blog_list; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_blog_list_width" value="<?php if(isset($config_image_blog_list_width)) { echo $config_image_blog_list_width; } ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-blog-list-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_blog_list_height" value="<?php if(isset($config_image_blog_list_height)) { echo $config_image_blog_list_height; } ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_blog_list) { ?>
                  <div class="text-danger"><?php echo $error_image_blog_list; ?></div>
                  <?php } ?>
                </div>
              </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>