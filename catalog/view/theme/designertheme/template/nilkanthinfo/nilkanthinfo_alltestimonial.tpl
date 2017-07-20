

<!--a single testimonial page for show all testimonial-->
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
    <div id="content" class="NI_alltestimonial <?php echo $class; ?>"><?php echo $content_top; ?>
   <h1><?php echo $heading_title; ?></h1>
   
   

	<!-- edited for adding odd even classes -->
		<?php if (true/*$testimonials*/) { $j=0;?>
		
		  <?php foreach ($testimonials as $testimonial) { $j++;?>
		  <table class="content <?php if($j%2==0) echo 'even'; else echo 'odd'; ?>" width="100%" border=0> 
			 <tr class="userimage">
				 <td valign="top" style="text-align:left;" ><b> <div class="image" ><img src="<?php echo $testimonial['thumb']; ?>" alt="<?php echo $testimonial['title']; ?>" title="<?php echo $testimonial['title']; ?>" class="img-responsive" /></div></b></td>
			 </tr>
			  <tr class="usercomment">
				<td colspan="2" style="text-align:left;">
						<?php echo $testimonial['description']; ?>
					</td>
			  </tr>
			  <tr class="username">
			  
				 <td valign="top" style="text-align:left;" colspan="2"><b><?php echo $testimonial['title']; ?></b></td>
			  </tr>
			     
		
			 <tr class="usertimedetails">
				<td style="font-size: 0.9em;">
						<?php if ($testimonial['rating']) { ?>
						
							<div class="rating">
					  <?php for ($i = 1; $i <= 5; $i++) { ?>
					  <?php if ($testimonial['rating'] < $i) { ?>
					  <span class="fa fa-stack unrated">
					<i class="fa fa-star-o fa-stack-2x"></i>
					<i class="fa fa-star-o fa-stack-2x"></i>
				</span>
					  <?php } else { ?>
					  <span class="fa fa-stack rated"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
					  <?php } ?>
					  <?php } ?>
					</div>
					<?php } else{ ?>
					 <div class="rating">
				  <?php for ($i = 1; $i <= 5; $i++) { ?>
					 <span class="fa fa-stack unrated">
						<i class="fa fa-star-o fa-stack-2x"></i>
						<i class="fa fa-star-o fa-stack-2x"></i>
					</span>
				 <?php } ?>
				</div>
						  <?php } ?><br>
		-&nbsp;<i class="name"><?php echo $testimonial['name']?></i>
		<i class="city"><?php echo $testimonial['city'] ?></i>
		<i class="date_added"><?php echo $testimonial['date_added']; ?></i>
					 </td>
				
			  </tr>
	
		</table>
		  <?php } ?>
	
			<?php if ( isset($pagination)) { ?>
				<div class="pagination"><?php echo $pagination;?></div>
				
				
				<div class="buttons clearfix" align="right">
					<a class="button btn btn-primary" href="<?php echo $write_url;?>" title="<?php echo $write;?>"><span><?php echo $write;?></span></a>
				</div>
			<?php }?>
	
			<?php if (isset($showall_url)) { ?>
				
				<div class="buttons clearfix" align="right">
					<a class="button btn btn-default" href="<?php echo $write_url;?>" title="<?php echo $write;?>"><span><?php echo $write;?></span></a> 
					&nbsp;
					<a class="button btn btn-primary" href="<?php echo $showall_url;?>" title="<?php echo $showall;?>"><span><?php echo $showall;?></span></a>
				</div>
			<?php }?>
		<?php } ?>
	  
      
	  <?php echo $content_bottom; ?>
	  </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

