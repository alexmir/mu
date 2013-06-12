<form name="Arbitr" id="Arbitr" action="/arbitr/save" method="post">
    <table height="100%" width="100%" cellspacing="0" cellpadding="5" border="0"><col width="230"><col>
    <tr height="10"><td>ПІБ арбітражного керуючого</td><td> <input type="text" style="width:330px;" name="fio" value="<?php echo $this->arbitr->fio;?>"/></td></tr>
    <tr height="10"><td>ІПН арбітражного керуючого</td><td> <input type="text" style="width:330px;" name="inn" value="<?php echo $this->arbitr->inn;?>"/></td></tr>
    
    <tr height="10"><td>Регіон</td><td> <select style="width:300px;" name="region" id="region" value="<?php echo $this->arbitr->region;?>" class="chzn-select">
        
        <?php foreach($this->regions as $region): ?>
    <option value="<?php echo $region->regionid; ?>"><?php echo $region->regnm; ?></option>
<?php endforeach; ?>
    
    
            </select>
            
            
            <input type="button" title="Додати регіон" value="+" id="AddRegion"/>
        </td></tr>    
    
    <tr height="10"><td>Номер свідоцтва</td><td> <input type="text" style="width:330px;" name="nsvid" value="<?php echo $this->arbitr->nsvid;?>"/></td></tr>
    <tr height="10"><td>СРО</td><td> <input type="text" style="width:330px;" name="sro" value="<?php echo $this->arbitr->sro;?>"/></td></tr>
    <tr height="10"><td>Мобільний телефон</td><td> <input type="text" style="width:330px;" name="tel" value="<?php echo $this->arbitr->tel;?>"/></td></tr>

     
    
    <tr><td colspan="2"><span class="status" id="status" style="display:none;"></span></td></tr>
    <tr height="40" style="vertical-align:top;"><td><input type="reset" value="Скасувати" style="width:150px;float:left;"/></td>
        <td><input type="submit" value="Зберегти" style="width:150px;float:right;"/></td></tr></table>
    

    <input type="hidden" name="id" value="<?php echo $this->arbitr->id;?>"/><br/>
    
</form>

<script type="text/javascript">
  $("#Arbitr").submit(function (e){      
      e.preventDefault();
      var $frm=$(this);
      $.post($frm.attr("action"),$frm.serialize(),function(responce){
        if (responce.error==0) {$frm.find("input[name=id]").val(responce.id);
           if (document.getElementById("aid")) {
                addOption("aid", responce.titl, responce.id, true);
                sorted("aid",responce.id);
                $("#aid").trigger("liszt:updated");
           }    
        }
        $frm.find(".status").text(responce.message);
  if (document.getElementById("status").innerHTML!="") document.getElementById("status").style.display=""; else  document.getElementById("status").style.display="none";
  
  
 
    },"json");
      
  });  
  
  $('#AddRegion').click(function() {
 var m = new modal({height:170,width:540,style:{padding:20},title:this.title});
 $.post('/region/new', function(response) {
          m.setBody(response);
     });
});
  
  
  sorted("region","<?php echo $this->arbitr->region; ?>");
$(".chzn-select").chosen();  
</script>