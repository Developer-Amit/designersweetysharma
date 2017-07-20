<div class="block NIBlog_block">
	<div class="container">
		<?php if(sizeof($blogs)>0) {?>
		<h3  class="blog_block_heading block_heading">
			<span> <?php echo $heading_title; ?></span>
		</h3>
		<?php	$slidelimit="3";	?>		<!-- Number of product limit for the slider by Nilkanthinfo.-->
		<div class="Blog_content  <?php if($position == 'column_left' || $position == 'column_right'){ echo 'slider-block-single';} else{ if((sizeof($blogs) > $slidelimit) ) {   echo 'slider-block-category';} else { echo 'grid-block';}}  ?>">
		<?php $k=0; ?>
	<?php  foreach($blogs as $blog) { $k++; ?>
		<div class="blog-thumb-upper col-lg-4 col-md-4 col-sm-6 col-xs-12 <?php echo ($k%2==0) ? 'even' :  'odd'; ?>">
			<div class="blog-thumb">
				<div class="blog_block_inner">
					<div class="blog_bottom bottom1">
						<div class="blog_name">
							<a href='<?php echo $blog["href"]; ?>'><?php echo $blog['blog_name']; ?></a>
						</div>
						<div class="blog_author">
							by&nbsp;<?php echo $blog['author']; ?>
						</div>
					
						<div class="blog_des">
							<?php echo $blog['description']; ?>
						</div>
						
							<div class="blog_commt">
									<i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;<?php echo $blog['comments']; ?>
									&nbsp;comments
								</div>
						<div class="blog_details"><i class="fa fa-clock-o" aria-hidden="true"></i>
							<?php echo date("d-m-Y", strtotime($blog['published_date']));
								$datetime1 = new DateTime($blog['published_date']);
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
						
						</div>
					</div>
					<div class="blog_top">
						<div class="blog_img">
							<a href='<?php echo $blog["href"]; ?>'><img src="image/<?php echo $blog['image']; ?>" alt="<?php echo $blog['blog_name']; ?>" title="<?php echo $blog['blog_name']; ?>" class="img-responsive" /></a>
						</div>
					</div>
					<div class="blog_bottom bottom2">
						<div class="blog_name">
							<a href='<?php echo $blog["href"]; ?>'><?php echo $blog['blog_name']; ?></a>
						</div>
						<div class="blog_author">
							by&nbsp;<?php echo $blog['author']; ?>
						</div>
					
						<div class="blog_des">
							<?php echo $blog['description']; ?>
						</div>
						
						<div class="blog_commt">
									<i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;<?php echo $blog['comments']; ?>
									&nbsp;comments
								</div>
						<div class="blog_details"><i class="fa fa-clock-o" aria-hidden="true"></i>
							<?php echo date("d-m-Y", strtotime($blog['published_date']));
								$datetime1 = new DateTime($blog['published_date']);
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
						
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<?php } ?> 

		
	
</div>
<a class="allblogs" href='<?php echo $allblog; ?>'><?php echo $bloglink; ?></a>
<?php } ?>
	</div>
</div>