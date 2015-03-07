<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
  <!--<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
    <?php if($i+1<count($breadcrumbs)) { ?><?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } ?>
    <?php } ?>
  </div>-->
  <div class="htabs-main">
      		<div style="border:1px solid #d1c09d; width:525px; float: left; margin-top: 20px; margin-right: 0px;"></div>
      		<div style="width:180px; float: left;"><span><h1 class="category"><?php echo $heading_title; ?></h1></span></div>
      		<div style="border:1px solid #d1c09d; width:525px; float: left; margin-top: 20px; margin-left: 0px;"></div>
      </div>
  <?php echo $content_top; ?>
  <?php if ($thumb || $description) { ?>
  <div class="category-info">
  <?php if ($description) { ?>
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="display"><?php echo $text_display; ?> <i class="fa fa-list fa-lg"></i><a onclick="displaybutton('grid');"><i class="fa fa-th fa-lg"></i></a></div>
    <div class="limit"><b><?php echo $text_limit; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><b><?php echo $text_sort; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
  <div class="product-list">
    <?php foreach ($products as $product) { ?>
    <div>
      <?php if ($product['thumb']) { ?>
      <div class="image"><?php echo $product['sticker']; ?><a href="<?php echo $product['href']; ?>">
	  <img class="imagejail" data-src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
	  <noscript>
      <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
	  </noscript>
	  </a></div>
      <?php } ?>
	  <div class="rating">
				  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
	  </div>
	  
	  <?php if ($product['benefits']) { ?>
					<div class="benefit-text"><?php echo $text_benefits; ?></div>
					<div class="benefits">
					<ul class="benefit">
					<?php foreach ($product['benefits'] as $benefit) { ?>	
						<?php if ($benefit['type'] == 1) { ?>
							<li>
								<?php if (!$benefit['link']) { ?>
								   <span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span>
								<?php } else { ?> 
								   <a href="<?php echo $benefit['link']; ?>" target="_blank" title="<?php echo $benefit['name']; ?>"><span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span></a>
								<?php } ?>
								<?php if ($benefit['description']) { ?>
								<div class="benefit_description"><?php echo $benefit['description']; ?></div>
								<?php } ?>
							</li>
						<?php } ?> 
					<?php } ?>
					</ul>
					</div>
					<div class="present">
						<?php foreach ($product['benefits'] as $benefit) { ?>	
							<?php if ($benefit['type'] == 0) { ?>
								<div>
									<?php if (!$benefit['link']) { ?>
										<span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span>
									<?php } else { ?> 
										<a href="<?php echo $benefit['link']; ?>" target="_blank" title="<?php echo $benefit['name']; ?>"><span class="thumb"><img src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span></a>
									<?php } ?>
								</div>
							<?php } ?> 
						<?php } ?>
					</div>
				<?php } ?>
	  
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
      <div class="description"><?php echo $product['description']; ?></div>
      <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <br />
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="cart">
        <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
      </div>
      <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>
      <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div>
    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php }?>
  <?php echo $content_bottom; ?>
		<?php if ($description_bottom) { ?>
			<div class="category-info">
				<?php echo $description_bottom; ?>
			</div>
		<?php } ?>
	</div>
<script type="text/javascript"><!--
function displaybutton (view) {
	display(view);
	$(function(){
                $('img.imagejail').jail({
					effect: 'fadeIn',
					offset: 300,
					speed : 400
				});
            });
};

function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
					
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
			
			//benefits
			var benefit = $(element).find('.benefit').html();
			
			if (benefit != null) {
				html += '<div class="benefit-text"><?php echo $text_benefits; ?></div>';
				html += '  <div class="benefit">' + $(element).find('.benefit').html() + '</div>';
			}
			//benefits

			//benefits present
			var present = $(element).find('.present').html();
			
			if (present != null) {
				html += '  <div class="present">' + $(element).find('.present').html() + '</div>';
			}
			//benefits present
				
			html += '</div>';
						
			$(element).html(html);
		});		
		
		$('.display').html('<?php echo $text_display; ?> <i class="fa fa-list fa-lg"></i> <a onclick="displaybutton(\'grid\');"><i class="fa fa-th fa-lg"></i></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
			
			html += '<div class="arrow-box"></div><div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			//benefits
			var benefit = $(element).find('.benefit').html();
			
			if (benefit != null) {
				html += '<div class="benefit-text"><?php echo $text_benefits; ?></div>';
				html += '  <div class="benefit">' + $(element).find('.benefit').html() + '</div>';
			}
			//benefits
			//benefits present
			var present = $(element).find('.present').html();
			
			if (present != null) {
				html += '  <div class="present">' + $(element).find('.present').html() + '</div>';
			}
			//benefits present
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
			
			html += '<div class="cart-box">';			
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<?php echo $text_display; ?> <a onclick="displaybutton(\'list\');"><i class="fa fa-list fa-lg"></i></a> <i class="fa fa-th fa-lg"></i>');
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('grid');
}
//--></script> 
<?php echo $footer; ?>