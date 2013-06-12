

<tr class="main-center"><td class="main-center" colspan="2">
<table width="100%" cellspacing="0" cellpadding="0" border="0" style="border-collapse: collapse;">
    
    <tr class="tbl_head">
        <td class="tbl_head">№</td>
        <td class="tbl_head">ПІБ арбітражного куруючого</td>
        <td class="tbl_head">ІПН</td>
        <td class="tbl_head">Регіон</td>
        <td class="tbl_head">СРО</td>
        <td class="tbl_head">Номер свідоцтва</td>
        <td class="tbl_head">Телефон</td>
        <td class="tbl_head">Заяв</td>
        <td class="tbl_head">Підприємств</td>
        <td class="tbl_head">Лотів</td>
        <td class="tbl_head">Скарг</td>
    </tr>
    <?php $i=1; ?>
    <?php foreach ($this->arbiters as $arbiter): ?>
        <tr class="tbl_row">
            <td class="tbl_cell">   <?php echo $i++; ?>   </td>
            <td class="tbl_cell" 
                  onclick='var m = new modal({height: 440, width: 620, style: {padding: 20}, title: "Редагування арбітражного керуючого"}); $.post("/arbitr/edit?id=<?php echo $arbiter->id; ?>", function(response) { m.setBody(response);});'>
                     <?php echo $arbiter->fio; ?>   </td>
            <td class="tbl_cell">   <?php echo $arbiter->inn; ?>   </td>
            <td class="tbl_cell">   <?php echo $arbiter->region; ?>   </td>
            <td class="tbl_cell">   <?php echo $arbiter->sro; ?>   </td>
            <td class="tbl_cell">   <?php echo $arbiter->nsvid; ?>   </td>
            <td class="tbl_cell">   <?php echo $arbiter->tel; ?>   </td>
            <td class="tbl_cell">   &#xA0;   </td>
            <td class="tbl_cell">   &#xA0;   </td>
            <td class="tbl_cell">   &#xA0;   </td>
            <td class="tbl_cell">   &#xA0;   </td>
        </tr>
    <?php endforeach; ?>
</table>

    </td></tr>