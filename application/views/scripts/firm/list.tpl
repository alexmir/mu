<tr class="main-center"><td class="main-center" colspan="2">
        
<table width="100%" cellspacing="0" cellpadding="0" border="0" style="border-collapse: collapse;">
    
    <tr class="tbl_head">
        <td class="tbl_head">№</td>
        <td class="tbl_head">Підприємство банкрот</td>
        <td class="tbl_head">ЄДРПОУ</td>
        <td class="tbl_head">Регіон</td>
        <td class="tbl_head">Юридична адреса</td>
        <td class="tbl_head">Контакти</td>
        <td class="tbl_head">Заяв</td>
        <td class="tbl_head">Лотів</td>
        <td class="tbl_head">Скарг</td>
    </tr>
    <?php $i=1; ?>
    <?php foreach ($this->firms as $firm): ?>
        <tr class="tbl_row">
            <td class="tbl_cell">   <?php echo $i++; ?>   </td>
            <td class="tbl_cell" 
                  onclick='var m = new modal({height: 440, width: 620, style: {padding: 20}, title: "Редагування підприємства"}); $.post("/firm/edit?firmid=<?php echo $firm->firmid; ?>", function(response) { m.setBody(response);});'>
                     <?php echo $firm->firmnm; ?>   </td>
            <td class="tbl_cell">   <?php echo $firm->edrpou; ?>   </td>
            <td class="tbl_cell">   <?php echo $firm->region; ?>   </td>
            <td class="tbl_cell">   <?php echo $firm->uradr; ?>   </td>
            <td class="tbl_cell">   <?php echo $firm->kont; ?>   </td>
            <td class="tbl_cell">   &#xA0;   </td>
            <td class="tbl_cell">   &#xA0;   </td>
            <td class="tbl_cell">   &#xA0;   </td>
        </tr>
    <?php endforeach; ?>
</table>

    </td></tr>