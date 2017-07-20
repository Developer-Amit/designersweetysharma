<?php echo $header; ?>
<div class="cat_banner paralex-block"  style="background-image:url('<?php echo $thumb; ?>');background-position: 100% -75px;">
	<div class="container">
      
      <div class="row  category-upper-block">
      
        <div class="col-sm-12 category-upper-image">
		<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
		</div>
       
        
      </div>
     
	  </div>
</div>
<div class="container category-page">
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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($thumb || $description) { ?>
      <div class="row  category_upper_block">
<!--        <?php if ($thumb) { ?>
        <div class="col-sm-2 category_upper_image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>-->
        <?php if ($description) { ?>
        <div class="col-sm-12 category_upper_description"><?php echo $description; ?></div>
        <?php } ?>
      </div>
  
      <?php } ?>
      <?php if ($categories) { ?>
      <h3  class="refine-search"><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row refine-search-row">
        <div class="col-sm-3  refine-search-category">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row refine-search-row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($products) { ?>
     
      <div class="row  filter-category">
        <div class="col-md-4  grid-list-btn">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
     	 <p class="compare-total"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
	   <div class="filter-right">
			<div class="sort-by-block">
				<div class="col-md-2 text-right sort-by">
          			<label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
				</div>
        		<div class="col-md-3 text-right sort">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
			</div>
			<div class="show-block">
				<div class="col-md-1 text-right show">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        		<div class="col-md-2 text-right limit">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
			</div>
		</div>
      </div>
      <br />
      <div class="row block-product box-pro listgrid_product">
        <?php foreach ($products as $product) { ?>
        <div class="product-thumb-uppper product-layout product-list col-xs-12">
          <div class="product-thumb transition">
		 	 <div class="product-thumb-inner">
            <div class="image">
				<a href="<?php echo $product['href']; ?>">
					<!--Edited by nilkanthinfo-->
	  <div class="image1st"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></div>
		<div class="image2nd"><img  class="img-responsive"  <?php if($product['rollover_thumb']!=""){ echo 'src="' . $product['rollover_thumb'] . '"';  } ?>/></div>
			<!--end Edited by nilkanthinfo-->
				</a>
				<?php if ($product['price']) { ?>
						<p class="pricelist_sale">
					  		<?php if (!$product['special']) { ?>
					  		<?php } else { ?>
					   		<div class="saleicon sale list_sale"> 
					   		<div class="ribbon-wrapper-green-list_sale">
								SALE
							</div>
						</div> 		<!--sale icon by Nilkanthinfo-->
					  		<?php } ?>
						</p>
					<?php } ?>
					<div class="button-group">
                <button class="button_cart button" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md addtocart"><?php echo $button_cart; ?></span></button>
                <button class="button_wishlist button" type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button class="button_compare button" type="button" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
				  <div class="quickview button"><a class="quick_view" title="Quick View"  rel="" href="<?php echo $product['href']; ?>"><i class="fa fa-eye"></i></a> </div> <!--Quickview by Nilkanthinfo-->
              </div>
			</div>
            <div class="productgridview_details">
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
			  </div>
			  
			  	<div class="productlistview_details">
					<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
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
					<?php } else{ ?>
					 <div class="rating">
				  <?php for ($i = 1; $i <= 5; $i++) { ?>
					 <span class="fa fa-stack unrated">
						<i class="fa fa-star-o fa-stack-2x"></i>
						<i class="fa fa-star-o fa-stack-2x"></i>
					</span>
				 <?php } ?>
				</div>
			  <?php } ?>
					<div class="list_left">
						<p class="description"><?php echo $product['description']; ?></p>
						<div class="list_cart_button">

						</div>
						
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
					
					
              <div class="button-group rightbtgrup">
                <button  class="button_cart button" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                <button   class="button_wishlist button" type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button  class="button_compare button" type="button" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
				 <div class="quickview button"><a class="quick_view" title="Quick View"  rel="" href="<?php echo $product['href']; ?>"><i class="fa fa-eye"></i></a> </div> <!--Quickview by Nilkanthinfo-->
              </div>
            </div>
          </div>
        </div>
		</div>
		</div>
        <?php } ?>
      </div>
      <div class="row  pagination-block">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<!--Added by nilkanthinfo-->
<div id="spinner">
    <img src="catalog/view/theme/<?php echo $templatepath; ?>/image/Nilkanthinfo/ajax-loader.gif" alt="Loading..."/>
</div>
<!--Added by nilkanthinfo-->
<?php echo $footer; ?>
