<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-setting" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-sample" data-toggle="tab"><?php echo $tab_sample; ?></a></li>
			<li><a href="#tab-compress" data-toggle="tab"><?php echo $tab_compress; ?></a></li>
			<li><a href="#tab-color" data-toggle="tab"><?php echo $tab_color; ?></a></li>
          </ul>
          <div class="tab-content">
            <!--First Tab General-->
            <div class="tab-pane  active" id="tab-general">
			
              <div class="form-group">
              <label class="col-sm-2 control-label" for="right_click"><span data-toggle="tooltip" title="<?php echo $help_right_click; ?>"><?php echo $entry_right_click; ?></span></label>
                 <div class="col-sm-2">
				
					
					<select id="default_font_right_click" name="default_font_right_click" class="form-control" >
						<option value="<?php echo $option_on; ?>"  <?php if($default_font_right_click=='On'){echo 'selected';}else{echo '';} ?>><?php echo $option_on; ?></option>
						<option value="<?php echo $option_off; ?>" <?php if($default_font_right_click=='Off'){echo 'selected';}else{echo '';} ?>><?php echo $option_off; ?></option>
						
					</select>
					
                </div>
              </div>
			  
			  <div class="form-group right_click_message">
              <label class="col-sm-2 control-label" for="right_click_message"><span data-toggle="tooltip" title="<?php echo $help_right_click_message; ?>"><?php echo $entry_right_click_message; ?></span></label>
                 <div class="col-sm-6">
				
					<input type="text" id="default_font_right_click_message" name="default_font_right_click_message"  placeholder="<?php echo $entry_right_click_message; ?>" value="<?php echo $default_font_right_click_message; ?>"  class="form-control " />

										
                </div>
              </div>
			  
			</div>
			
            <!--Second Tab Sample Data-->
            <div class="tab-pane" id="tab-sample">
			
			
				 <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Please install sample data on fresh installed opencart,otherwise it will delete all category.
		
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
	
              <div class="form-group required">
              
                <div class="col-sm-4">
					<!--<button type="button" id="btn_sample_data" data-toggle="Sample Data" title="" class="btn btn-primary" data-original-title=""><?php echo $sample_data; ?></button>	
