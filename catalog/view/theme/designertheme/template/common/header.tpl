<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/custom/price-slider-ui/jquery-ui.css" rel="stylesheet">
<script src="catalog/view/javascript/custom/price-slider-ui/jquery-ui.js" type="text/javascript"></script>
<link href="catalog/view/theme/<?php echo $templatepath; ?>/stylesheet/nilkanthinfo/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="catalog/view/javascript/summernote/summernote.js"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href='https://fonts.googleapis.com/css?family=Raleway:400,300,500,700,600,800' rel='stylesheet' type='text/css'>
<?php if(file_exists("catalog/view/theme/$templatepath/stylesheet/stylesheet.min.css")){ ?>
<link href="catalog/view/theme/<?php echo $templatepath; ?>/stylesheet/stylesheet.min.css" rel="stylesheet">
<?php }else {?>
<link href="catalog/view/theme/<?php echo $templatepath; ?>/stylesheet/stylesheet.css" rel="stylesheet">
<?php } ?>

<?php if(file_exists("catalog/view/theme/$templatepath/stylesheet/nilkanthinfo/responsive.min.css")){ ?>
<link href="catalog/view/theme/<?php echo $templatepath; ?>/stylesheet/nilkanthinfo/responsive.min.css" rel="stylesheet">
<?php }else {?>
<link href="catalog/view/theme/<?php echo $templatepath; ?>/stylesheet/nilkanthinfo/responsive.css" rel="stylesheet">
<?php } ?>

<?php if($direction=='rtl'){ ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $templatepath; ?>/stylesheet/nilkanthinfo/rtl.css">
<?php }?>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" />
<script type="text/javascript" src='catalog/view/javascript/jquery/owl-carousel/owl.carousel.js'></script>
<script type="text/javascript" src='catalog/view/javascript/custom/elevatezoom/jquery.elevatezoom.js'></script>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>


<link rel="stylesheet" type="text/css" href="catalog/view/javascript/custom/colorbox/colorbox.css" />
<script type="text/javascript" src="catalog/view/javascript/custom/colorbox/jquery.colorbox.js"></script>

<script src="catalog/view/javascript/common.js" type="text/javascript"></script>


<?php if(file_exists("catalog/view/javascript/custom/custom.min.js")){ ?>
<script src="catalog/view/javascript/custom/custom.min.js" type="text/javascript"></script>
<?php } else {?>
<script src="catalog/view/javascript/custom/custom.js" type="text/javascript"></script>
<?php } ?>

<script type="text/javascript" src='catalog/view/javascript/custom/fancybox/jquery.fancybox.js'></script>
<script type="text/javascript" src='catalog/view/javascript/custom/fancybox/jquery.fancybox.pack.js'></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/custom/fancybox/jquery.fancybox.css" />

<?php echo $ni_setting; ?><!--Added by nilanthinfo-->

<style type="text/css">
.home .blog_img img{
	height:<?php echo $blog_home_height;?>px;
	width:<?php echo $blog_home_width;?>px;
	}
#column-left .blog_img img,#column-right .blog_img img{
	height:<?php echo $blog_leftcolumn_height;?>px;
	width:<?php echo $blog_leftcolumn_width;?>px;
	}
.nilkanthinfo-nilkanthinfo_singleblog .blog_img_single img{
	height:<?php echo $blog_detail_height;?>px;
	width:<?php echo $blog_detail_width;?>px;
	}
.nilkanthinfo-nilkanthinfo_allblog .blog_img_single img{
	height:<?php echo $blog_list_height;?>px;
	width:<?php echo $blog_list_width;?>px;
	}
	#menu .dropdown-inner ul.menucolumn li.heading a:hover{
		color:#ffa907!important;
	}
</style>

