<div class="block NI_product_tab"> 
<div class="container">
 <div id="tabs" class="nav nav-tabs ">
 	
	<?php if ($bestseller_products) { ?>
	    <div class="active tab_heading bestseller_heading"><a class="ni_tab" href="#tab-bestseller" data-toggle="tab"><?php echo $tab_bestseller; ?></a></div>
	<?php }  if ($special_products) { ?>    
	    <div class="tab_heading special_heading"><a class="ni_tab" href="#tab-special" data-toggle="tab"><?php echo $tab_special; ?></a></div>
	<?php } ?>
	
</div>
   
<div class="tab-content">  
            
<!-- bestseller tab content starts -->
	<?php if($bestseller_products){ ?>
		<div id="tab-bestseller" class="active tab-pane">
			 <?php $slidelimit="4"; ?>
			<div class="block-product bestseller_product-tabcontent <?php if(sizeof($bestseller_products) > $slidelimit) { echo 'bestseller_product-tabcontent slider-block';} else { echo 'bestseller_product-tabcontent grid-block';} ?>">
				<?php foreach ($bestseller_products as $product) { ?>	
					<div class="product-thumb-upper col-lg-3 col-md-3 col-sm-6 col-xs-12">
						<div class="product-thumb transition">
							<div class="product-thumb-inner">
							  <div class="image"><a href="<?php echo $product['href']; ?>"><!--Edited by nilkanthinfo-->
	  <div class="image1st"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></div>
		<div class="image2nd"><img  class="img-responsive"  <?php if($product['rollover_thumb']!=""){ echo 'src="' . $product['rollover_thumb'] . '"';  } ?>/></div>
			<!--end Edited by nilkanthinfo--></a>
							  
							  <div class="button-group">
								<button class="button_cart button" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md addtocart"><?php echo $button_cart; ?></span></button>
								<button class="button_wishlist button" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
								<button class="button_compare button" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
								 <div class="quickview button"><a class="quick_view" title="Quick View"  rel="" href="<?php echo $product['href']; ?>"><i class="fa fa-eye"></i></a> </div>
							  </div>
							  </div>
							  <div class="caption">
								<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
								<p class="description"><?php echo $product['description']; ?></p>
								<?php if ($product['rating']) { ?>
								<div class="rating">
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($product['rating'] < $i) { ?>
							<span class="fa fa-stack unrated">
								<i class="fa fa-star-o fa-stack-2x"></i>
								<i class="fa fa-star-o fa-stack-2x"></i>
							</span>
						  <?php } else { ?>
							<span class="fa fa-stack rated">
								<i class="fa fa-star fa-stack-2x"></i>
								<i class="fa fa-star-o fa-stack-2x"></i>
							</span>
						  <?php } ?>
						  <?php } ?>
						</div>
								<?php }  else{ ?>
										 <div class="rating">
									  <?php for ($i = 1; $i <= 5; $i++) { ?>
										 <span class="fa fa-stack unrated">
											<i class="fa fa-star-o fa-stack-2x"></i>
											<i class="fa fa-star-o fa-stack-2x"></i>
										</span>
									 <?php } ?>
									</div>
								  <?php } ?>
								<?php if ($product['price']) { ?>
								<div class="price">
								  <?php if (!$product['special']) { ?>
								  <?php echo $product['price']; ?>
								  <?php } else { ?>
									<div class="saleicon sale"> <span class="ribbon-wrapper-green">SALE</span></div> 		<!--sale icon-->
									
								  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
								  <?php } ?>
								  <?php if ($product['tax']) { ?>
								  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
								  <?php } ?>
								</div>
								<?php } ?>
							  </div>
							  
			  				</div>
						</div>
					</div>
				<?php } ?>
			</div>
		</div>
	<?php } ?>
<!-- bestseller tab content ends -->
	
<!-- special tab content starts  -->	
	<?php if($special_products){ ?>
		<div id="tab-special" class="tab-pane">
			 <?php
  				$slidelimit="4";   
			?>
			<div class="block-product special_product-tabcontent <?php if(sizeof($special_products) > $slidelimit) { echo 'special_product-tabcontent slider-block';} else { echo 'special_product-tabcontent grid-block';} ?>">
				<?php foreach ($special_products as $product) { ?>	
					<div class="product-thumb-upper col-lg-3 col-md-3 col-sm-6 col-xs-12">
					
		<div class="product-thumb transition">
			<div class="product-thumb-inner">
		  <div class="image"><a href="<?php echo $product['href']; ?>"><!--Edited by nilkanthinfo-->
	  <div class="image1st"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></div>
		<div class="image2nd"><img  class="img-responsive"  <?php if($product['rollover_thumb']!=""){ echo 'src="' . $product['rollover_thumb'] . '"';  } ?>/></div>
			<!--end Edited by nilkanthinfo--></a>
		  <div class="button-group">
			<button class="button_cart button" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
				<i class="fa fa-shopping-cart"></i> 
				<span class="hidden-xs hidden-sm hidden-md addtocart"><?php echo $button_cart; ?></span>
			</button>
			<button class="button_wishlist button" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
			<button class="button_compare button" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
			 <div class="quickview button"><a class="quick_view" title="Quick View"  rel="" href="<?php echo $product['href']; ?>"><i class="fa fa-eye"></i></a> </div>
		  </div>
		  </div>
		  <div class="caption">
			<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
			<p class="description"><?php echo $product['description']; ?></p>
			<?php if ($product['rating']) { ?>
			<div class="rating">
			  <?php for ($i = 1; $i <= 5; $i++) { ?>
			  <?php if ($product['rating'] < $i) { ?>
			  <span class="fa fa-stack unrated">
		  		<i class="fa fa-star-o fa-stack-2x"></i>
				<i class="fa fa-star-o fa-stack-2x"></i>
			</span>
			  <?php } else { ?>
			  <span class="fa fa-stack rated"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
			  <?php } ?>
			  <?php } ?>
			</div>
			<?php }  else{ ?>
					 <div class="rating">
				  <?php for ($i = 1; $i <= 5; $i++) { ?>
					 <span class="fa fa-stack unrated">
						<i class="fa fa-star-o fa-stack-2x"></i>
						<i class="fa fa-star-o fa-stack-2x"></i>
					</span>
				 <?php } ?>
				</div>
			  <?php } ?>
			<?php if ($product['price']) { ?>
			<div class="price">
			  <?php if (!$product['special']) { ?>
			  <?php echo $product['price']; ?>
			  <?php } else { ?>
			    <div class="saleicon sale"> <span class="ribbon-wrapper-green">SALE</span></div> 		<!--sale icon-->
				
			  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
			  <?php } ?>
			  <?php if ($product['tax']) { ?>
			  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
			  <?php } ?>
			</div>
			<?php } ?>
		  </div>
		  
		  </div>
		
		</div>
	  </div>
				<?php } ?>
			</div> 
		</div>
	<?php } ?>
	</div>
	
	</div>
<!-- special tab content starts -->

</div>

