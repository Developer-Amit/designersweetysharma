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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <form class="form-horizontal">
        <fieldset id="account">
          <legend>Ticket Info</legend>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-firstname">Title</label>
            <div class="col-sm-10">
            <?php echo $title;?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-firstname">Description</label>
            <div class="col-sm-10">
            <?php echo $description;?>
            </div>
          </div>
        </fieldset>
      </form>
      <div class="buttons clearfix">
        <div class="pull-left">Comments</div>
      </div>
      <form class="form-horizontal">
        <fieldset id="account">
          <?php foreach($replyes as $row){?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-firstname">Reply : </label>
            <div class="col-sm-10">
            <?php echo html_entity_decode($row['replydescription'], ENT_QUOTES, 'UTF-8');;?>
            </div>
          </div>
          <?php } ?>
        </fieldset>
      </form>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset id="account">
          <legend>Put Your Comment</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname">Title</label>
            <div class="col-sm-10">
              <input type="text" name="commenttitle" value="<?php echo $title; ?>" readonly id="input-title" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-lastname">Description</label>
            <div class="col-sm-10">
              <textarea rows="10" cols="89" class="form-control summernote" name="commentdescription"></textarea>
              <?php if ($error_message) { ?>
              <div class="text-danger"><?php echo $error_message; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-lastname"></label>
            <div class="col-sm-10">
              <button type="submit" class="btn btn-primary" name="submit">Submit</button>
            </div>
          </div>
          <input type="hidden" name="ticketid" value="<?php echo $ticketid;?>">
        </fieldset>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
