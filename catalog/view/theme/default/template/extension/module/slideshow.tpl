<div class="div"></div>
<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <div class="slide"><span class="open"><?php echo $text_look;?></span><span class="cyrcle"><?php echo $banner['title']; ?></span><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a></div>
    <?php } else { ?>
    <div class="slide"><span class="open"><?php echo $text_soon;?></span><span class="cyrcle"><?php echo $banner['title']; ?></span><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></div>
    <?php }?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
--></script>