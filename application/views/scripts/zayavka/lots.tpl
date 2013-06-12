<script type="text/javascript">
    


     var oListbox = document.getElementById("lots");
addOption("lots", "текст", "значение", true);

<?php if($this->sellots):?>   
<?php foreach ($this->sellots as $lot): ?>
    for (var i = oListbox.length - 1; i>=0; i--) {
    if (oListbox.options[i].value=="<?php echo $lot->lid;?>") oListbox.options[i].selected=true;   }
<?php endforeach; ?>
  <?php endif;?>
      
   alert(1);   
    $("#lots").chosen({allow_single_deselect: true});
</script>