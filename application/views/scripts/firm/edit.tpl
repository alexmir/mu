<form name="Firm" id="Firm" action="/firm/save" method="post">
    <table height="100%" width="100%" cellspacing="0" cellpadding="5" border="0"><col width="230"><col>
        <tr height="10"><td>Назва підприємства</td><td> <input type="text" style="width:330px;" name="firmnm" value="<?php echo $this->firm->firmnm; ?>"/></td></tr>
        <tr height="10"><td>Регіон</td><td> <select style="width:300px;" name="region" id="region" value="<?php echo $this->firm->region; ?>" class="chzn-select">
                    <?php foreach ($this->regions as $region): ?>
                        <option value="<?php echo $region->regionid; ?>"><?php echo $region->regnm; ?></option>
                    <?php endforeach; ?>   
                </select>
                <input type="button" title="Додати регіон" value="+" id="AddRegion"/>
            </td></tr>    

        <tr height="10"><td>ЄДРПОУ</td><td> <input type="text" style="width:330px;" name="edrpou" value="<?php echo $this->firm->edrpou; ?>"/></td></tr>
        <tr height="10"><td>Юридична адреса</td><td> <textarea style="width:330px;" name="uradr" rows="3"><?php echo $this->firm->uradr; ?></textarea></td></tr>
        <tr height="10"><td>Контакти</td><td> <textarea style="width:330px;" name="kont" rows="3"><?php echo $this->firm->kont; ?></textarea></td></tr>



        <tr><td colspan="2"><span class="status" id="status" style="display:none;"></span></td></tr>
        <tr height="40" style="vertical-align:top;"><td><input type="reset" value="Скасувати" style="width:150px;float:left;"/></td>
            <td><input type="submit" value="Зберегти" style="width:150px;float:right;"/></td></tr></table>
    <input type="hidden" name="firmid" value="<?php echo $this->firm->firmid; ?>"/><br/>

</form>

<script type="text/javascript">
    $("#Firm").submit(function(e) {
        e.preventDefault();
        var $frm = $(this);
        $.post($frm.attr("action"), $frm.serialize(), function(responce) {
            if (responce.error == 0) {
                $frm.find("input[name=firmid]").val(responce.firmid);
                if (document.getElementById("fid")) {
                addOption("fid", responce.titl, responce.firmid, true);
                sorted("fid",responce.firmid);
                $("#fid").trigger("liszt:updated");
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


    sorted("region", "<?php echo $this->firm->region; ?>");
    $(".chzn-select").chosen();
</script>