<?php

class ArbitrController extends Zend_Controller_Action {

    
    
    public function init() 
            {
        
        if (!Model_Services::getUsers()->isAuth())
            $this->redirect('/auth/login');
    }
    
    public function listAction()
    {
        $select = Model_Services::getArbitrs()->select();        
        $this->view->arbiters = Model_Services::getArbitrs()->fetchAll($select);
        
        
        $this->view->dbeg = $this->_getParam('fdat_beg');
        $this->view->dend = $this->_getParam('fdat_end');
    }

    public function newAction() {
        $this->forward('edit');
    }

    public function editAction() {
        if ($this->_request->isXmlHttpRequest())
            $this->_helper->layout->disableLayout();

        $id = (int) $this->_getParam('id');
        if ($id) {
            $arbitr = Model_Services::getArbitrs()->find($id)->current();
        } else {
            $arbitr = Model_Services::getArbitrs()->createRow();
        }
        

        $regionid = (int) $this->_getParam('regionid');
        if ($regionid) {
            $region = Model_Services::getRegions()->find($region)->current();
        } else {
            $region = Model_Services::getRegions()->createRow();
        }
        
        
        $this->view->arbitr=$arbitr;
        $this->view->region=$region;
        $select = Model_Services::getRegions()->select();
        $this->view->regions = Model_Services::getRegions()->fetchAll($select);
    }

    public function saveAction() {
        $response = array('error' => 0, 'message => null');
        try {
            $id = (int) $this->_getParam('id');
            if ($id) {
                $arbitr = Model_Services::getArbitrs()->find($id)->current();
            } else {
                $arbitr = Model_Services::getArbitrs()->createRow();
            }

            $arbitr->setFromArray($this->_getAllParams())->save();
            $response['id']=$arbitr->id;
            $response['titl']=$arbitr->fio." [".$arbitr->nsvid."]";
        } catch (Exception $e) {
            $response['error'] = 1;
            $response['message'] = $e->getMessage();
        }
        $this->_helper->json($response);
    }

}
