<?php if ($container=='latest0') { ?>
<div id="tabs-main" class="htabs-main">
    <div class="htabs-left1"></div>
    <div class="htabs-middle1">
    <a href="#tab-latest0" class="selected"><?php echo $text_tab_novinki;?></a>
    <a href="#tab-bestseller0" onclick="tabsClick();"><?php echo $text_tab_populyarnye;?></a>
    <a href="#tab-special0" onclick="tabsClick();"><?php echo $text_tab_rasprodazha;?></a></div>
    <div class="htabs-right1" ></div>
</div>
<?php } ?> 

<div id="tab-<?php echo $container; ?>" class="tab-content-main" style="display: <?php echo ($container=='latest0')?'block':'none'; ?>">
<!--container = special bestseller latest -->
<div class="box">
<!--  <div class="box-heading"><?php echo $heading_title; ?></div>-->
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div>
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['popup']; ?>" data-lightbox="<?php echo $container; ?>"><div class="zoom-icon">&nbsp;</div></a>
		<a href="<?php echo $product['href']; ?>"><img class="imagejail" src="catalog/view/javascript/jquery/jail/blank.gif" width="<?php //echo $product['thumbwidth']; ?>" height="<?php //echo $product['thumbheight']; ?>" data-src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
		<noscript>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
		</noscript>

        <div class="sku"><a href="<?php echo $product['href']; ?>"><?php echo $text_articul;?> <?php echo $product['sku']; ?></a></div>
        
	  </div>
      <?php } ?>
		<div class="arrow-box"></div>
        <div class="name">
        	<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
        	<?php if ($product['price']) { ?>
            <!--<div class="price">-->
              <?php if (!$product['special']) { ?>
              <span class="price-new"><?php echo $product['price']; ?></span>
              <?php } else { ?>
              <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
              <?php } ?>
            <!--</div>-->
            <?php } ?>
        </div>
        
       <!-- <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>-->     
		<!--<div class="cart-box"><div class="cart"><a type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" >Add to cart </a></div>
		 <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');">wishlist</a></div>
      		<div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');">compare</a></div>
    	</div>-->
	 </div>
      <?php } ?>
    </div>
  </div>
</div>
</div>