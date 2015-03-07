<div class="product-filter" style="display:none">
	<div class="display"><b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display('grid');"><?php echo $text_grid; ?></a></div>
	<div class="limit"><b><?php echo $text_limit; ?></b>
		<select onchange="location = this.value;">
			<?php foreach($limits as $limits) { ?>
			<?php if($limits['value'] == $limit) { ?>
				<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
				<?php } ?>
			<?php } ?>
		</select>
	</div>
	<div class="sort"><b><?php echo $text_sort; ?></b>
		<select onchange="location = this.value;">
			<?php foreach($sorts as $sorts) { ?>
			<?php if($sorts['value'] == $sort . '-' . $order) { ?>
				<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
				<?php } ?>
			<?php } ?>
		</select>
	</div>
</div>
[product-grid]
<div class="product-grid">
<?php foreach ($products as $product) { ?>
    <div>
        <?php if ($product['thumb']) { ?>
        <div class="image">
		<a href="<?php echo $product['href']; ?>"><img class="imagejail" src="catalog/view/javascript/jquery/jail/blank.gif" width="<?php echo $product['thumbwidth']; ?>" height="<?php echo $product['thumbheight']; ?>" data-src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
		<noscript>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
		</noscript>
        
         <div class="sku"><a href="<?php echo $product['href']; ?>">Артикул <?php echo $product['sku']; ?></a></div>
        
	  </div>
      <?php } ?>
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
		<div class="arrow-box"></div>
       
	 </div>
    <?php } ?>
</div>
<div class="pagination" style="display:none"></div>
[/product-grid]
