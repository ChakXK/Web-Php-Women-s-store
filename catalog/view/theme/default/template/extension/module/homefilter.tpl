<div class="panel panel-default">
  <div class="panel-heading"><?php echo $heading_title; ?><i class="fa fa-caret-down" aria-hidden="true"></i></div>
  <div class="list-group filter">
    <?php foreach ($filter_groups as $filter_group) { ?>


 
    <h6><a class="list-group-item"><?php echo $filter_group['name']; ?></i></a></h6>
        <div class="list-group-item">
        <?php  if($filter_group['filter_group_id']==22){?>
     
      <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
        <?php foreach ($filter_group['filter'] as $filter) { ?>

        <div class="checkbox">
          <label style="">

            <!--!-->


            <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
            <input  type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" class="custom" />
            <span style="display: inline-block; border: 1px solid; background-color:<?php echo $filter['ex']; ?>" class="custom-checkbox"></span>
            <?php echo $filter['name']; ?>
            <?php } else { ?>
    
            <input  type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" class="custom" />
            

            <span style="display: inline-block; border: 1px solid; background-color:<?php echo $filter['ex']; ?>" class="custom-checkbox"></span>

            <?php echo $filter['name']; ?>
            <?php } ?>

            
          </label>
        </div>
        <?php } ?>
      </div>
    </div>
 
    <?php }
    else{ ?>

     <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
        <?php foreach ($filter_group['filter'] as $filter) { ?>

        <div class="checkbox">
          <label>
            <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
            <input  type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" class="custom" />
            <span class="custom-checkbox"></span>
            <?php echo $filter['name']; ?>
            <?php } else { ?>
            <input  type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" class="custom" />
            <span class="custom-checkbox"></span>
            <?php echo $filter['name']; ?>
            <?php } ?>
          </label>
        </div>
        <?php } ?>
      </div>


    
     </div>


    <?php } ?>
    <?php } ?>
  </div>
  <div class="panel-footer text-right">
    <button type="button" id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	filter = [];

	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});

	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script>

<script type="text/javascript">

  jQuery('.panel-default>.panel-heading').click(function(){
    jQuery('div.list-group.filter').toggle();
  })

</script>


<!--Custom Checkbox Script!

<script type="text/javascript">
   jQuery('input.custom[type=checkbox]').change(function(){
    jQuery('input.custom[type=checkbox]:checked' +'span.custom-checkbox' ).hide();
  })
</script>

-->