-->					<a href="<?php echo $link_sample_data;?>"  id="btn_sample_data"    class="btn btn-primary"><?php echo $sample_data; ?></a>
                 <!-- <input type="button" name="sample_data" value="<?php echo $sample_data; ?>"  id="sample_data" class="form-control" />-->
                  
                </div>
              </div>
            </div>
			
			<!--Third Tab Compress-->
            <div class="tab-pane" id="tab-compress">
              <div class="form-group required">
              
                <div class="col-sm-4">
					<button type="button" id="btn_compress" data-toggle="Compress files" title="" class="btn btn-primary" data-original-title=""><?php echo $compress_data; ?></button>	
					
                 <!-- <input type="button" name="sample_data" value="<?php echo $sample_data; ?>"  id="sample_data" class="form-control" />-->
                  
                </div>
              </div>
            </div>
			
						
			<!--Fourth Tab Colors-->
			<div class="tab-pane" id="tab-color">
			
				<input type="radio" name="default_font_color_option" value="theme_color" <?php if($default_font_color_option=='theme_color'){echo 'checked';}else{echo '';} ?> > <?php echo $entry_theme_color; ?><br>
				
				<input type="radio" name="default_font_color_option" value="default" <?php if($default_font_color_option=='default' || $default_font_color_option==''){echo 'checked';}else{echo '';} ?>> <?php echo $entry_default_theme; ?><br>
				
				  <!--Theme Color-->
				  <div class="theme" style="display:none">
						<div class="theme-section">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="entry_theme_main_color"><?php echo $entry_theme_main_color; ?></label>
								<div class="col-sm-2">
									  <input type="text" id="theme_main_color1" name="theme_main_color1" onchange="updatethememaincolor(this.jscolor)" placeholder="<?php echo $entry_theme_main_color; ?>" value="<?php echo $default_fontcolor_theme_main_color; ?>"  class="jscolor form-control " />
									  <input type="hidden" id="default_fontcolor_theme_main_color" name="default_fontcolor_theme_main_color" value="<?php echo $default_fontcolor_theme_main_color; ?>"/>
								 </div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="entry_theme_sub_color"><?php echo $entry_theme_sub_color; ?></label>
								<div class="col-sm-2">
									  <input type="text" id="theme_sub_color1" name="theme_sub_color1" onchange="updatethemesubcolor(this.jscolor)" placeholder="<?php echo $entry_theme_sub_color; ?>" value="<?php echo $default_fontcolor_theme_sub_color; ?>"  class="jscolor form-control " />
									  <input type="hidden" id="default_fontcolor_theme_sub_color" name="default_fontcolor_theme_sub_color" value="<?php echo $default_fontcolor_theme_sub_color; ?>"/>
								 </div>
							</div>
							
							
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="entry_theme_footer_text_color"><?php echo $entry_theme_footer_text_color; ?></label>
								<div class="col-sm-2">
									  <input type="text" id="theme_footer_text_color1" name="theme_footer_text_color1" onchange="updatethemefootertextcolor(this.jscolor)" placeholder="<?php echo $entry_theme_footer_text_color; ?>" value="<?php echo $default_fontcolor_theme_footer_text_color; ?>"  class="jscolor form-control " />
									  <input type="hidden" id="default_fontcolor_theme_footer_text_color" name="default_fontcolor_theme_footer_text_color" value="<?php echo $default_fontcolor_theme_footer_text_color; ?>"/>
								 </div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="entry_theme_footer_text_hover_color"><?php echo $entry_theme_footer_text_hover_color; ?></label>
								<div class="col-sm-2">
									  <input type="text" id="theme_footer_text_hover_color1" name="theme_footer_text_hover_color1" onchange="updatethemefootertexthovercolor(this.jscolor)" placeholder="<?php echo $entry_theme_footer_text_hover_color; ?>" value="<?php echo $default_fontcolor_theme_footer_text_hover_color; ?>"  class="jscolor form-control " />
									  <input type="hidden" id="default_fontcolor_theme_footer_text_hover_color" name="default_fontcolor_theme_footer_text_hover_color" value="<?php echo $default_fontcolor_theme_footer_text_hover_color; ?>"/>
								 </div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="entry_theme_text_color"><?php echo $entry_theme_text_color; ?></label>
								<div class="col-sm-2">
									  <input type="text" id="theme_text_color1" name="theme_text_color1" onchange="updatethemetextcolor(this.jscolor)" placeholder="<?php echo $entry_theme_text_color; ?>" value="<?php echo $default_fontcolor_theme_text_color; ?>"  class="jscolor form-control " />
									  <input type="hidden" id="default_fontcolor_theme_text_color" name="default_fontcolor_theme_text_color" value="<?php echo $default_fontcolor_theme_text_color; ?>"/>
								 </div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="entry_theme_text_hover_color"><?php echo $entry_theme_text_hover_color; ?></label>
								<div class="col-sm-2">
									  <input type="text" id="theme_text_hover_color1" name="theme_text_hover_color1" onchange="updatethemetexthovercolor(this.jscolor)" placeholder="<?php echo $entry_theme_text_hover_color; ?>" value="<?php echo $default_fontcolor_theme_text_hover_color; ?>"  class="jscolor form-control " />
									  <input type="hidden" id="default_fontcolor_theme_text_hover_color" name="default_fontcolor_theme_text_hover_color" value="<?php echo $default_fontcolor_theme_text_hover_color; ?>"/>
								 </div>
							</div>
						</div>
				  </div>
				  <!--End Theme Color-->
				  
				  
              
              
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
		
		
        if($('#default_font_right_click').val()=='On'){
			$('.right_click_message').css('display','block');
		}else{
			$('.right_click_message').css('display','none');
		}
		
		$('#default_font_right_click').on('change',function(){
			if($(this).val()=='On'){
			$('.right_click_message').css('display','block');
		}else{
			$('.right_click_message').css('display','none');
		}
			
		});
		
		 var str1=$('input[name=default_font_color_option]:checked').val();
			 if(str1=='theme_color')
			 {
			 	$('.theme').css('display','block');
				
			 }else if(str1=='default')
			 {
			 	$('.theme').css('display','none');
				
			 }
		
		$('input[name=default_font_color_option]').on('change',function(){
			 var str=$('input[name=default_font_color_option]:checked').val();
			 if(str=='theme_color')
			 {
			 	$('.theme').css('display','block');
			
			 }else if(str=='default')
			 {
			 	$('.theme').css('display','none');
			 }
		});
		
		
	
	$('.section').click(function(){
		$(this).parent().find('.section-data').toggle();
	});
	
		
    });


function updatethememaincolor(jscolor) {
    $('#default_fontcolor_theme_main_color').val(jscolor);
}
function updatethemesubcolor(jscolor) {
    $('#default_fontcolor_theme_sub_color').val(jscolor);
}

function updatethemefootertextcolor(jscolor) {
    $('#default_fontcolor_theme_footer_text_color').val(jscolor);
}
function updatethemefootertexthovercolor(jscolor) {
    $('#default_fontcolor_theme_footer_text_hover_color').val(jscolor);
}
function updatethemetexthovercolor(jscolor) {
    $('#default_fontcolor_theme_text_hover_color').val(jscolor);
}
function updatethemetextcolor(jscolor) {
    $('#default_fontcolor_theme_text_color').val(jscolor);
}



$("#btn_compress").click(function(){
	$.ajax({
	  url: 'nilkanthinfo/compressjscss.php',
	  type :'POST',
	  data : { dir : '<?php echo DIR_CATALOG; ?>' , theme : '<?php echo $theme; ?>' } ,
	  success: function(res) {
			if(res==''){
				alert('Files minified successfully.');
			}else{
				alert('Error!!!Unable to minify files');
			}
	  }
	});
});

</script>
<?php echo $footer; ?> 