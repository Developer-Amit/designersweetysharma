<div class="panel panel-default ni_filter">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
  <div class="list-group">
    <?php foreach ($filter_groups as $filter_group) { ?>
    <a class="list-group-item"><?php echo $filter_group['name']; ?></a>
    <div class="list-group-item">
      <div  class="filter-group"  id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
        <?php foreach ($filter_group['filter'] as $filter) { ?>
        <div class="checkbox">
          <label>
            <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
            <?php echo $filter['name']; ?>
            <?php } else { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
            <?php echo $filter['name']; ?>
            <?php } ?>
          </label>
        </div>
        <?php } ?>
		 
      </div>
	  
  
    </div>
	
    <?php } ?>
	<div class='price_filter'>
		
    <div class="panel-heading"><?php echo $price_tag; ?></div>
	<div class="price-sub_heading"><?php echo $price_range; ?></div>
       <div class="slider-range-upper">
	
	 <div class="slider-range-inner">
	 <div id="slider-range"></div>
		</div>
	<input type="text" id="amount" name="filter[]" readonly>
		 <input type="hidden" id="min" name="min" value="<?php echo $min; ?>"/>
		 <input type="hidden" id="max" name="max" value="<?php echo $max; ?>" />
	</div>
	</div>
  </div>
  
</div>
<script type="text/javascript"><!--
$(function() {
	filter = [];
    $( "#slider-range" ).slider({
      range: true,
      min: <?php echo $min_m ; ?>,
      max: <?php echo $max_m ; ?>,
      values: [ $("#min").val(), $("#max").val() ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "<?php echo $cur_symbol ; ?>" + ui.values[ 0 ] + " - " + "<?php echo $cur_symbol ; ?>" + ui.values[ 1 ] );
      }
	 
    });
	$( "#slider-range" ).on( "slidestop", function( event, ui ) {
		
		filter = [];
		$('input[name^=\'filter\']:checked').each(function(element) {
			filter.push(this.value);
		});
		
		$("#min").val(ui.values[ 0 ]);
		$("#max").val(ui.values[ 1 ]);
		$.ajax({
			type : 'GET',
			url	 : '<?php echo $action; ?>',
			data : {
					filter : filter.join(','),
					min    : ui.values[ 0 ],
					max	: ui.values[ 1 ]
				   },
			success : function(data){
				
				var res = $(data).find(".block-product-cat").html();
				$(".block-product-cat").html('');
				$(".pagination-block").html('');
				if(res!='undefined')
				{
					$(".block-product-cat").html($(data).find(".block-product-cat").html());
					$(".pagination-block").html($(data).find(".pagination-block").html());
				}
				localStorage.setItem('display', 'grid');
				$('#grid-view').trigger('click');
				history.pushState('', '','<?php echo $action; ?>&filter=' + filter.join(',') + '&min=' + ui.values[ 0 ] + '&max=' + ui.values[ 1 ]);
				$("#content").html($(data).find("#content").html());
			}
		});
		//location = '<?php echo $action; ?>&filter=' + filter.join(',') + '&min=' + ui.values[ 0 ] + '&max=' + ui.values[ 1 ];
	
	} );

    $( "#amount" ).val( "<?php echo $cur_symbol ; ?>" + $( "#slider-range" ).slider( "values", 0 ) + " - " + "<?php echo $cur_symbol ; ?>" + $( "#slider-range" ).slider( "values", 1 ) );
  });
  $(document).ajaxStart(function () {
  	      $('#spinner').fadeIn('fast');
    }).ajaxStop(function () {
        $('#spinner').stop().fadeOut('fast');
    });
$('input[name^=\'filter\']').on('click', function() {
	
		filter = [];
		$('input[name^=\'filter\']:checked').each(function(element) {
			filter.push(this.value);
		});
		$.ajax({
			type : 'GET',
			url	 : '<?php echo $action; ?>',
			data : {
					filter : filter.join(','),
					min    : $("#min").val(),
					max	: $("#max").val()
				   },
			success : function(data){
				
				var res = $(data).find(".block-product-cat").html();
				$(".block-product-cat").html('');
				$(".pagination-block").html('');
				if(res!='undefined')
				{
					$(".block-product-cat").html($(data).find(".block-product-cat").html());
					$(".pagination-block").html($(data).find(".pagination-block").html());
				}
				localStorage.setItem('display', 'grid');
				$('#grid-view').trigger('click');
				history.pushState('','' ,'<?php echo $action; ?>&filter=' + filter.join(',') + '&min=' + $("#min").val() + '&max=' + $("#max").val());
			}
		});
		
	
});
 <!--Edited by Nilkanthinfo-->//--></script>
