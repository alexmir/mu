<form name="Sale" id="Sale" action="/sale/save" method="post">
    <table height="100%" width="100%" cellspacing="0" cellpadding="5" border="0"><col width="230"><col>
        <tr height="10"><td>Назва організатора торгів</td><td> <input type="text" style="width:330px;" name="birnm" value="<?php echo $this->sale->birnm; ?>"/></td></tr>
        <tr height="10"><td>Регіон</td><td> <select style="width:300px;" name="region" id="region" value="<?php echo $this->sale->region; ?>" class="chzn-select">
                    <?php foreach ($this->regions as $region): ?>
                        <option value="<?php echo $region->regionid; ?>"><?php echo $region->regnm; ?></option>
                    <?php endforeach; ?>   
                </select>
                <input type="button" title="Додати регіон" value="+" id="AddRegion"/>
            </td></tr>    

        <tr height="10"><td>ЄДРПОУ</td><td> <input type="text" style="width:330px;" name="birinn" value="<?php echo $this->sale->birinn; ?>"/></td></tr>
        <tr height="10"><td>Юридична адреса</td><td> <textarea style="width:330px;" name="uradr" rows="3"><?php echo $this->sale->uradr; ?></textarea></td></tr>
        <tr height="10"><td>Контакти</td><td> <textarea style="width:330px;" name="bkont" rows="3"><?php echo $this->sale->bkont; ?></textarea></td></tr>
        <tr height="10"><td>Сайт</td><td> <input type="text" style="width:330px;" name="birurl" value="<?php echo $this->sale->birurl; ?>"/></td></tr>
        


        <tr><td colspan="2"><span class="status" id="status" style="display:none;"></span></td></tr>
        <tr height="40" style="vertical-align:top;"><td><input type="reset" value="Скасувати" style="width:150px;float:left;"/></td>
            <td><input type="submit" value="Зберегти" style="width:150px;float:right;"/></td></tr></table>
    <input type="hidden" name="birid" value="<?php echo $this->sale->birid; ?>"/><br/>

</form>

<script type="text/javascript">
    $("#Sale").submit(function(e) {
        e.preventDefault();
        var $frm = $(this);
        $.post($frm.attr("action"), $frm.serialize(), function(responce) {
            if (responce.error == 0) {
                $frm.find("input[name=birid]").val(responce.birid);
                
           if (document.getElementById("bid")) {
                addOption("bid", responce.titl, responce.birid, true);
                sorted("bid",responce.birid);
                $("#bid").trigger("liszt:updated");
           }                  
            }
            $frm.find(".status").text(responce.message);
            if (document.getElementById("status").innerHTML != "")
                document.getElementById("status").style.display = "";
            else
                document.getElementById("status").style.display = "none";



        }, "json");

    });

    $('#AddRegion').click(function() {
        var m = new modal({height: 170, width: 540, style: {padding: 20}, title: this.title});
        $.post('/region/new', function(response) {
            m.setBody(response);
        });
    });


    sorted("region", "<?php echo $this->sale->region; ?>");
    $(".chzn-select").chosen();
</script>