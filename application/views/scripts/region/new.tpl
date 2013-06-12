<form name="Region" id="Region" action="/region/save" method="post">
    <table height="100%" width="100%" cellspacing="0" cellpadding="5" border="0"><col width="230"><col>
        <tr height="10"><td>Назва регіону</td><td> <input type="text" style="width:330px;" name="regnm" value="<?php echo $this->region->regnm; ?>"/></td></tr>


        <tr><td colspan="2"><span class="status" id="status" style="display:none;"></span></td></tr>
        <tr height="40" style="vertical-align:top;"><td><input type="reset" value="Скасувати" style="width:150px;float:left;"/></td>
            <td><input type="submit" value="Зберегти" style="width:150px;float:right;"/></td></tr></table>


    <input type="hidden" name="regionid" value="<?php echo $this->region->regionid; ?>"/><br/>

</form>

<script type="text/javascript">
    $("#Region").submit(function(e) {
        e.preventDefault();
        var $frm = $(this);
        $.post($frm.attr("action"), $frm.serialize(), function(responce) {
            if (responce.error == 0) {
                $frm.find("input[name=regionid]").val(responce.regionid);

                addOption("region", responce.regnm, responce.regionid, true);
                sorted("region",responce.regionid);
                $("#region").trigger("liszt:updated");

            }
            $frm.find(".status").text(responce.message);
            if (document.getElementById("status").innerHTML != "")
                document.getElementById("status").style.display = "";
            else
                document.getElementById("status").style.display = "none";

        }, "json");



    });



</script>