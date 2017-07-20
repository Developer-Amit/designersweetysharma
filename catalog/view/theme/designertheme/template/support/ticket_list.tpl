<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
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
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $addticket_url; ?>" class="btn btn-primary"><?php echo $button_addticket; ?></a></div>
      </div>

      <?php if ($tickets) { ?>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-right">Ticket No.</td>
              <td class="text-right">Title</td>
              <td class="text-right">Ticket Date</td>
              <td class="text-right">Action</td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($tickets as $ticket) { ?>
            <tr>
              <td class="text-right"><?php echo $ticket['ticketno']; ?></td>
              <td class="text-right"><?php echo $ticket['title']; ?></td>
              <td class="text-right"><?php echo $ticket['datetime']; ?></td>
              <td class="text-left"><a href="<?php echo $view.'&id='.$ticket['id']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-default"><i class="fa fa-eye"></i></a></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <div class="text-right"><?php echo $pagination; ?></div>
      <?php } else { ?>
      <p>Ticket Not Found</p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>