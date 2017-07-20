<!-- For Testimonial module on home page -->
<div class="block NI_testimonial_block paralex-block">
<div class="container">
<div class="heading_block">
	<h3 class="testimonial_block_heading block_heading"><span><?php echo $heading_title; ?></span></h3>
</div>

<div class="NI_testimonial_block_outer">
<div id="NI_<?php echo $module; ?>" class="testimonial_block_inner" > 

   
   
        <div id="block-product" class="testimonial_slider">

			<?php $l=1; ?>
            <?php foreach ($testimonials as $testimonial) { ?>
			
			 <div class="item <?php if($l%2==0){echo 'even';}else { echo 'odd';} ?>">
			 	 <div class="left_testi">
					<div class="image" style="float:left">
						<img src="<?php echo $testimonial['thumb']; ?>" alt="<?php echo $testimonial['title']; ?>" title="<?php echo $testimonial['title']; ?>" class="img-responsive" />
					</div>
				 </div>
				 <div class="right_testi">
				 	<div class="description"><span class="open_quote">"</span><?php echo $testimonial['description'] ; ?></div><!--<br>-->  <!--added opening quote & closing quote -->
					
	<?php if ($testimonial['rating']) {?>
	
        <div class="rating">
          <?php for ($i = 0; $i < 5; $i++) { ?>
          <?php if ($testimonial['rating'] <= $i) {    ?>
		
	         <span class="fa fa-stack unrated">
		  		<i class="fa fa-star-o fa-stack-2x"></i>
				<i class="fa fa-star-o fa-stack-2x"></i>
			</span>
          <?php } else {    ?>
    	      <span class="fa fa-stack rated"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
    <?php }
	else{ ?>
		 <div class="rating">
				  <?php for ($i = 0; $i < 5; $i++) { ?>
					 <span class="fa fa-stack unrated">
						<i class="fa fa-star-o fa-stack-2x"></i>
						<i class="fa fa-star-o fa-stack-2x"></i>
					</span>
				 <?php } ?>
				</div>
			  <?php } ?>
					
					<div class="nameandcity">
						<div class="title testi_attri">
						<b>
							<?php echo $testimonial['title']; ?>
						</b>
						</div>
						<div class="name testi_attri">
						<?php if ($testimonial['name']!="") echo ''.$testimonial['name']; else echo $testimonial['name']; ?></div>
						<div class="city testi_attri">
                		<?php echo $testimonial['city']; ?>
						</div>
					</div>
					
					
				 </div>
</div>
			<?php $l++; ?>
            <?php } ?>
        </div>
        <div class="name show_all"><a href="<?php echo $showall_url;?>"><?php echo $show_all; ?></a></div>
        <div class="name write_testimonial"><a href="<?php echo $isitesti; ?>"><?php echo $isi_testimonial; ?></a></div>

   
</div>
</div>
</div>
</div>


<!--</div>-->
