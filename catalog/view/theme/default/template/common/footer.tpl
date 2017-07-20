</div><!--------wapper-block-ends-------->
<footer>
<div class="footer-inner-block">
  <div id="footer" class="container">
    <div class="row">
		<div class="custom_footer_inner0 col-sm-3 column">
			<?php echo $content_footer; ?>
		</div>
      <div class="col-sm-3 column account_footerblock">
        <h5><?php echo $text_account; ?></h5>
		<button class="footer-menu-toggle" style="display:none">+</button>
		<!-- button add by nilkanthinfo-->
        <ul class="list-unstyled sub-footer">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <!-- <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li> -->
          <?php if(islogged>0){?>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
          <?php } ?>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
		  <!-- <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
		  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li> -->
        </ul>
      </div>
		<div class="col-sm-3 column service_footerblock">
        <h5><?php echo $text_service; ?></h5><button class="footer-menu-toggle" style="display:none">+</button>			<!-- button add by nilkanthinfo-->
        <ul class="list-unstyled sub-footer"><!--added class by nilkanthinfo-->
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
		  <!-- <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li> -->
		  <?php if(islogged>0){?>
		  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
		  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
		  <?php } ?>
        </ul>
      </div>
  	    <!-- Footer CMS Block by Nilkanthinfo -->
	 	<div class="custom_footer_inner1 col-sm-3 column">
	  		<?php //echo $content_footer1; ?>
		</div>
		<!------------------------------>  
	  </div>
    </div>
   
	 <div class="footer_bottom">
		<div class="inner-bottom">
			<div class="container">
			<div class="custom_footer_inner2">
				<?php echo $content_footer2; ?>
			</div>
			 <?php if ($informations) { ?>
				 <div class="col-sm-3 column information_footerblock">
			<h5><?php echo $text_information; ?></h5>
			<button class="footer-menu-toggle" style="display:none">+</button>
			<!-- button add by nilkanthinfo-->
			<ul class="list-unstyled   sub-footer">
			  <?php foreach ($informations as $information) { ?>
			  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
			  <?php } ?>
						<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
			
			  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
			</ul>
		  </div>
     		 <?php } ?>
			  <div class="col-sm-3 column extra_footerblock">
				<h5><?php echo $text_extra; ?></h5><button class="footer-menu-toggle" style="display:none">+</button>			<!-- button add by nilkanthinfo-->
				<ul class="list-unstyled sub-footer">					<!--added class by nilkanthinfo-->
				  <!-- <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li> -->
				  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				  <!-- <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li> -->
				  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				</ul>
			  </div>
			<p class="powered_block"><?php echo $powered; ?></p>
				<!-- Footer CMS Block by Nilkanthinfo -->
			<div class="custom_footer_inner3">
				<?php echo $content_footer3; ?>
			</div>
		</div>
		</div>
	</div>
    

</footer>
<!--Back to top button by Nilkanthinfo-->
<a href="#top" class="back-to-top"><i class="fa fa-chevron-up" aria-hidden="true"></i></a>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>