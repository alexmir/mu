<?php

class AuthController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function loginAction() {
        if ($this->_getParam('tin')) {
            $login = $this->_getParam('login');
            $psw = $this->_getParam('psw');

            if ($login == '' || $psw == '') {

                $this->_helper->flashMessenger('Логін або пароль не заповнений!');
                $this->redirect('/auth/login');
            } else {

                $adapter = new Zend_Auth_Adapter_DbTable(
                        Zend_Db_Table_Abstract::getDefaultAdapter(), 'users', 'login', 'psw');

                $adapter
                        ->setIdentity($login)
                        ->setCredential(Model_Services::getUsers()->getPswHash($psw));


                $result = Zend_Auth::getInstance()->authenticate($adapter);

                if (!$result->isValid()) {
                    $this->_helper->flashMessenger('Логін або пароль не вірний!');
                    $this->redirect('/auth/login');
                }
                $userdata = $adapter->getResultRowObject(null, 'psw');
                Zend_Auth::getInstance()->getStorage()->write((array) $userdata);
                
                $this->redirect('/sale/list');
            }
        }

        $this->view->messages = $this->_helper->flashMessenger->getMessages();
    }

    public function logoutAction() {
        Zend_Auth::getInstance()->clearIdentity();
        $this->redirect('/auth/login');
    }

}
