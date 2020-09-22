<div class="list-group scroll" >
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <h6><a href="<?php echo $category['href']; ?>" class="list-group-item scroll"><?php echo $category['name']; ?></a></h6>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item"><span class="custom-checkbox checked scroll"></span><?php echo $child['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item"><span class="custom-checkbox scroll"></span><?php echo $child['name']; ?></a>
  <?php } ?>

  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  
<!--<a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a> Other-->

  <?php } ?>
  <?php } ?>
</div>
