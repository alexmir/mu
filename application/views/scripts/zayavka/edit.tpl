<form name="Zayavka" id="Zayavka" action="/zayavka/save" method="post">
    <table height="100%" width="100%" cellspacing="0" cellpadding="5" border="0"><col width="230"><col>
        <tr height="10"><td colspan="2">Номер заявки&#xA0;&#xA0;<input type="text" style="width:150px;" name="zno" value="<?php echo $this->zayavka->zno; ?>"/>
            &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
                                        Дата заявки&#xA0;&#xA0;<input type="text" style="width:150px;" name="zdat" id="zdat" value="<?php echo $this->zayavka->zdat; ?>"/>
            </td></tr>

   
        
        <tr height="10"><td colspan="2">Тип заявви&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<select style="width:150px;" name="tp" id="tp" value="<?php echo $this->zayavka->tp; ?>">                   
                        <option value="0">перша</option>
                        <option value="1">повторна</option>
                        <option value="2">вдруге повторна</option>
                </select>
            &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
                                        Тип торгів&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<select style="width:150px;" name="torg" id="torg" value="<?php echo $this->zayavka->torg; ?>">                   
                        <option value="0">без зниження</option>
                        <option value="1">із зниженням</option>
                </select>
            </td></tr>

   
        
        
            <tr height="10"><td>Арбітражний керуючий</td><td> <select style="width:300px;" name="aid" id="aid" value="<?php echo $this->zayavka->aid; ?>" class="chzn-select">
                    <option value=""></option>
                    <?php foreach ($this->arbitrs as $arbitr): ?>
                        <option value="<?php echo $arbitr->id; ?>"><?php echo $arbitr->fio; ?> [<?php echo $arbitr->nsvid; ?>]</option>
                    <?php endforeach; ?>   
                </select>
                <input type="button" title="Додати арбітражного керуючого" value="+" id="AddArbitr"/>
            </td></tr>    
                
                
                
        
            <tr height="10"><td>Підприємство банкрут</td><td> <select style="width:300px;" name="fid" id="fid" value="<?php echo $this->zayavka->fid; ?>" class="chzn-select">
                     <option value=""></option>
                   <?php foreach ($this->firms as $firm): ?>
                        <option value="<?php echo $firm->firmid; ?>"><?php echo $firm->firmnm; ?> [<?php echo $firm->edrpou; ?>]</option>
                    <?php endforeach; ?>   
                </select>
                <input type="button" title="Додати підприємство" value="+" id="AddFirm"/>
            </td></tr>    
                
                
                
        
            <tr height="10"><td>Організатор тогргів</td><td> <select style="width:300px;" name="bid" id="bid" value="<?php echo $this->zayavka->bid; ?>" class="chzn-select">
                     <option value=""></option>
                   <?php foreach ($this->sales as $sale): ?>
                        <option value="<?php echo $sale->birid; ?>"><?php echo $sale->birnm; ?> [<?php echo $sale->birinn; ?>]</option>
                    <?php endforeach; ?>   
                </select>
                <input type="button" title="Додати організатора торгів" value="+" id="AddSale"/>
            </td></tr>    
                
                
        <tr height="10"><td>Дата торгів</td><td> <input type="text" style="width:330px;" name="saledat" value="<?php echo $this->zayavka->saledat; ?>"/></td></tr>
        <tr height="10"><td>Характеристика</td><td><input type="text" style="width:330px;" name="saleurl" value="<?php echo $this->zayavka->saleurl; ?>"/></td></tr>
                


            <tr height="10"><td>Лоти</td><td> <select style="width:300px;" multiple name="lots" id="lots" value="<?php echo $this->zayavka->lots; ?>" class="chzn-select">
                     <option value=""></option>
                   <?php foreach ($this->lots as $lot): ?>
                        <option value="<?php echo $lot->lid; ?>"><?php echo $lot->snm; ?> [<?php echo $lot->ltyp; ?>]</option>
                    <?php endforeach; ?>   
                </select>
                <input type="button" title="Додати лот" value="+" id="AddLots"/>
            </td></tr>   
            
            
        
        <tr><td colspan="2"><span class="status" id="status" style="display:none;"></span></td></tr>
        <tr height="40" style="vertical-align:top;"><td><input type="reset" value="Скасувати" style="width:150px;float:left;"/></td>
            <td><input type="submit" value="Зберегти" style="width:150px;float:right;"/>
            
            
             <?php echo date("d.m.Y H:i:s"); ?><br/>
   
             
            </td></tr></table>
            
    <input type="hidden" name="zid" value="<?php echo $this->zayavka->zid; ?>"/>
    <input type="hidden" name="zstat" value="Нова"/>
    <input type="hidden" name="stdat" value="<?php echo date("d.m.Y H:i:s"); ?>"/>
    <input type="hidden" name="ztp" value="Заявка"/>    
    
    

</form>

<script type="text/javascript">
    
    $("#fid").chosen().change(function(e) {
        e.preventDefault();
        var $frm = $(this);
        $.post("/zayavka/lots", $frm.serialize(), function(responce) {
            if (responce.error == 0) {             
            }
            $frm.find(".status").text(responce.message);
            if (document.getElementById("status").innerHTML != "")
                document.getElementById("status").style.display = "";
            else
                document.getElementById("status").style.display = "none";
        }, "text");       
    }
    );
    
    
    $("#Zayavka").submit(function(e) {
        e.preventDefault();
        var $frm = $(this);
        $.post($frm.attr("action"), $frm.serialize(), function(responce) {
            if (responce.error == 0) {
                $frm.find("input[name=zid]").val(responce.zid);
            }
            $frm.find(".status").text(responce.message);
            if (document.getElementById("status").innerHTML != "")
                document.getElementById("status").style.display = "";
            else
                document.getElementById("status").style.display = "none";



        }, "json");

    });

    $('#AddArbitr').click(function() {
        var m = new modal({height: 440, width: 620, style: {padding: 20}, title: "Новий арбітражний керуючий"});
        $.post('/arbitr/new', function(response) {
            m.setBody(response);
        });
    });
    

    $('#AddFirm').click(function() {
        var m = new modal({height: 440, width: 620, style: {padding: 20}, title: "Нове підприємство"});
        $.post('/firm/new', function(response) {
            m.setBody(response);
        });
    });
        

    $('#AddSale').click(function() {
        var m = new modal({height: 440, width: 620, style: {padding: 20}, title: "Новий організатор тогрів"});
        $.post('/sale/new', function(response) {
            m.setBody(response);
        });
    });
    
    
 


$( "#zdat" ).datepicker();


    sorted("aid",  "<?php echo $this->zayavka->aid; ?>");
    sorted("fid",  "<?php echo $this->zayavka->fid; ?>");
    sorted("bid",  "<?php echo $this->zayavka->bid; ?>");
    sorted("lots", "");
    
 <?php if($this->lots):?>
     var oListbox = document.getElementById("lots");
   
<?php foreach ($this->lots as $lot): ?>
    for (var i = oListbox.length - 1; i>=0; i--) {
    if (oListbox.options[i].value=="<?php echo $lot->lid;?>") oListbox.options[i].selected=true;   }
<?php endforeach; ?>
  <?php endif;?>
      
      
    $(".chzn-select").chosen({allow_single_deselect: true});
</script>