<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-blog" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-blog" class="form-horizontal">
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
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="blog_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-meta-tags<?php echo $language['language_id']; ?>"><?php echo $entry_meta_tags; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="blog_description[<?php echo $language['language_id']; ?>][meta_tags]" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['meta_tags'] : ''; ?>" placeholder="<?php echo $entry_meta_tags; ?>" id="input-meta-tags<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_meta_tags[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_meta_tags[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="blog_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                    <div class="col-sm-10">
                      <textarea name="blog_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                    </div>
                  </div>
				  
				   <div class="form-group">
						<label class="col-sm-2 control-label" for="input-author"><?php echo $entry_author; ?></label>
						<div class="col-sm-10">
						   <input type="text" name="blog_description[<?php echo $language['language_id']; ?>][author]" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['author'] : ''; ?>" placeholder="<?php echo $entry_author; ?>" id="input-author<?php echo $language['language_id']; ?>" class="form-control" />
					   </div>
					  </div>
					  
					  <div class="form-group">
						<label class="col-sm-2 control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
						<div class="col-sm-10">
						  <input type="text" name="blog_description[<?php echo $language['language_id']; ?>][keyword]" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['keyword'] : ''; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword<?php echo $language['language_id']; ?>" class="form-control" />
						  <?php if ($error_keyword) { ?>
						  <div class="text-danger"><?php echo $error_keyword; ?></div>
						  <?php } ?>                
						</div>
					  </div>
			  
			  
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="tab-pane" id="tab-data">
			
				<!--Image by Nilkanthinfo-->
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                <div class="col-sm-10">
                  <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                </div>
              </div>  
			  
			  <!-----------------------> 
			  
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-published-date"><?php echo $entry_published_date; ?></label>
                <div class="col-sm-3">
                  <div class="input-group date">
                    <input type="text" name="published_date" value="<?php echo $published_date; ?>" placeholder="<?php echo $entry_published_date; ?>" data-date-format="YYYY-MM-DD" id="input-published-date" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
              </div>
			  
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-viewed"><?php echo $entry_viewed; ?></label>
                <div class="col-sm-10">
                   <input type="text" name="viewed" value="<?php echo $viewed; ?>" placeholder="<?php echo $entry_viewed; ?>" id="input-viewed" class="form-control" />
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
			  
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
			  
		   </div>
            
          </div>
        </form>
      </div>
    </div>
  </div>
   <script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({
	height: 300
});
<?php } ?>
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>