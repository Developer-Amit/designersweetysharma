<div class="sidebar block information_block">
<h3 class="information_block_heading block_heading">Information</h3>
<div class="block-content">
    <ul class="nav nav-tabs nav-stacked">
        <?php foreach ($informations as $information) { ?>
            <li>
                <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
            </li>
        <?php } ?>
        <li>
            <a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
        </li>

        <li>
            <a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
        </li>
    </ul>
</div>
</div>