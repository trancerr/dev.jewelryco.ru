<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php /*if ($robots) { ?>
<meta name="robots" content="<?php echo $robots; ?>" />
<?php } */?>
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ancart/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ancart/stylesheet/responsive.css" />
<link rel="stylesheet" href="catalog/view/javascript/FontAwesome/css/font-awesome.min.css">
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/jquery-ui.css" />
<script  type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jail/jail.min.js"></script>        
<!--<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js"></script>-->
<script src="catalog/view/javascript/jquery/lightbox/js/lightbox.min.js"></script>
<link href="catalog/view/javascript/jquery/lightbox/css/lightbox.css" rel="stylesheet" />
<script type="text/javascript">
$(function(){
$('img.imagejail').jail({
	speed : 1000
});
});</script>
<?php if ($lang == 'uk') {?>
<style>#menu li.menu {margin-right: 30px !important;}</style>
<?php } ?>
<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700&amp;subset=latin,vietnamese,latin-ext" rel="stylesheet" type="text/css">
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ancart/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ancart/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<!--[if lt IE 9]>
   <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
<!--[if lt IE 8]>
   <div style=' clear: both; text-align:center; position: relative;'>
     <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
       <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
    </a>
  </div>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript">
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
</script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body><!-- <?php echo $route; ?> -->
<div id="container"><!--<a id="toTop" style="display: block;"></a>-->
<div id="header">
<div id="logo"><a href="<?php echo $home; ?>"><img src="/catalog/view/theme/ancart/image/logo-pani2.png<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /><?php //echo $name; ?></a></div>
  <?php //if ($logo) { ?>
  <?php //} else { 
  		//if ($route == 'common/home') {
    	//	$name = '<h1>'.$name.'</h1>';
        //}
       	//echo '<div id="logo"><a class="welcome" href="'.$home.'">'.$name.'</a></div>';
    //}
  ?>
  <?php echo $language; ?>
  <?php //echo $currency; ?>
  
  <div id="welcome"><a href="/login/"><?php echo $text_login; ?></a> <span class="gray"><?php echo $text_login_or; ?></span> <a href="/index.php?route=account/register"><?php echo $text_register; ?></a>
    <?php //if (!$logged) { ?>
    <?php //echo $text_welcome; ?>
    <?php //} else { ?>
    <?php //echo $text_logged; ?>
    <?php //} ?>
  </div>
  
  <?php echo $cart; ?>
  <div id="account">
	  <div class="heading">
    	<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></div>
  </div>
  <div id="search">
    <div class="button-search "></div>
    <input class="" type="text" name="filter_name" placeholder="<?php echo $text_search; ?>" value="" />
  </div><!--ui-autocomplete-input-->
  <?php //echo $search; ?>
</div>
<div class="wrapper">
<!--<?php //print_r($categories);
?>-->
<div id="menu">
  <ul>
  	<li class="empty">&nbsp;</li>
    <li class="menu"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
    <li class="menu sub"><a href="/odezhda/<?php //echo $account; ?>"><?php echo $text_catalog; ?></a>
    	<ul class="sub-menu">
<?php
	foreach ($categories as $cat) {
		echo '<li class="sub-menu"><a href="'.$cat['href'].'">'.$cat['name'].'</a></li>';
	}	?>
		</ul>
    </li>
    <li class="menu"><a href="<?php echo $informations[9]['href']; ?>"><?php echo $informations[9]['title']; ?></a></li>
    <li class="menu"><a href="<?php echo $informations[6]['href']; ?>"><?php echo $informations[6]['title']; ?></a></li>
    <li class="menu"><a href="<?php echo $informations[14]['href']; ?>"><?php echo $informations[14]['title']; ?></a></li>
    <li class="menu"><a href="<?php echo $informations[13]['href']; ?>"><?php echo $informations[13]['title']; ?></a></li>
  </ul>
</div>
	
<?php /* if ($error) { ?>
        <div class="warning"><?php echo $error ?><img src="catalog/view/theme/ancart/image/close.png" alt="" class="close" /></div>
<?php } */?>
<div id="notification"></div>