<?php

class FirmController extends Zend_Controller_Action {

    
    
    public function init() 
            {
        
        if (!Model_Services::getUsers()->isAuth())
            $this->redirect('/auth/login');
    }
    
    
    public function listAction()
    {
        $select = Model_Services::getFirms()->select();        
        $this->view->firms = Model_Services::getFirms()->fetchAll($select);
    }
    
    public function newAction() {
        $this->forward('edit');
    }

    public function editAction() {
        if ($this->_request->isXmlHttpRequest())
            $this->_helper->layout->disableLayout();

        $firmid = (int) $this->_getParam('firmid');
        if ($firmid) {
            $firm = Model_Services::getFirms()->find($firmid)->current();
        } else {
            $firm = Model_Services::getFirms()->createRow();
        }
        

        $regionid = (int) $this->_getParam('regionid');
        if ($regionid) {
            $region = Model_Services::getRegions()->find($region)->current();
        } else {
            $region = Model_Services::getRegions()->createRow();
        }
        
        
        $this->view->firm=$firm;
        $this->view->region=$region;
        $select = Model_Services::getRegions()->select();
        $this->view->regions = Model_Services::getRegions()->fetchAll($select);
    }

    public function saveAction() {
        $response = array('error' => 0, 'message => null');
        try {
            $firmid = (int) $this->_getParam('firmid');
            if ($firmid) {
                $firm = Model_Services::getFirms()->find($firmid)->current();
            } else {
                $firm = Model_Services::getFirms()->createRow();
            }

            $firm->setFromArray($this->_getAllParams())->save();
            $response['firmid']=$firm->firmid;
            $response['titl']=$firm->firmnm." [".$firm->edrpou."]";
        } catch (Exception $e) {
            $response['error'] = 1;
            $response['message'] = $e->getMessage();
        }
        $this->_helper->json($response);
    }

}
