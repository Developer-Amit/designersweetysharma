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
    <div id="content" class="NI_blog_single <?php echo $class; ?>"><?php echo $content_top; ?>
<h1><?php echo $heading_title; ?></h1>   
   	
  
  	
   
		<div class="blog_single_content">
		<?php foreach ($blogs as $blog) { ?>
			
			<div class="blog_single_inner">
				<div class="blog_header">
					<h2><?php echo $blog['blog_name']; ?></h2>
					<div class="post_date"><span class="lable"> posted on :</span>&nbsp;<?php echo date("d-m-Y", strtotime($blog['published_date'])); ?></div>
				</div>
				<div class="blog_img_single">
					<img src="image/<?php echo $blog['image']; ?>" alt="<?php echo $blog['blog_name']; ?>" title="<?php echo $blog['blog_name']; ?>" class="img-responsive" />
				</div>
				<div class="blog_desc_single">
					<?php echo $blog['description']; ?>
				</div>
				<div class="blog_author_single blog_dt_details_single"><span class="lable1"><i class="fa fa-user" aria-hidden="true"></i> &nbsp;<?php echo $blog['author']; ?></span>
					<span class="lable1">	<i class="fa fa-clock-o" aria-hidden="true"></i>
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
					</span>
				
				</div>
			</div>
	
			<div class="user_comment_block">
				<div class="user_comment_header"><?php echo $blog['total_comment']; ?>&nbsp;Comments</div>
				<?php foreach($comments as $comment) { ?>
					<div class="user_comment_inner">	
				<div class="comment_block_lable">	<span class="lable"> <?php echo $comment['user']; ?></span>&nbsp;&nbsp;:&nbsp;&nbsp;
					<?php $datetime1 = new DateTime($comment['created']);
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
				<div class="user_comment">		<?php echo $comment['comment']; ?></div>
			</div>
				<?php } ?>
			</div>
			
			<div class="usercomment_block">
			
			
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="ni_blog">
	<div class="usercomment_header">Add Comment</div>
        <table width="100%">
         <input type="hidden" name="blog_id" value="<?php echo $_GET['blog_id']; ?>"/>
		  <tr>
            <td><span class="lable"><?php echo $entry_user ?></span>
              <input type="text" name="user" value="<?php echo $user; ?>" size = 90 />
              <?php if ($error_user) { ?>
              <span class="error"><?php echo $error_user; ?></span>
              <?php } ?></td>
          </tr>
          <tr class="textarea_main">
            <td class="textarea">
			<span class="lable"><?php echo $entry_newcomment; ?><span class="required">*</span>
				<?php if ($error_comment) { ?>
              <span class="error"><?php echo $error_comment; ?></span>
              <?php } ?>
			</span>
              <textarea name="newcomment" style="width: 99%;" rows="3"><?php echo $newcomment; ?></textarea>

              </td>
          </tr>
          
          <tr>
            <td>
			  <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?>
		 <span class="lable"> <?php echo $entry_email ?></span>
              <input type="text" name="email" value="<?php echo $email; ?>" />
            </td>
          </tr>
         
          <tr class="captcha_tr">
            <td>
             
               <?php if ($error_captcha) { ?>
              <span class="error"><?php echo $error_captcha; ?></span>
              <?php } ?>
              <img src="index.php?route=captcha/basic_captcha/captcha" />  
			  
		<span class="lable"><?php echo $entry_captcha; ?><span class="required">*</span></span>

              <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
		</td>
          </tr>
        </table>
	 
	  
      <div class="buttons clearfix">
        <table width=100%>
          <tr>
            <td width=50%><a  onclick="$('#ni_blog').submit();" class="button btn btn-default"><span><?php echo $button_send; ?></span></a></td>
			
          </tr>
        </table>

      </div>
    </form>
	</div>
	
		<?php } ?>

	</div>
	  <?php echo $content_bottom; ?>
	  </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

