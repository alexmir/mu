<?php

class Model_Users extends Zend_Db_Table_Abstract
{
    protected $_name = 'users';
    protected $_rowClass = 'Model_Users_User';
    private $_activeUser;
    
    
    public function getActiveUser()
    {
        if ($this->_activeUser) return $this->_activeUser;
        if (Zend_Auth::getInstance()->hasIdentity()) {
            $userdata = Zend_Auth::getInstance()->getIdentity();
            $this->_activeUser = Model_Services::getUsers()->find($userdata['id'])->current();
            if (!$this->_activeUser) $this->_activeUser=  Model_Services::getUsers ()->createRow();             
            
        } else
        {
           $this->_activeUser=  Model_Services::getUsers()->createRow(); 
            
        }
        return $this->_activeUser;
    }
    
    public function getPswHash($psw)
    {
        return md5('hgfdhhsdcer'.md5($psw));
    }
    
    public function isAuth()
    {
        return (bool) $this->getActiveUser()->id;
    }
}