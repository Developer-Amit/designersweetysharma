<div class="block featured_block">
<div class="container">
<div  class="featured_block_heading block_heading"><span><?php echo $heading_title; ?></span></div>
<div class="block-content">
	<?php	$slidelimit="4";	?>		<!-- Number of product limit for the slider by Nilkanthinfo.-->
	<div class="block-product <?php if($position == 'column_left' || $position == 'column_right'){ echo 'slider-block-single';} else{ if((sizeof($products) > $slidelimit) ) {   echo 'slider-block';} else { echo 'grid-block';}}  ?>">  <!-- Add class for owl carousal by  Nilkanthinfo-->
  <?php foreach ($products as $product) { ?>
  <div class="product-thumb-upper product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
	<div class="product-thumb-inner">
      <div class="image"><a href="<?php echo $product['href']; ?>"><!--Edited by nilkanthinfo-->
	  <div class="image1st"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></div>
		<div class="image2nd"><img  class="img-responsive"  <?php if($product['rollover_thumb']!=""){ echo 'src="' . $product['rollover_thumb'] . '"';  } ?>/></div>
			<!--end Edited by nilkanthinfo--></a>
	  <div class="button-group">
        <button class="button_cart button" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md addtocart"><?php echo $button_cart; ?></span></button>
        <button class="button_wishlist button" type="button"  title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button class="button_compare button" type="button"  title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
		<div class="quickview button"><a class="quick_view" title="Quick View"  rel="" href="<?php echo $product['href']; ?>"><i class="fa fa-eye"></i></a> </div>
      </div>
	  </div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <p  class="description"><?php echo $product['description']; ?></p>
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
		   <div class="saleicon sale"> <span class="ribbon-wrapper-green">SALE</span></div> 		<!--sale icon by Nilkanthinfo-->
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <div class="button-group  leftrigthcloumn">
        <button  class="button_cart button"  type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button  class="button_wishlist button" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button  class="button_compare button" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
		<div class="quickview button"><a class="quick_view" title="Quick View"  rel="" href="<?php echo $product['href']; ?>"><i class="fa fa-eye"></i></a> </div>
      </div>
    </div>
  </div>
  </div>
  <?php } ?>
</div>
</div>
</div>
</div>
