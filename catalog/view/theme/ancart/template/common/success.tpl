<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <!--<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>-->
<div class="htabs-main">
      		<div style="border:1px solid #d1c09d; width:525px; float: left; margin-top: 20px; margin-right: 0px;"></div>
      		<div style="width:180px; float: left;"><span><h1 class="category"><?php echo $heading_title; ?></h1></span></div>
      		<div style="border:1px solid #d1c09d; width:525px; float: left; margin-top: 20px; margin-left: 0px;"></div>
      </div>
  <?php echo $text_message; ?>
  <!--<div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>-->
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>