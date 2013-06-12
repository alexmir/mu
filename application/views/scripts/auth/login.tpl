<tr class="main-center"><td class="main-center" colspan="2">
<form name="frm" action="/auth/login" method="post">

    <div class="login-window">

        <div class="login-title" style="display: block;">Авторизація</div>

        <div class="body" style="padding: 20px;">       
            Логін:&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<input type="text" name="login" style="width:230px;"/><br/><br/>
            Пароль:&#xA0;&#xA0;&#xA0;&#xA0;<input type="password" name="psw" style="width:230px;"/><br/>
<div style="height:10px;">&#xA0;</div>
<?php if(!empty($this->messages)): ?>
            <div class="status">
        <?php echo implode('; ', $this->messages); ?>
            </div>
<?php else: ?>
<div style="height:22px;font:10pt Arial;padding:2px;">&#xA0;</div>
<?php endif; ?>

<div style="height:10px;">&#xA0;</div>
<center>
            <input type="submit" name="tin" value="Ok" style="width:120px;"/>
</center>
        </div>   
    </div>
</form>
        
    </td</tr>