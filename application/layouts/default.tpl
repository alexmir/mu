<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" height="100%">

<head>
    <?php echo $this->headTitle('Банкрутства'); ?>
    <?php echo $this->headMeta(); ?>
    <?php echo $this->headLink(); ?>
    <?php echo $this->headScript(); ?>
    <?php echo $this->headStyle(); ?>
</head>
<body style="height:100%;padding:0px;margin:0px;" height="100%">
    <table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0"><col width="250"><col>
        <tr class="main-top"><td class="main-top" colspan="2">&#xA0;&#xA0;&#xA0;"Банкрутства"&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;          
<?php if(Model_Services::getUsers()->isAuth()):?>
                <span <?php if ($this->url()=="/zayavka/list") echo 'class="activmenu_s"'; else echo 'class="activmenu_d"'; ?>>&#xA0;&#xA0;<a href="/zayavka/list" class="logout">&#xA0;&#xA0;Заявки&#xA0;&#xA0;</a>&#xA0;&#xA0;      </span>
                <span <?php if ($this->url()=="/skarga/list") echo 'class="activmenu_s"'; else echo 'class="activmenu_d"'; ?>>&#xA0;&#xA0;<a href="/skarga/list" class="logout">&#xA0;&#xA0;Скарги&#xA0;&#xA0;</a>&#xA0;&#xA0;       </span>
                <span <?php if ($this->url()=="/firm/list") echo 'class="activmenu_s"'; else echo 'class="activmenu_d"'; ?>> &#xA0;&#xA0;<a href="/firm/list" class="logout">&#xA0;&#xA0;Підприємства&#xA0;&#xA0;</a>&#xA0;&#xA0;   </span>
                <span <?php if ($this->url()=="/arbitr/list") echo 'class="activmenu_s"'; else echo 'class="activmenu_d"'; ?>>&#xA0;&#xA0;<a href="/arbitr/list" class="logout"'>&#xA0;&#xA0;Арбітражні керуючі&#xA0;&#xA0;</a>&#xA0;&#xA0;      </span>
                <span <?php if ($this->url()=="/sale/list") echo 'class="activmenu_s"'; else echo 'class="activmenu_d"'; ?>> &#xA0;&#xA0;<a href="/sale/list" class="logout">&#xA0;&#xA0;Організатори торгів&#xA0;&#xA0;</a>&#xA0;&#xA0;       </span>
            <div style="position:absolute;top:0px;right:0px;background: #aa0000;padding:5px;"><a href="/auth/logout" class="logout">&#xA0;&#xA0;&#xA0;&#xA0;Вийти&#xA0;&#xA0;&#xA0;&#xA0;</a></div>
     </td></tr>
    <tr class="main-filter"><td class="main-filter" colspan="2">
            &#xA0;&#xA0;<a href="/arbitr/new" class="asbtn" onclick="modal.open(this, {height: 440, width: 620, style: {padding: 20}});
                   return false;" title="Новий арбітражний керуючий">&#xA0;&#xA0;Додати керуючого&#xA0;&#xA0;</a>&#xA0;&#xA0;
            &#xA0;&#xA0;<a href="/firm/new" class="asbtn" onclick="modal.open(this, {height: 440, width: 620, style: {padding: 20}});
                   return false;" title="Нове підприємство">&#xA0;&#xA0;Додати підприємство&#xA0;&#xA0;</a>&#xA0;&#xA0;
            &#xA0;&#xA0;<a href="/sale/new" class="asbtn" onclick="modal.open(this, {height: 440, width: 620, style: {padding: 20}});
                   return false;" title="Новий організатор торгів">&#xA0;&#xA0;Додати організатора&#xA0;&#xA0;</a>&#xA0;&#xA0;
            &#xA0;&#xA0;<a href="/zayavka/new" class="asbtn" onclick="modal.open(this, {height: 440, width: 620, style: {padding: 20}});
                   return false;" title="Нова заявка">&#xA0;&#xA0;Додати заявку&#xA0;&#xA0;</a>&#xA0;&#xA0;
  <?php endif;?>
</td></tr>
        
        
            <?php echo $this->layout()->content; ?>

        

        <tr class="main-bottom"><td class="main-bottom" colspan="2">
        <center>Всі права захищені &copy; 2013 AlexM</center>
            </td></tr></table>
</body>
</html>