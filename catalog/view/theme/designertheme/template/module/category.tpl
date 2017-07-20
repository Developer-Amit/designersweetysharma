<div class="block categories_block">
<h3 class="categories_block_heading block_heading">Categories</h3>
<div class="block-content ">
<div class="list-group box-category treeview-list treeview">
  <?php foreach ($categories as $category) { ?>
  <div class="maincat">
  <?php if ($category['category_id'] == $category_id) { ?>
	  <?php if ($category['children']) { echo '<button class="navigate open" >-</button>'; } ?>
	  <a href="<?php echo $category['href']; ?>" class="list-group-item active">
	  <?php   echo $category['name']; ?>
	  </a>
	  <?php } 
	  else { ?>
  		<?php if ($category['children']) { echo '<button class="navigate" >+</button>'; } ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item">
  <?php   echo $category['name'];?>
  </a>
  <?php } ?>
  
  
  <?php if ($category['children']) { ?>
  <div class="subcategory" <?php if ($category['category_id'] == $category_id) { echo "style='display:block'";} else { echo "style='display:none'"; }?>>
    <?php foreach ($category['children'] as $child) { ?>
	<div class="submenu">
    <?php if ($child['category_id'] == $child_id) { ?>
    <?php if ($child['children3']) { echo '<button class="subnavigate" >+</button>'; } ?>
    <a href="<?php echo $child['href']; ?>" class="list-group-item active">  <?php echo $child['name']; ?></a>
    <?php } else { ?>
    <?php if ($child['children3']) { echo '<button class="subnavigate" >+</button>'; } ?>
    <a href="<?php echo $child['href']; ?>" class="list-group-item">  <?php echo $child['name']; ?></a>
    <?php } ?>
  
    <?php if ($child['children3']) { ?>
    <div class="subsubcategory" style="display:none ">
      <?php foreach ($child['children3'] as $subchild) { ?>
      <?php if ($subchild['category_id'] == $child_id) { ?>
      <a href="<?php echo $subchild['href']; ?>" class="list-group-item active"> - <?php echo $subchild['name']; ?></a>
      <?php } else { ?>
      <a href="<?php echo $subchild['href']; ?>" class="list-group-item">  <?php echo $subchild['name']; ?></a>
      <?php } ?>
      <?php } ?>
    </div>
    <?php } ?>

	</div>
    <?php } ?>
  </div>
  <?php } ?>
  </div>
  <?php } ?>
</div>
</div>
</div>
