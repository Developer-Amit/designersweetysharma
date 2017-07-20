
$(document).ready(function() {
	//Control Panel
		//1.Enable right click
		if($('#is_right_click').val()=='On'){
			$(document).keydown(function (e) {
					var keycode = e.charCode || e.keyCode;
					if (keycode  == 123) { //Enter key's keycode
						 return false; 
					  }
					if ( e.ctrlKey && ( e.which === 85 ) ) {
					  return false; 
					}
					
					if ( e.ctrlKey && e.shiftKey && ( e.which === 67 ) ) {
					  return false; 
					}
					
					if ( e.ctrlKey && e.shiftKey && ( e.which === 76 ) ) {
					  return false; 
					}
					if ( e.ctrlKey && e.shiftKey && ( e.which === 75 ) ) {
					  return false; 
					}
					if ( e.ctrlKey && e.shiftKey && ( e.which === 83 ) ) {
					  return false; 
					}
					if ( e.ctrlKey && e.shiftKey && ( e.which === 81 ) ) {
					  return false; 
					}
					if ( e.ctrlKey && e.shiftKey && ( e.which === 80 ) ) {
					  return false; 
					}
					if ( e.ctrlKey && e.altKey && ( e.which === 67 ) ) {
					  return false; 
					}
					if ( e.ctrlKey && e.altKey && ( e.which === 73 ) ) {
					  return false; 
					}
					if (  e.shiftKey && ( e.which === 118 ) ) {
					  return false; 
					}
					if (  e.shiftKey && ( e.which === 116 ) ) {
					  return false; 
					}
				});
				
				$(document).bind('contextmenu', function(e) {
					if($('#right_click_message').val()!=''){
							alert($('#right_click_message').val());
							
						}
				   return false;
				   
				});	
		}
		
	//Parallex slider
	mobile();
	function mobile(){
   
      var parallax = document.querySelectorAll(".paralex-block,.paralex-block1"),
         speed = 0.3;
  
	  window.onscroll = function(){
		[].slice.call(parallax).forEach(function(el,i){
	
		  var windowYOffset = window.pageYOffset-250 ,
			  elBackgrounPos = "100%" + (windowYOffset * speed) + "px";
		  
		  el.style.backgroundPosition = elBackgrounPos;
	
		});
	  };
	}
			
	//Add Header banner in each page like category page
	
	var bread='<div class="cat_banner-comman paralex-block1" style="background-position: 100% -75px;"><div class="container"><div class="row  category_thumb_block"><div class="col-sm-12"><ul class="breadcrumb">';
	bread += $(".breadcrumb").html();
	bread += '</ul></div></div></div></div>';
	$('.breadcrumb').parent().before(bread);
	
	//change Image on hover in product page
	var im;
	$(".image-additional #image").hover(function(){
		im=$(".thumbnails .image li> a .zoomWrapper img").attr('src');
		$(this).trigger("click");						   
	},function(){});
	
	
	//Heading contained in <h1> or <h2>
	var h1=$("#content h1").html();
	var h2;
	
	
	
	if(typeof h1 == "undefined")
	{
			h2==$("#content h2").html();
		$(".breadcrumb").parent().prepend("<h1>" + $("#content  h2").html() + "</h1>");		
	}
	else if(typeof h2=="undefined")
	{
		$(".breadcrumb").parent().prepend("<h1>" + $("#content  h1").html() + "</h1>");		
	}
	

		
	
	// Image Manager
	$(document).delegate('a[data-toggle=\'image\']', 'click', function(e) {
		e.preventDefault();
		
		$('.popover').popover('hide', function() {
			$('.popover').remove();
		});
					
		var element = this;
		
		$(element).popover({
			html: true,
			placement: 'right',
			trigger: 'manual',
			content: function() {
				return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
			}
		});
		
		$(element).popover('show');

		$('#button-image').on('click', function() {
			$('#modal-image').remove();
		
			$.ajax({
				url: 'index.php?route=common/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
				dataType: 'html',
				beforeSend: function() {
					$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
					$('#button-image').prop('disabled', true);
				},
				complete: function() {
					$('#button-image i').replaceWith('<i class="fa fa-pencil"></i>');
					$('#button-image').prop('disabled', false);
				},
				success: function(html) {
					$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
		
					$('#modal-image').modal('show');
				}
			});
			
			$(element).popover('hide', function() {
				$('.popover').remove();
			});
		});		
		
		$('#button-clear').on('click', function() {
			$(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));
			
			$(element).parent().find('input').attr('value', '');
			
			$(element).popover('hide', function() {
				$('.popover').remove();
			});
		});
	});
	
	//Back to top button
	
	var offset = 250;
    var duration = 300;
    $(window).scroll(function() {
        if ($(this).scrollTop() > offset) {
            $('.back-to-top').fadeIn(duration);
        } else {
            $('.back-to-top').fadeOut(duration);
        }
    });

    $('.back-to-top').click(function(event) {
        event.preventDefault();
        $('html, body').animate({scrollTop: 0}, duration);
        return false;
    });
	
	
	//Add class to list Grid button
	if($(".product-list").css("display")=="block")
	{
		$("#list-view").addClass("active");
		$("#grid-view").removeClass("active");
	}
	
	if($(".product-grid").css("display")=="block")
	{
		$("#list-view").removeClass("active");
		$("#grid-view").addClass("active");
	}
	

	$("#list-view").click(function(){
		$(this).addClass("active");
		$("#grid-view").removeClass("active");
	});
	
	$("#grid-view").click(function(){
		$(this).addClass("active");
		$("#list-view").removeClass("active");
	});
	
	var im;
	$(".image-additional #image").hover(function(){
		im=$(".thumbnails .image li> a .zoomWrapper img").attr('src');
		$(this).trigger("click");						   
	},function(){});
	
	//inner zoom responsive)
	$(window).resize(function(){
		 mobile();		// Call to parallex slider function
		if($(window).width()<=1199)
		{
					//Zoom with fancybox
			$("#image").elevateZoom({gallery:'additional-carousel',zoomType:'inner',  cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true}); 	
					
			$("#image").bind("click", function(e) { var ez = $('#image').data('elevateZoom');	$.fancybox(ez.getGalleryList()); return false; }); 
					$(document).bind('cbox_complete', function(){
							//Zoom with fancybox quickview
					$("#qimage").elevateZoom({gallery:'additional-carousel1',zoomType:'inner', cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true}); 	
							
					$("#qimage").bind("click", function(e) {  var ez = $('#qimage').data('elevateZoom');	$.fancybox(ez.getGalleryList()); return false; }); 
			});
		}
		else
		{
			//Zoom with fancybox
			$("#image").elevateZoom({gallery:'additional-carousel',zoomWindowOffetx: 15,zoomWindowOffety: -3,  cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true}); 	
					
			$("#image").bind("click", function(e) { var ez = $('#image').data('elevateZoom');	$.fancybox(ez.getGalleryList()); return false; }); 
				$(document).bind('cbox_complete', function(){
							//Zoom with fancybox quickview
					$("#qimage").elevateZoom({gallery:'additional-carousel1', cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true}); 	
							
					$("#qimage").bind("click", function(e) {  var ez = $('#qimage').data('elevateZoom');	$.fancybox(ez.getGalleryList()); return false; }); 
			});
		}
		if($(window).width()<=991)
		{
			$(".mainmenu").addClass("dropdown-toggle");
			$(".menu-toggle").css("display","block");
			$(".submenu-toggle").css("display","block");
			$(".submenu-toggle").parent().find("ul").css("display","none");
		
			$(".footer-menu-toggle").css("display","block");		//footer button responsive
			$(".sub-footer").css("display","none");
			
		}
		else{
			$(".mainmenu").removeClass("dropdown-toggle");
			$(".menu-toggle").css("display","none");
			$(".submenu-toggle").css("display","none");
			$(".submenu-toggle").parent().find("ul").css("display","block");
			
			$(".footer-menu-toggle").css("display","none");		//footer button responsive
			$(".sub-footer").css("display","block");
			
		}
	}).resize();
	
	//Toggle footer menu +-
	$(".footer-menu-toggle").click(function(){
			if($(this).parent().find(".sub-footer").css("display")=="none")
			{
				$(this).parent().find(".sub-footer").css("display","block");
				$(this).html("-");
				$(this).addClass("open");
			}
			else
			{
				$(this).parent().find(".sub-footer").css("display","none");
				$(this).html("+");
				$(this).removeClass("open");
			}
			
	});
	
	//submenu toggle
	$(".submenu-toggle").click(function(){
			if($(this).parent().find("ul").css("display")=="none")
			{
					$(this).parent().find("ul").css("display","block");
					$(this).html("-");
					$(this).addClass("open");
			}
			else
			{
					$(this).parent().find("ul").css("display","none");
					$(this).html("+");
					$(this).removeClass("open");
			}
			
		
	});
	
	//Toggle main menu +-
		$(".menu-toggle").click(function(){
							 
	
		if($(this).parent().find(".dropdown-menu").css("display")=="none")
		{
				
			$(this).parent().find(".dropdown-menu").css("display","block");
			$(this).html("-");
			$(this).addClass("open");
		}
		else
		{
			$(this).parent().find(".dropdown-menu").css("display","none");
			$(this).html("+");
			$(this).removeClass("open");
		}
		
		
		});
		
		//Slider with condition
	
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
	//Slider with condition for category tab 
	
	$('.slider-block-category').owlCarousel({
	  items: 3,
      itemsDesktop : [991,3], //5 items between 1000px and 901px
      itemsDesktopSmall : [767,2], // betweem 900px and 601px
	  itemsTablet: [478,1], //2 items between 600 and 0
      itemsMobile : false, // itemsMobile disabled - inherit from itemsTablet option
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
	
	});
	
	//Slider with condition for category tab products
	
	$('.slider-block-cat').owlCarousel({
	  items: 1,
      itemsDesktop : [991,3], //5 items between 1000px and 901px
      itemsDesktopSmall : [767,2], // betweem 900px and 601px
	  itemsTablet: [478,1], //2 items between 600 and 0
      itemsMobile : false, // itemsMobile disabled - inherit from itemsTablet option
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
	
	});
	
	//Slider with condition for category tab products
	
	$('.slider-block-single').owlCarousel({
	  items: 1,
      itemsDesktop : [991,1], //5 items between 1000px and 901px
      itemsDesktopSmall : [767,1], // betweem 900px and 601px
	  itemsTablet: [478,1], //2 items between 600 and 0
      itemsMobile : false, // itemsMobile disabled - inherit from itemsTablet option
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
	
	});
	
	//Quick View
	
	$('a.quick_view').colorbox({position:'fixed',preloading:'false', className:'responsive_Qview',height:'500px',arrowKey:'false', width:'800px',title: $(this).attr("rel")
	}); 
	
	
	//toggle button Category
	$(".navigate").click(function(){

	if($(this).parent().find(".subcategory").css("display")=="none")
	{
		$(this).parent().find(".subcategory").css("display","block");
		$(this).html("-");
		$(this).addClass("open");
	}
	else
	{
		$(this).parent().find(".subcategory").css("display","none");
		$(this).html("+");
		$(this).removeClass("open");
		$(this).parent().find(".subnavigate").removeClass("open");
		$(this).parent().find(".subsubcategory").css("display","none");
	}
	});
	
	//toggle button subcategory
	$(".subnavigate").click(function(){
	
		if($(this).parent().find(".subsubcategory").css("display")=="none")
		{
			$(this).parent().find(".subsubcategory").css("display","block");
			$(this).html("-");
			$(this).addClass("open");
		}
		else
		{
			$(this).parent().find(".subsubcategory").css("display","none");
			$(this).html("+");
			$(this).removeClass("open");
		}
	});
	
	//slider without condition (testimonial)
	$('.testimonial_slider').owlCarousel({
		items: 2,
		autoPlay: 3000,
		itemsDesktop: [1199, 2],
		itemsDesktopSmall: [991, 1],
        itemsTablet: [768, 1],
        itemsMobile: [479, 1],
	//singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true,
	afterAction: function(el){
		
			var target = $(el).find('.owl-item');
			target.removeClass('owl-first').removeClass('owl-last'),
		    target.eq(this.currentItem).addClass('owl-first'),
            target.eq(this.currentItem + (this.options.items - 1)).addClass('owl-last')
		 
		}
	});
	
	
	
	//slider (product)
	$("#additional-carousel").owlCarousel({
	  	items : 4,
		navigation : true,
    	navigationText : ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
		});
    
	
	$("#additional-carousel1").owlCarousel({
	  	items : 4,
		navigation : true,
    	navigationText : ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
		});
	
	//NI_product_tab Active class
	$(".ni_tab").click(function(){
		var hrefid=$(this).attr('href').substr(1);
		$("#".hrefid).addClass('active');
		$(".ni_tab").parent().removeClass('active');
		$(this).parent().addClass('active');
	});
	
});

$(document).bind('cbox_complete', function(){
  			//Zoom with fancybox quickview
			$("#qimage").elevateZoom({gallery:'additional-carousel1', cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true}); 	
					
			$("#qimage").bind("click", function(e) {  var ez = $('#qimage').data('elevateZoom');	$.fancybox(ez.getGalleryList()); return false; }); 		
			
			$("#additional-carousel1").owlCarousel({
				items : 4,
				
				navigation : true,
				navigationText : ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>']
				});
});








	