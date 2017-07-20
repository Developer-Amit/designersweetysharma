<?php echo $header; ?>
<div class="container">
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
    <div id="content" class="NI_blog_list <?php echo $class; ?>"><?php echo $content_top; ?>
<h1><?php echo $heading_title; ?></h1>   
   	
  		
		<div class="blog_list_content">
		<div class="blog_single_content">

		<?php foreach ($blogs as $blog) { ?>
			<div class="blog_single_inner">
				<div class="blog_header">	
				<h2><a href=javascript:void(0);'><?php echo $blog['blog_name']; ?></a></h2>
				<div class="post_date"><span class="lable">posted on:</span>&nbsp;<?php echo date("d-m-Y", strtotime($blog['published_date'])); ?></div>
				</div>
				<div class="blog_img_single">	
				<a href='javascript:void();'><img src="image/<?php echo $blog['image']; ?>" alt="<?php echo $blog['blog_name']; ?>" title="<?php echo $blog['blog_name']; ?>" class="img-responsive" /></a>
				</div>
				<div class="blog_desc_single">
				<?php echo $blog['description']; ?>
				</div>
				<!-- <div class="blog_dt_details_single blog_author_single"> -->
			<!-- <span class="lable1 author">	
				<i class="fa fa-user" aria-hidden="true"></i>&nbsp;<?php echo $blog['author']; ?></span> -->
				
			<!-- <span class="lable1 clock">	<i class="fa fa-clock-o" aria-hidden="true"></i>

				
					<?php $datetime1 = new DateTime($blog['published_date']);
						$datetime2 = new DateTime();
						$interval = $datetime1->diff($datetime2);
	
						if( $interval->format('%y') >= 1 ){
							$time = $interval->format('%y');
							if( $time == 1) {
								$tag = ' year ago'; }
							else {
								$tag = ' years ago'; }
						}
						else if( $interval->format('%m') >= 1 ){
							$time = $interval->format('%m');
							if( $time == 1) {
								$tag = ' month ago'; }
							else {
								$tag = ' months ago'; }
						}
						else if( $interval->format('%d') >= 1 ){
							$time = $interval->format('%d');
							if( $time == 1) {
								$tag = ' day ago'; }
							else {
								$tag = ' days ago'; }
						}
						else if( $interval->format('%h') >= 1 ){
							$time = $interval->format('%h');
							if( $time == 1) {
								$tag = ' hour ago'; }
							else {
								$tag = ' hours ago'; }
						}
						else if( $interval->format('%i') >= 1 ){
							$time = $interval->format('%i');
							if( $time == 1) {
								$tag = ' minute ago'; }
							else {
								$tag = ' minutes ago'; }
						}
						else {
							$time = $interval->format('%s');
							if( $time == 1) {
								$tag = ' second ago'; }
							else {
								$tag = ' seconds ago'; }
						}
						
						echo ' '.$time . ' ' . $tag;
						?>
				</span> -->
			<!-- <span class="lable1 comment"><i class="fa fa-comment-o" aria-hidden="true"></i>
 		Comments:<?php echo $blog['total_comment']; ?></span> -->
				
				<!-- </div>
				 -->
			</div>
		
		
		<?php } ?>
		
		</div>
	
	 		 <?php echo $content_bottom; ?>
	 	 </div>
    <?php echo $column_right; ?>
	</div>
</div>
</div>

<?php echo $footer; ?>

