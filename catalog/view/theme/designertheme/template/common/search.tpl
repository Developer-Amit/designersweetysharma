<div id="search" class="input-group">
<!--Added by Nilkanthinfo for category search-->	
<select id="search-category" name="search-category" class="form-control">
	<?php if ($category_id == 0) { ?>
		<option value="0"><?php echo $text_category; ?></option>
	<?php } else { ?>
		<option value="0" selected="selected"><?php echo $text_category; ?></option>
	<?php } ?>
	<?php foreach($categories as $category) { ?>
		<?php if ($category['category_id'] == $category_id) { ?>
		<option value="<?php echo $category['category_id']; ?>" selected="selected" class="parent_cat"><?php echo $category['name']; ?></option>
		<?php } else { ?>
        <option value="<?php echo $category['category_id']; ?>"  class="parent_cat"><?php echo $category['name']; ?></option>
        <?php } ?>
			 <?php if ($category['children']) { ?>
			 		
  					<?php for ($i = 0; $i < count($category['children']);) { ?>
							<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
							<?php for (; $i < $j; $i++) { ?>
							<?php if (isset($category['children'][$i])) { ?>
								<?php if ($category['children'][$i]['category_id'] == $category_id) { ?>
								<option value="<?php echo $category['children'][$i]['category_id']; ?>" selected="selected" class="sub_cat"><?php echo $category['children'][$i]['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $category['children'][$i]['category_id']; ?>" class="sub_cat"><?php echo $category['children'][$i]['name']; ?></option>
								<?php } ?>
								<?php if(sizeof($category['children'][$i]['children3'])>0) {?>
									
									<?php 	for ($k = 0; $k < count($category['children'][$i]['children3']);) { ?>
											<?php $l = $k + ceil(count($category['children'][$i]['children3']) / $category['column']); ?>
											<?php for (; $k < $l; $k++) { ?>
												<?php if (isset($category['children'][$i]['children3'][$k])) { ?>
													<?php if ($category['children'][$i]['children3'][$k]['category_id'] == $category_id) { ?>
														<option value="<?php echo $category['children'][$i]['children3'][$k]['category_id']; ?>" selected="selected" class="sub_sub_cat"><?php echo $category['children'][$i]['children3'][$k]['name']; ?></option>
													<?php } else { ?>
														<option value="<?php echo $category['children'][$i]['children3'][$k]['category_id']; ?>" class="sub_sub_cat"><?php echo $category['children'][$i]['children3'][$k]['name']; ?></option>
													<?php } ?>
												<?php } ?>
											<?php } ?>
									<?php } ?>
									
								<?php } ?>
							
							<?php } ?>
							<?php } ?>
					<?php } ?>
			<?php } ?>
	<?php } ?>
</select>
<!--End Added by Nilkanthinfo for category search-->
 <div class="btn_input_search">
  <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
  <span class="input-group-btn">
    <button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button>
  </span>
  </div>
</div>