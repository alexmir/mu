<?php

class ZayavkaController extends Zend_Controller_Action {

    
    
    public function init() 
            {
        
        if (!Model_Services::getUsers()->isAuth())
            $this->redirect('/auth/login');
    }
    
    
    public function listAction()
    {
        $select = Model_Services::getZayavkas()->select();        
        $this->view->zayavkas = Model_Services::getZayavkas()->fetchAll($select);
    }
    
    
    public function newAction() {
        $this->forward('edit');
    }

    public function editAction() {
        if ($this->_request->isXmlHttpRequest())
            $this->_helper->layout->disableLayout();

        $zid = (int) $this->_getParam('zid');
        if ($zid) {
            $zayavka = Model_Services::getZayavkas()->find($zid)->current();
        } else {
            $zayavka = Model_Services::getZayavkas()->createRow();
        }
        

    
        
        $this->view->zayavka=$zayavka;
        
        $select1 = Model_Services::getArbitrs()->select();
        $this->view->arbitrs = Model_Services::getArbitrs()->fetchAll($select1);
        
        $select2 = Model_Services::getFirms()->select();
        $this->view->firms = Model_Services::getFirms()->fetchAll($select2);
        
        $select3 = Model_Services::getSales()->select();
        $this->view->sales = Model_Services::getSales()->fetchAll($select3);
        $fid = (int) $this->_getParam('fid');
        if ($fid) {
          $select4 = Model_Services::getLots()->select()->where("firmid=".$fid);
          $this->view->lots = Model_Services::getLots()->fetchAll($select4);
        }
    }

    public function saveAction() {
        $response = array('error' => 0, 'message => null');
        try {
            $zid = (int) $this->_getParam('zid');
            if ($zid) {
                $zayavka = Model_Services::getZayavkas()->find($zid)->current();
            } else {
                $zayavka = Model_Services::getZayavkas()->createRow();
            }

            $zayavka->setFromArray($this->_getAllParams())->save();
            $response['zid']=$zayavka->zid;
        } catch (Exception $e) {
            $response['error'] = 1;
            $response['message'] = $e->getMessage();
        }
        $this->_helper->json($response);
    }

    
        public function lotsAction() {
        if ($this->_request->isXmlHttpRequest())
            $this->_helper->layout->disableLayout();
        $fid = (int) $this->_getParam('fid');
        if ($fid) {
          $select4 = Model_Services::getLots()->select()->where("firmid=".$fid);
          $this->view->lots = Model_Services::getLots()->fetchAll($select4);
        }
    }
    
}
