<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        if (!Model_Services::getUsers()->isAuth()) $this->redirect ('/auth/login');
    }

    public function indexAction()
    {
        $this->_redirect('/arbitr/list');
    }


}

