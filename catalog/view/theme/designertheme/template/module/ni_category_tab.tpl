<div class="block NI_category_tab"> 
	<div class="container">
		<div id="tabs" class="nav nav-tabs ">
			 <?php $slidelimit="1"; ?>
					<div class="block-product <?php if(sizeof($categories) > $slidelimit) { echo '-tabcontent slider-block-category';} else { echo '-tabcontent grid-block';} ?>">
			<?php foreach($categories as $category) { ?>
				<div class="ct-block col-xs-12">
					<div class="tab_heading <?php if($category==$categories[0]){echo 'active';} ?> 
					<?php echo $category; ?>_heading">
			<a class="ni_tab" href="#tab-<?php echo str_replace(' ','',(str_replace('&amp;','amp',$category))); ?>" data-toggle="tab"><span><?php echo $category; ?></span></a>	
				</div>
					<div id="tab-<?php echo str_replace(' ','',(str_replace('&amp;','amp',$category))); ?>" class="<?php if($category==$categories[0]) {echo 'active ';} ?>tab-pane">
					<?php  if(!$products[$category]){ echo 'There are no products to list in this category'; }?> 
					 <?php $slidelimit="3"; ?>
					<div class="block-product <?php if(sizeof($products[$category]) > $slidelimit) { echo $category.'-tabcontent slider-block-single';} else { echo $category.'-tabcontent grid-block';} ?>">
					
					
						<?php  for($l=0;$l<sizeof($products[$category]);$l++) { ?>
							<div class='item'>	
							<div class="product-thumb-upper col-lg-3 col-md-3 col-sm-6 col-xs-12">			
								<div class="product-thumb transition">	
									<div class="product-block-inner">
									<div class="row">
										<div class="left col-lg-5 col-md-5 col-sm-6 col-xs-12">
											<div class="image">
											<a href="<?php echo $products[$category][$l]['href']; ?>">
											
											<!--Edited by nilkanthinfo-->
											  <div class="image1st"><img src="<?php echo $products[$category][$l]['thumb']; ?>" alt="<?php echo $products[$category][$l]['name']; ?>" title="<?php echo $products[$category][$l]['name']; ?>" class="img-responsive" /></div>
												<div class="image2nd"><img  class="img-responsive"  <?php if($products[$category][$l]['rollover_thumb']!=""){ echo 'src="' . $products[$category][$l]['rollover_thumb'] . '"';  } ?>/></div>
													<!--end Edited by nilkanthinfo-->
											
											</a>
					  
										
										</div>
										</div>
										<div class="right col-lg-6 col-md-6 col-sm-5 col-xs-12 Aple">
											<div class="caption">
											<h4><a href="<?php echo $products[$category][$l]['href']; ?>"><?php echo $products[$category][$l]['name']; ?></a></h4>
											<p class="description"><?php echo $products[$category][$l]['description']; ?></p>
											<?php if ($products[$category][$l]['rating']) { ?>
												<div class="rating">
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($products[$category][$l]['rating'] < $i) { ?>
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
											<?php if ($products[$category][$l]['price']) { ?>
												<div class="price">
						  <?php if (!$products[$category][$l]['special']) { ?>
						  <?php echo $products[$category][$l]['price']; ?>
						  <?php } else { ?>
						   <div class="saleicon sale"> <span class="ribbon-wrapper-green">SALE</span></div> 		<!--sale icon-->
							
						  <span class="price-new"><?php echo $products[$category][$l]['special']; ?></span> <span class="price-old"><?php echo $products[$category][$l]['price']; ?></span>
						  <?php } ?>
						  <?php if ($products[$category][$l]['tax']) { ?>
						  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $products[$category][$l]['tax']; ?></span>
						  <?php } ?>
						</div>
											<?php } ?>
										</div>
											<div class="button-group">
											<button class="button_cart button" type="button" onclick="cart.add('<?php echo $products[$category][$l]['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md addtocart"><?php echo $button_cart; ?></span>
											</button>
											<button class="button_wishlist button" type="button"  title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $products[$category][$l]['product_id']; ?>');"><i class="fa fa-heart"></i>
											</button>
											<button class="button_compare button" type="button"  title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $products[$category][$l]['product_id']; ?>');"><i class="fa fa-exchange"></i>
											</button>
											<div class="quickview button">
												<a class="quick_view" title="Quick View"  rel="" href="<?php echo $products[$category][$l]['href']; ?>"><i class="fa fa-eye"></i></a> </div>
											</div>
										</div>
									
									</div>	
										
					  
									</div>
								</div>
							</div>
							<?php $l++;
							if($l<sizeof($products[$category])){ ?>
									<div class="product-thumb-upper col-lg-3 col-md-3 col-sm-6 col-xs-12">			
								<div class="product-thumb transition">	
									<div class="product-block-inner">
									<div class="row">
										<div class="left col-lg-5 col-md-5 col-sm-6 col-xs-12">
											<div class="image">
											<a href="<?php echo $products[$category][$l]['href']; ?>">
												<!--Edited by nilkanthinfo-->
											  <div class="image1st"><img src="<?php echo $products[$category][$l]['thumb']; ?>" alt="<?php echo $products[$category][$l]['name']; ?>" title="<?php echo $products[$category][$l]['name']; ?>" class="img-responsive" /></div>
												<div class="image2nd"><img  class="img-responsive"  <?php if($products[$category][$l]['rollover_thumb']!=""){ echo 'src="' . $products[$category][$l]['rollover_thumb'] . '"';  } ?>/></div>
													<!--end Edited by nilkanthinfo-->
											</a>
					  
										
										</div>
										</div>
										<div class="right col-lg-6 col-md-6 col-sm-5 col-xs-12">
											<div class="caption">
											<h4><a href="<?php echo $products[$category][$l]['href']; ?>"><?php echo $products[$category][$l]['name']; ?></a></h4>
											<p class="description"><?php echo $products[$category][$l]['description']; ?></p>
											<?php if ($products[$category][$l]['rating']) { ?>
												<div class="rating">
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($products[$category][$l]['rating'] < $i) { ?>
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
											<?php if ($products[$category][$l]['price']) { ?>
												<div class="price">
						  <?php if (!$products[$category][$l]['special']) { ?>
						  <?php echo $products[$category][$l]['price']; ?>
						  <?php } else { ?>
						   <div class="saleicon sale"> <span class="ribbon-wrapper-green">SALE</span></div> 		<!--sale icon-->
							
						  <span class="price-new"><?php echo $products[$category][$l]['special']; ?></span> <span class="price-old"><?php echo $products[$category][$l]['price']; ?></span>
						  <?php } ?>
						  <?php if ($products[$category][$l]['tax']) { ?>
						  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $products[$category][$l]['tax']; ?></span>
						  <?php } ?>
						</div>
											<?php } ?>
										</div>
											<div class="button-group">
											<button class="button_cart button" type="button" onclick="cart.add('<?php echo $products[$category][$l]['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md addtocart"><?php echo $button_cart; ?></span>
											</button>
											<button class="button_wishlist button" type="button"  title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $products[$category][$l]['product_id']; ?>');"><i class="fa fa-heart"></i>
											</button>
											<button class="button_compare button" type="button"  title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $products[$category][$l]['product_id']; ?>');"><i class="fa fa-exchange"></i>
											</button>
											<div class="quickview button">
												<a class="quick_view" title="Quick View"  rel="" href="<?php echo $products[$category][$l]['href']; ?>"><i class="fa fa-eye"></i></a> </div>
											</div>
										</div>
									
									</div>	
										
					  
									</div>
								</div>
							</div>
							<?php }
							$l++;
							if($l<sizeof($products[$category])){ ?>
									<div class="product-thumb-upper col-lg-3 col-md-3 col-sm-6 col-xs-12">			
								<div class="product-thumb transition">	
									<div class="product-block-inner">
									<div class="row">
										<div class="left col-lg-5 col-md-5 col-sm-6 col-xs-12">
											<div class="image">
											<a href="<?php echo $products[$category][$l]['href']; ?>">
													<!--Edited by nilkanthinfo-->
											  <div class="image1st"><img src="<?php echo $products[$category][$l]['thumb']; ?>" alt="<?php echo $products[$category][$l]['name']; ?>" title="<?php echo $products[$category][$l]['name']; ?>" class="img-responsive" /></div>
												<div class="image2nd"><img  class="img-responsive"  <?php if($products[$category][$l]['rollover_thumb']!=""){ echo 'src="' . $products[$category][$l]['rollover_thumb'] . '"';  } ?>/></div>
													<!--end Edited by nilkanthinfo-->
											</a>
					  
										
										</div>
										</div>
										<div class="right col-lg-6 col-md-6 col-sm-5 col-xs-12">
											<div class="caption">
											<h4><a href="<?php echo $products[$category][$l]['href']; ?>"><?php echo $products[$category][$l]['name']; ?></a></h4>
											<p class="description"><?php echo $products[$category][$l]['description']; ?></p>
											<?php if ($products[$category][$l]['rating']) { ?>
												<div class="rating">
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($products[$category][$l]['rating'] < $i) { ?>
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
											<?php if ($products[$category][$l]['price']) { ?>
												<div class="price">
						  <?php if (!$products[$category][$l]['special']) { ?>
						  <?php echo $products[$category][$l]['price']; ?>
						  <?php } else { ?>
						   <div class="saleicon sale"> <span class="ribbon-wrapper-green">SALE</span></div> 		<!--sale icon-->
							
						  <span class="price-new"><?php echo $products[$category][$l]['special']; ?></span> <span class="price-old"><?php echo $products[$category][$l]['price']; ?></span>
						  <?php } ?>
						  <?php if ($products[$category][$l]['tax']) { ?>
						  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $products[$category][$l]['tax']; ?></span>
						  <?php } ?>
						</div>
											<?php } ?>
										</div>
											<div class="button-group">
											<button class="button_cart button" type="button" onclick="cart.add('<?php echo $products[$category][$l]['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md addtocart"><?php echo $button_cart; ?></span>
											</button>
											<button class="button_wishlist button" type="button"  title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $products[$category][$l]['product_id']; ?>');"><i class="fa fa-heart"></i>
											</button>
											<button class="button_compare button" type="button"  title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $products[$category][$l]['product_id']; ?>');"><i class="fa fa-exchange"></i>
											</button>
											<div class="quickview button">
												<a class="quick_view" title="Quick View"  rel="" href="<?php echo $products[$category][$l]['href']; ?>"><i class="fa fa-eye"></i></a> </div>
											</div>
										</div>
									
									</div>	
										
					  
									</div>
								</div>
							</div>
							<?php } ?>
							</div>
						<?php } ?>
					</div>
				</div>
				</div>
			<?php } ?>	
				</div>
		</div>
		</div>
	
</div>
<script type="text/javascript">

	$('.slider-block').owlCarousel({
	  items: 4,
      itemsDesktop : [991,3], //5 items between 1000px and 901px
      itemsDesktopSmall : [767,2], // betweem 900px and 601px
	  itemsTablet: [478,1], //2 items between 600 and 0
      itemsMobile : false, // itemsMobile disabled - inherit from itemsTablet option
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
	
	});
</script>

