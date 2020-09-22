<div class="list-group scroll home" >
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item"><span class="custom-checkbox checked scroll"></span><?php echo $child['name']; ?><?php echo $child['top']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item"><span class="custom-checkbox scroll"></span><?php echo $child['name']; ?><?php echo $child['top']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else {
  if($category['top']==1){?>
<a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name'];?></a>


  <?php }} ?>
  <?php } ?>
</div>