<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<div class="wapper-block"><!--------wapper-block-start-------->
<nav id="top">
  <div class="container">
    <div class="row">
	 <?php echo $language; ?>
     <?php echo $currency; ?>
   
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li class="dropdown account_link"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><?php if ($logged) { ?><span> <?php echo $logged_cust_name; ?> </span><?php }else{ ?><span> <?php echo $text_account; ?></span><?php } ?><span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li class="account_top_link"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li class="order_link"><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li class="transc_link"><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li class="down_link"><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li class="logout_link"><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li class="regi_link"><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li class="login_link"><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li class="wish_link"><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span><?php echo $text_wishlist; ?></span></a></li>
        <li class="shoping_link"><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li class="chkout_link"><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div>
  </div>
  </div>
</nav>
 <!--Added by nilkanthinfo for rightclick-->
  <input type="hidden" id="is_right_click" value="<?php echo $is_right_click; ?>"/>
    <input type="hidden" id="right_click_message" value="<?php echo $right_click_message; ?>"/>
	<!--end Added by nilkanthinfo for rightclick-->
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-3 logo_block">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
	  
	  <div class="col-sm-5  search_block"><?php echo $search; ?>
	
      </div>
	   <div class="col-sm-3 cart_block"><?php echo $cart; ?></div>
      
     
    </div>
  </div>
</header>
<div class="nav-inner-container">
	<div class="container">
		<div class="row">
<?php if ($categories) { ?>

  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav submenuvm">
	    <li class="home"> <a href="<?php echo $home; ?>">Home</a></li>
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
  	<li class="dropdown <?php if(isset($_GET['path'])){if($_GET['path']==$category['category_id']) { echo 'active';}} ?>">
	<a href="<?php echo $category['href']; ?>" class="mainmenu " data-hover="<?php echo $category['name']; ?>" ><?php echo $category['name']; ?></a><button class="menu-toggle" style="display:none">+</button>

		<!--Start Nilkanthinfo 3 layer menu-->

		 <div class="dropdown-menu">
			<div class="dropdown-inner">
			<?php for ($i = 0; $i < count($category['children']);) { ?>
			<ul class="list-unstyled menucolumn column<?php echo $i+1; ?>">
				<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
				<?php for (; $i < $j; $i++) { ?>
				<?php if (isset($category['children'][$i])) { ?>
					<li class="heading">
						<a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; if(sizeof($category['children'][$i]['children3']) >0) {  echo '';} ?></a>
					<?php 
					if(sizeof($category['children'][$i]['children3'])>0) {?>
						<button class="submenu-toggle" style="display:none">+</button>
							<?php 	for ($k = 0; $k < count($category['children'][$i]['children3']);) { ?>
								<ul class="childcol childcol<?php echo $k+1; ?>">
								  <?php $l = $k + ceil(count($category['children'][$i]['children3']) / $category['column']); ?>
								  <?php for (; $k < $l; $k++) { ?>
								  <?php if (isset($category['children'][$i]['children3'][$k])) { ?>
									<li style="color:#FFFFFF">
										<a  href="<?php echo $category['children'][$i]['children3'][$k]['href']; ?>"><?php echo $category['children'][$i]['children3'][$k]['name']; ?></a>
								  </li>
								  <?php } ?>
								  <?php } ?>
								</ul>
							<?php } ?>
						
					<?php } ?>
					</li>
				<?php } ?>
				<?php } ?>
			</ul>
			<?php } ?>
		</div>
		</div>				
		<!--End Nilkanthinfo 3 layer menu-->
        </li>
        <?php } else { ?>
        <li class="<?php if(isset($_GET['path'])){if($_GET['path']==$category['category_id']) { echo 'active';}} ?>"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
		<!-- Added by nilkanthinfo for blog-->
		<?php if($is_blog_top == 1) {?>
		<li class="dropdown <?php if(isset($_GET['route'])){if($_GET['route']=='nilkanthinfo/nilkanthinfo_allblog' || $_GET['route']=='nilkanthinfo/nilkanthinfo_singleblog') { echo 'active';}} ?>"><a href="<?php echo $blog_link; ?>">Events</a></li>
		<?php } ?>
		<?php foreach ($informations as $information) { ?>
		<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
		<?php } ?>
		<?php if($storeid == 0){?>
		<?php } ?>
      </ul>
    </div>
  </nav>
<?php } ?>
				
			</div>
		</div>
		</div>