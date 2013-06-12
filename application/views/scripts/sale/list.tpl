<tr class="main-filter"><td class="main-filter">      

        <form name="Filter" id="Filter" action="<?php echo $this->url(); ?>" method="post" style="display:inline">    
            <table height="100%" width="100%" cellspacing="0" cellpadding="5" border="0"><col width="230"><col>
                <tr height="10"><td>Період</td><td>з&#xA0;&#xA0;<input type="text" style="width:90px;" name="fdat_beg" id="fdat_beg" value="<?php echo $this->dbeg; ?>"/>
                        &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;до&#xA0;&#xA0;<input type="text" style="width:90px;" name="fdat_end" id="fdat_end" value="<?php echo $this->dend; ?>"/>
                    </td></tr>   

                <tr height="10"><td>Арбітражний керуючий</td><td> <select multiple style="width:550px;" name="faid[]" id="faid" class="chzn-select">
                            <option value=""></option>
                            <?php foreach ($this->arbiters as $arbitr): ?>
                                <option value="<?php echo $arbitr->id; ?>"><?php echo $arbitr->fio; ?> [<?php echo $arbitr->nsvid; ?>]</option>
                            <?php endforeach; ?>   
                        </select>                       
                    </td></tr>    


                <tr><td colspan="2"><input type="submit" value="Пошук"/></td></tr>  
            </table>
        </form>

        <script type="text/javascript">
            $("#fdat_beg").datepicker();
            $("#fdat_end").datepicker();
            sorted("faid", "");

<?php if($this->faid):?>
     var oListbox = document.getElementById("faid");
   
<?php foreach ($this->faid as $aid): ?>
    for (var i = oListbox.length - 1; i>=0; i--) {
    if (oListbox.options[i].value=="<?php echo $aid;?>") oListbox.options[i].selected=true;   }
<?php endforeach; ?>
  <?php endif;?>

            $(".chzn-select").chosen({allow_single_deselect: true});

        </script>            
   </td></tr>



<tr class="main-center"><td class="main-center" colspan="2">

        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="border-collapse: collapse;">

            <tr class="tbl_head">
                <td class="tbl_head">№</td>
                <td class="tbl_head">Організатор торгів</td>
                <td class="tbl_head">ЄДРПОУ</td>
                <td class="tbl_head">Регіон</td>
                <td class="tbl_head">Юридична адреса</td>
                <td class="tbl_head">Контакти</td>
                <td class="tbl_head">Місце проведення</td>
                <td class="tbl_head">Заяв</td>
                <td class="tbl_head">Лотів</td>
                <td class="tbl_head">Скарг</td>
            </tr>
            <?php $i = 1; ?>
            <?php foreach ($this->sales as $sale): ?>
                <tr class="tbl_row">
                    <td class="tbl_cell">   <?php echo $i++; ?>   </td>
                    <td class="tbl_cell" 
                        onclick='var m = new modal({height: 440, width: 620, style: {padding: 20}, title: "Редагування організатора торгів"});
                    $.post("/sale/edit?birid=<?php echo $sale->birid; ?>", function(response) {
                        m.setBody(response);
                    });'>
                        <?php echo $sale->birnm; ?>   </td>
                    <td class="tbl_cell">   <?php echo $sale->birinn; ?>   </td>
                    <td class="tbl_cell">   <?php echo $sale->region; ?>   </td>
                    <td class="tbl_cell">   <?php echo $sale->uradr; ?>   </td>
                    <td class="tbl_cell">   <?php echo $sale->bkont; ?>   </td>
                    <td class="tbl_cell">   <?php echo $sale->birurl; ?>   </td>
                    <td class="tbl_cell">   &#xA0;   </td>
                    <td class="tbl_cell">   &#xA0;   </td>
                    <td class="tbl_cell">   &#xA0;   </td>
                </tr>
            <?php endforeach; ?>
        </table>
    </td></tr>  