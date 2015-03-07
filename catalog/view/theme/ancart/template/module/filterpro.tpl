<?php if($tags || $categories || $options || $manufacturers || $attributes || $price_slider) { ?>
<div id="filterpro_box" class="box">
<div class="box-heading"><?php echo $heading_title; ?><div style="height: 15px; float: right;">
	<a class="clear_filter"><?php echo $clear_filter?></a></div></div>
<div class="box-content filterpro">
<form id="filterpro">

<div class="option_box" <?php if(!$instock_visible) echo 'style="display:none"'; ?>>
	<input type="checkbox" class="filtered" name="instock" id="instock" <?php if($instock_checked) echo 'checked="checked"'; ?>><label for="instock"><?php echo $text_instock?></label>
</div>
	<?php if($manufacturers) { ?>
	<?php foreach($manufacturers as $manufacturer) { ?>
	<input type="hidden" class="m_name" id="m_<?php echo $manufacturer['manufacturer_id']?>" value="<?php echo $manufacturer['name']?>">
		<?php } ?>
	<?php } ?>

	<?php if($options) { ?>
	<?php foreach($options as $option) { ?>
		<?php foreach($option['option_values'] as $option_value) { ?>
		<input type="hidden" class="o_name" id="o_<?php echo $option_value['option_value_id']?>" value="<?php echo $option_value['name']?>">
			<?php } ?>
		<?php } ?>
	<?php } ?>
	<?php if($category_id !== false) { ?>
		<input type="hidden" name="category_id" value="<?php echo $category_id ?>">
	<?php } ?>
	<?php if(isset($manufacturer_id)) { ?>
		<input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id ?>">
	<?php }?>
<input type="hidden" name="page" id="filterpro_page" value="1">
<input type="hidden" name="path" value="<?php echo $path ?>">
<input type="hidden" name="sort" id="filterpro_sort" value="">
<input type="hidden" name="order" id="filterpro_order" value="">
<input type="hidden" name="limit" id="filterpro_limit" value="">
<input type="hidden" name="route" value="<?php echo (isset($this->request->get['route']) ? $this->request->get['route'] : "");?>">
<script type="text/javascript">
	function afterload(){
		<?php echo $filterpro_afterload; ?>
	}
</script>

<div class="option_box" <?php if(!$price_slider) { echo 'style="display:none"';}?>>
<div class="option_name"><?php echo $text_price_range?></div>
<div class="price_slider collapsible">
<table>
	<tr>
		<?php if($symbol_left){ echo "<td><label>". $symbol_left  . "</label></td>";}?>
		<td><input type="text" id="min_price" value="-1" name="min_price" class="price_limit"></td>
		<td><label> - </label></td>
		<td><input type="text" id="max_price" value="-1" name="max_price" class="price_limit"></td>
		<?php if($symbol_right){ echo "<td><label>" . $symbol_right . "</label></td>";}?>
	</tr>
</table>
	<div id="slider-range"></div>
</div>
</div>
	<?php if($filter_groups) { ?>
		<ul class="box-filter option_box">
		  <?php foreach ($filter_groups as $filter_group) { ?>
		  <li><span id="filter-group<?php echo $filter_group['filter_group_id']; ?>" class="option_name <?php if(!$expanded_filters){echo "hided";}?>"><?php echo $filter_group['name']; ?></span>
			<ul class="collapsible" <?php if(!$expanded_filters){echo 'style="display:none"';}?>>
			  <?php foreach ($filter_group['filter'] as $filter) { ?>
			  <li>
				<input type="checkbox" class="filtered" name="filter[]" value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" />
				<label for="filter<?php echo $filter['filter_id']; ?>"><?php echo $filter['name']; ?></label>
			  </li>
			  <?php } ?>
			</ul>
		  </li>
		  <?php } ?>
		</ul>
	<?php } ?>

	<?php if($categories) { ?>
<div class="option_box">
	<div class="option_name <?php if(!$expanded_categories){echo "hided";}?>"><?php echo $text_categories; ?></div>
	<div class="collapsible" <?php if(!$expanded_categories){echo 'style="display:none"';}?>>
		<table id="filter_categories">
			<?php foreach($categories as $category) { ?>
			<tr>
				<td>
					<input id="cat_<?php echo $category['category_id']; ?>" class="filtered"
						   type="checkbox" name="categories[]"
						   value="<?php echo $category['category_id']; ?>">
				</td>
				<td>
					<label for="cat_<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></label>
				</td>
			</tr>
			<?php } ?>
		</table>
	</div>
</div>
	<?php } ?>

	<?php if($tags) { ?>
<div class="option_box">
	<div class="option_name <?php if(!$expanded_tags){echo "hided";}?>"><?php echo $text_tags; ?></div>
	<div class="collapsible" <?php if(!$expanded_tags){echo 'style="display:none"';}?>>
		<table id="filter_tags">
			<?php foreach($tags as $tag) { ?>
			<tr>
				<td>
					<input id="tag_<?php echo $tag['tag']; ?>" class="filtered"
						   type="checkbox" name="tags[]"
						   value="<?php echo $tag['tag']; ?>">
				</td>
				<td>
					<label for="tag_<?php echo $tag['tag']; ?>"><?php echo $tag['name']; ?></label>
				</td>
			</tr>
			<?php } ?>
		</table>
	</div>
</div>
	<?php } ?>


	<?php if($manufacturers) { ?>
<div class="option_box">
	<div class="option_name <?php if(!$expanded_manufacturer){echo "hided";}?>"><?php echo $text_manufacturers; ?></div>
	<div class="collapsible" <?php if(!$expanded_manufacturer){echo 'style="display:none"';}?>>
		<?php if($display_manufacturer == 'select') { ?>
		<div>
			<select name="manufacturer[]" class="filtered">
				<option value=""><?php echo $text_all?></option>
				<?php foreach($manufacturers as $manufacturer) { ?>
				<option id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value"
						value="<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']?></option>
				<?php } ?>
			</select>
		</div>
		<?php } elseif($display_manufacturer == 'checkbox') { ?>
		<table>
			<?php foreach($manufacturers as $manufacturer) { ?>
			<tr>
				<td>
					<input id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value filtered"
						   type="checkbox" name="manufacturer[]"
						   value="<?php echo $manufacturer['manufacturer_id']?>">
				</td>
				<td>
					<label for="manufacturer_<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']?></label>
				</td>
			</tr>
			<?php } ?>
		</table>
		<?php } elseif($display_manufacturer == 'radio') { ?>
		<table>
			<?php foreach($manufacturers as $manufacturer) { ?>
			<tr>
				<td>
					<input id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value filtered"
						   type="radio" name="manufacturer[]"
						   value="<?php echo $manufacturer['manufacturer_id']?>">
				</td>
				<td>
					<label for="manufacturer_<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']?></label>
				</td>
			</tr>
			<?php } ?>
		</table>
		<?php }?>
	</div>
</div>
	<?php } ?>

	<?php if($attributes) { ?>
	<?php foreach($attributes as $attribute_group_id => $attribute) { ?>
	<?php if($attr_group) { ?>
	<div class="option_box">
		<div class="attribute_group_name">
			<?php echo $attribute['name']; ?>
			<?php if($attribute['tooltip']) { ?>
			<img class="attribute-group-tooltip" style="cursor: pointer" src="catalog/view/theme/default/image/tooltip.png" title="<?php echo $attribute['tooltip']; ?>"
				 alt="<?php echo $attribute['name']; ?>"/>
			<?php } ?>
		</div>
	<?php } ?>

		<?php foreach($attribute['attribute_values'] as $attribute_value_id => $attribute_value) { ?>
		<div class="attribute_box <?php if($attr_group=="0") echo "option_box"; ?>">

			<div class="option_name <?php if(!$attribute_value['expanded']){echo "hided";}?>">
                <?php echo $attribute_value['name']; ?>
                <?php if ($attribute_value['tooltip']) { ?>
        	    <img class="attribute-tooltip" style="cursor: pointer" src="catalog/view/theme/default/image/tooltip.png" title="<?php echo $attribute_value['tooltip']; ?>" alt="<?php echo $attribute_value['name']; ?>" />
        	    <?php } ?>
            </div>
			<div class="collapsible" <?php if(!$attribute_value['expanded']){echo 'style="display:none"';}?>>
				<?php if($attribute_value['display'] == 'select') { ?>
				<div>
					<select class="filtered" name="attribute_value[<?php echo $attribute_value_id?>][]">
						<option value=""><?php echo $text_all?></option>
						<?php foreach($attribute_value['values'] as $i => $value) { ?>
						<option class="a_name"
								at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
								at_v_t="<?php echo $attribute_value_id . '_' . htmlspecialchars(preg_replace('/\s+|\n|\r|\s+$/m', '_', $value)) ?>"
								data-value="<?php echo $value ?>"
								value="<?php echo $value ?>"><?php echo $value ?></option>
						<?php }?>
					</select>
				</div>
				<?php } elseif($attribute_value['display'] == 'checkbox') { ?>
				<table>
					<?php foreach($attribute_value['values'] as $i => $value) { ?>
					<tr>
						<td>
							<input class="filtered a_name"
								   id="attribute_value_<?php echo $attribute_value_id . $i; ?>"
								   type="checkbox" name="attribute_value[<?php echo $attribute_value_id?>][]"
								   at_v_i="<?php echo $attribute_value_id . '_' . $value; ?>"
								   value="<?php echo $value ?>">
						</td>
						<td>
							<label for="attribute_value_<?php echo $attribute_value_id . $i; ?>"
								   at_v_t="<?php echo $attribute_value_id . '_' . htmlspecialchars(preg_replace('/\s+|\n|\r|\s+$/m', '_', $value)); ?>"
								   data-value="<?php echo strip_tags(html_entity_decode($value, ENT_QUOTES)); ?>"
								   value="<?php echo $value ?>"><?php echo strip_tags(html_entity_decode($value, ENT_QUOTES))?></label>
						</td>
					</tr>
					<?php } ?>
				</table>
				<?php } elseif($attribute_value['display'] == 'radio') { ?>
				<table>
					<?php foreach($attribute_value['values'] as $i => $value) { ?>
					<tr>
						<td>
							<input class="filtered a_name"
								   id="attribute_value_<?php echo $attribute_value_id . $i; ?>"
								   type="radio" name="attribute_value[<?php echo $attribute_value_id?>][]"
								   at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
								   value="<?php echo $value ?>">
						</td>
						<td>
							<label for="attribute_value_<?php echo $attribute_value_id . $i; ?>"
								   at_v_t="<?php echo $attribute_value_id . '_' . htmlspecialchars(preg_replace('/\s+|\n|\r|\s+$/m', '_', $value)) ?>"
								   data-value="<?php echo $value ?>"
								   value="<?php echo $value ?>"><?php echo $value?></label>
						</td>
					</tr>
					<?php } ?>
				</table>
				<?php } elseif($attribute_value['display'] == 'slider') { ?>
				<table style="width:100%">
					<tr>
					    <td style="width: 50%"><span id="attribute_label_<?php echo $attribute_value_id; ?>_min"><?php echo min($attribute_value['values']) . $attribute_value['suffix']; ?></span>
							<input type="hidden" id="attribute_value_<?php echo $attribute_value_id; ?>_min" name="attr_slider[<?php echo $attribute_value_id?>][min]" value="">
						</td>
							    <td><span id="attribute_label_<?php echo $attribute_value_id; ?>_max"><?php echo max($attribute_value['values']) . $attribute_value['suffix']; ?></span>
							<input type="hidden" id="attribute_value_<?php echo $attribute_value_id; ?>_max" name="attr_slider[<?php echo $attribute_value_id?>][max]" value="">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="slider-range-<?php echo $attribute_value_id; ?>" style="margin-left: 5px;margin-right: 5px;"></div>
						</td>
					</tr>
				</table>
				<script>
						var attr_arr_<?php echo $attribute_value_id; ?> = [<?php echo implode(',', $attribute_value['values']); ?>];
					$('#slider-range-<?php echo $attribute_value_id; ?>').slider({
						range:true,
						min:0,
							max:<?php echo count($attribute_value['values'])-1; ?>,
							values:[0, <?php echo count($attribute_value['values'])-1; ?>],
						slide:function (a, b) {
							var min = attr_arr_<?php echo $attribute_value_id; ?>[b.values[0]];
							var max = attr_arr_<?php echo $attribute_value_id; ?>[b.values[1]];
        							$("#attribute_label_<?php echo $attribute_value_id; ?>_min").html(min + '<?php echo $attribute_value['suffix']; ?>');
        							$("#attribute_label_<?php echo $attribute_value_id; ?>_max").html(max + '<?php echo $attribute_value['suffix']; ?>');
						},
						stop:function (a, b) {
							var min = attr_arr_<?php echo $attribute_value_id; ?>[b.values[0]];
							var max = attr_arr_<?php echo $attribute_value_id; ?>[b.values[1]];
							$("#attribute_value_<?php echo $attribute_value_id; ?>_min").val(min);
							$("#attribute_value_<?php echo $attribute_value_id; ?>_max").val(max);
							iF(true)
						}
					});
				</script>
				<?php } ?>
			</div>
		</div>
		<?php } ?>
		<?php if($attr_group) { ?>
	</div>
		<?php } ?>
		<?php } ?>
	<?php } ?>

	<?php if($options) { ?>
	<?php foreach($options as $option) { ?>
	<div class="option_box">
		<div class="option_name <?php if(!$option['expanded']){echo "hided";}?>">
            <?php if($option_main_checkbox && $option['display'] == 'checkbox') { ?><input type="checkbox" style="margin-left: 6px;"/><?php } ?><?php echo $option['name']; ?>
            <?php if ($option['tooltip']) { ?>
            <img class="option-tooltip" style="cursor: pointer" src="catalog/view/theme/default/image/tooltip.png" title="<?php echo $option['tooltip']; ?>" alt="<?php echo $option['name']; ?>" />
            <?php } ?>
        </div>
		<?php if($option['display'] == 'select') { ?>
		<div class="collapsible" <?php if(!$option['expanded']){echo 'style="display:none"';}?>>
			<select class="filtered" name="option_value[<?php echo $option['option_id']?>][]">
				<option value=""><?php echo $text_all?></option>
				<?php foreach($option['option_values'] as $option_value) { ?>
				<option class="option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
						value="<?php echo $option_value['option_value_id'] ?>"><?php echo $option_value['name']?></option>
				<?php }?>
			</select>
		</div>
		<?php } elseif($option['display'] == 'checkbox') { ?>
		<div class="collapsible" <?php if(!$option['expanded']){echo 'style="display:none"';}?>>
		<table>
			<?php foreach($option['option_values'] as $option_value) { ?>
			<tr>
				<td>
					<input class="filtered option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
						   type="checkbox" name="option_value[<?php echo $option['option_id']?>][]"
						   value="<?php echo $option_value['option_value_id']?>">
				</td>
				<td>
					<label for="option_value_<?php echo $option_value['option_value_id']?>"><?php echo $option_value['name']?></label>
				</td>
			</tr>
			<?php } ?>
		</table>
		</div>
		<?php } elseif($option['display'] == 'radio') { ?>
		<table class="collapsible" <?php if(!$option['expanded']){echo 'style="display:none"';}?>>
			<?php foreach($option['option_values'] as $option_value) { ?>
			<tr>
				<td>
					<input class="filtered option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
						   type="radio" name="option_value[<?php echo $option['option_id']?>][]"
						   value="<?php echo $option_value['option_value_id']?>">
				</td>
				<td>
					<label for="option_value_<?php echo $option_value['option_value_id']?>"><?php echo $option_value['name']?></label>
				</td>
			</tr>
			<?php } ?>
		</table>
		<?php } elseif($option['display'] == 'image') { ?>
		<div class="collapsible" <?php if(!$option['expanded']) { echo 'style="display:none"'; }?>>
			<?php foreach($option['option_values'] as $option_value) { ?>

					<input style="display: none;" class="filtered option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
						   type="checkbox" name="option_value[<?php echo $option['option_id']?>][]"
						   value="<?php echo $option_value['option_value_id']?>">
					<img src="<?php echo $option_value['thumb'];?>" title="<?php echo $option['name'];?>" alt="<?php echo $option['name'];?>"/>

			<?php } ?>
		</div>
		<?php }?>
	</div>
		<?php } ?>
	<?php } ?>
</form>
</div>

</div>
<script type="text/javascript">
$(document).ready(function () {
    initfilter(jQuery.parseJSON('<?php echo $filterOptions;?>'));
});

$('.attribute-tooltip, .attribute-group-tooltip, .option-tooltip').qtip
({
	content:  {text: $(this).attr('title'), title: {text: '', button: false}},
	position: {my: 'bottom center', at: 'top center', adjust: {x: 0, y: 0}, viewport: $(window), effect: false},
	show:     {event: 'mouseover', solo: true, fixed: true, delay: 250},
	style:    {classes: 'qtip-shadow qtip-rounded qtip-light'},
	hide:     'unfocus'
});
</script>

<?php } ?>