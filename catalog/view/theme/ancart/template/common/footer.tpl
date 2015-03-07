</div>
</div>
<div id="footer">
    <div class="border">
      <div class="column">
        <h3><? echo $text_o_magazine; ?></h3>
        <ul>
          <li><a href="<?php echo $informations[0]['href']; ?>"><?php echo $informations[0]['title']; ?></a></li>
          <li><a href="<?php echo $informations[1]['href']; ?>"><?php echo $informations[1]['title']; ?></a></li>
          <li><a href="<?php echo $informations[2]['href']; ?>"><?php echo $informations[2]['title']; ?></a></li>
          <li><a href="<?php echo $informations[3]['href']; ?>"><?php echo $informations[3]['title']; ?></a></li>
          <li><a href="<?php echo $informations[4]['href']; ?>"><?php echo $informations[4]['title']; ?></a></li>
        </ul>
      </div>
      <div class="column">
        <h3><? echo $text_partneram; ?></h3>
        <ul>
          <li><a href="<?php echo $informations[5]['href']; ?>"><?php echo $informations[5]['title']; ?></a></li>
        </ul>
      </div>
      <div class="column">
        <h3><? echo $text_pokupatelyam; ?></h3>
        <ul>
          <li><a href="<?php echo $informations[6]['href']; ?>"><?php echo $informations[6]['title']; ?></a></li>
          <li><a href="<?php echo $informations[7]['href']; ?>"><?php echo $informations[7]['title']; ?></a></li>
          <li><a href="<?php echo $informations[8]['href']; ?>"><?php echo $informations[8]['title']; ?></a></li>
          <li><a href="<?php echo $informations[9]['href']; ?>"><?php echo $informations[9]['title']; ?></a></li>
          <li><a href="<?php echo $informations[10]['href']; ?>"><?php echo $informations[10]['title']; ?></a></li>
          <li><a href="<?php echo $informations[11]['href']; ?>"><?php echo $informations[11]['title']; ?></a></li>
          <li><a href="<?php echo $informations[12]['href']; ?>"><?php echo $informations[12]['title']; ?></a></li>
        </ul>
      </div>
      <div class="column">
      <?php if ($categories) { ?>
        <h3><? echo $text_catalog; ?></h3>
        <ul>
        <?php foreach ($categories as $category) {
          echo '<li><a href="'.$category['href'].'">'.$category['name'].'</a></li>';
        } ?>
        </ul>
        <?php } ?>
      </div>
      <div class="column last">
        <h3><? echo $text_contacty; ?></h3>
        <ul>
          <li><a href="/index.php?route=information/sitemap"><? echo $text_sitemap; ?></a></li>
          <li><a href="/search"><? echo $text_poisk; ?></a></li>
          <li><a href="<?php echo $informations[13]['href']; ?>"><?php echo $informations[13]['title']; ?></a></li>
        </ul>
      </div>
  </div>
  	<div id="social">
	   <a target="_blank" href=""><i class="fa vk"></i></a>
       <a target="_blank" href=""><i class="fa ok"></i></a>
	   <a target="_blank" href=""><i class="fa fb"></i></a>
	   <a target="_blank" href=""><i class="fa tw"></i></a>
       <a target="_blank" href=""><i class="fa gp"></i></a>
	   <a target="_blank" href=""><i class="fa mr"></i></a>
	   
	</div>
<!--</div>-->
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
</div>
</body></html>