<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
  <!--<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
    <?php if($i+1<count($breadcrumbs)) { ?><?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } ?>
    <?php } ?>
  </div>-->
  <div class="htabs-main">
      		<div class="htabs-left"></div>
      		<div class="htabs-middle"><span><h1 class="category"><?php echo $heading_title; ?></h1></span></div>
      		<div class="htabs-right"></div>
      </div>
  
<!--<div class="sort">Сортировать по:
<select onchange="location = this.value;" style="display:none;">
<option value="http://jewelryco.ru/kolye/?sort=p.sort_order&amp;order=ASC" selected="selected">По умолчанию</option>
<option value="http://jewelryco.ru/kolye/?sort=pd.name&amp;order=ASC">Имени от А до Я</option>
<option value="http://jewelryco.ru/kolye/?sort=pd.name&amp;order=DESC">Имени от Я до А</option>
<option value="http://jewelryco.ru/kolye/?sort=p.price&amp;order=ASC">Ценам: Низкие &gt; Высокие</option>
<option value="http://jewelryco.ru/kolye/?sort=p.price&amp;order=DESC">Ценам: Высокие &lt; Низкие</option>
<option value="http://jewelryco.ru/kolye/?sort=rating&amp;order=DESC">С низким рейтингом</option>
<option value="http://jewelryco.ru/kolye/?sort=rating&amp;order=ASC">С высоким рейтингом</option>
<option value="http://jewelryco.ru/kolye/?sort=p.model&amp;order=ASC">Модели от А до Я</option>
<option value="http://jewelryco.ru/kolye/?sort=p.model&amp;order=DESC">Модели от Я до А</option>
</select>
<a alt="Сортировать по: Цена по возрастанию" title="Сортировать по: Цена по возрастанию" href="http://jewelryco.ru/jewelry/?sort=p.price&amp;order=ASC">Цена по возрастанию</a>&nbsp;|&nbsp;
<a alt="Сортировать по: Цена по убыванию" title="Сортировать по: Цена по убыванию" href="http://jewelryco.ru/jewelry/?sort=p.price&amp;order=DESC">Цена по убыванию</a>
</div>-->
            
  <div class="product-filter" >
    <!--<div class="display"><?php echo $text_display; ?> <i class="fa fa-list fa-lg"></i>
    <a onclick="displaybutton('grid');"><i class="fa fa-th fa-lg"></i></a></div>-->
    <div class="limit"><b><?php echo $text_limit; ?></b>
      <select onchange="location = this.value;" size="5">
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
      <select onchange="location = this.value;" size="7">
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
  <?php if (0) { //if ($categories) { ?>
  <h2><?php echo $text_refine; ?></h2>
  <div class="category-list">
    <?php if (count($categories) <= 5) { ?>
    <ul>
      <?php foreach ($categories as $category) { ?>
      <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) { ?>
    <ul>
      <?php $j = $i + ceil(count($categories) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($categories[$i])) { ?>
      <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  
  <!--<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>-->
  <div class="product-grid">
    <?php foreach ($products as $product) { ?>
    <div>
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['popup']; ?>" data-lightbox="catalog"><div class="zoom-icon">&nbsp;</div></a>
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
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
	<?php echo $content_bottom; ?>
		<?php //if ($description_bottom) { ?>
			<div class="category-info">
				<?php //echo $description_bottom; ?>
			</div>
		<?php //} ?>
	</div>
<script type="text/javascript"><!--
function displaybutton (view) {
	//display(view);
	$(function(){
                $('img.imagejail').jail({
					effect: 'fadeIn',
					offset: 300,
					speed : 400
				});
            });
};
//display('grid');
function display111(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
			//html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			//html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			//html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
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
				html += '<div class="benefit-text"><?php //echo $text_benefits; ?></div>';
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
				html += '<div class="benefit-text"><?php //echo $text_benefits; ?></div>';
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
			//html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			//html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			//html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<?php echo $text_display; ?> <a onclick="displaybutton(\'list\');"><i class="fa fa-list fa-lg"></i></a> <i class="fa fa-th fa-lg"></i>');
		
		$.totalStorage('display', 'grid');
	}
}

//view = $.totalStorage('display');

//if (view) {
	//display(view);
//} else {
	//display('grid');
//}
//--></script> 
<?php echo $footer; ?>