<?php

class SaleController extends Zend_Controller_Action {

    
    
    public function init() 
            {
        
        if (!Model_Services::getUsers()->isAuth())
            $this->redirect('/auth/login');
    }
    
    public function listAction()
    {
        $select = Model_Services::getSales()->select();        
        $this->view->sales = Model_Services::getSales()->fetchAll($select);
        
        $select = Model_Services::getArbitrs()->select();        
        $this->view->arbiters = Model_Services::getArbitrs()->fetchAll($select);
        
        $this->view->dbeg = $this->_getParam("fdat_beg");
        $this->view->dend = $this->_getParam("fdat_end");
        $this->view->faid = $this->_getParam("faid");
    }    
    
    public function newAction() {
        $this->forward('edit');
    }

    public function editAction() {
        if ($this->_request->isXmlHttpRequest())
            $this->_helper->layout->disableLayout();

        $birid = (int) $this->_getParam('birid');
        if ($birid) {
            $sale = Model_Services::getSales()->find($birid)->current();
        } else {
            $sale = Model_Services::getSales()->createRow();
        }
        

        $regionid = (int) $this->_getParam('regionid');
        if ($regionid) {
            $region = Model_Services::getRegions()->find($region)->current();
        } else {
            $region = Model_Services::getRegions()->createRow();
        }
        
        
        $this->view->sale=$sale;
        $this->view->region=$region;
        $select = Model_Services::getRegions()->select();
        $this->view->regions = Model_Services::getRegions()->fetchAll($select);
    }

    public function saveAction() {
        $response = array('error' => 0, 'message => null');
        try {
            $birid = (int) $this->_getParam('birid');
            if ($birid) {
                $sale = Model_Services::getSales()->find($birid)->current();
            } else {
                $sale = Model_Services::getSales()->createRow();
            }

            $sale->setFromArray($this->_getAllParams())->save();
            $response['birid']=$sale->birid;
            $response['titl']=$sale->birnm." [".$sale->birinn."]";
        } catch (Exception $e) {
            $response['error'] = 1;
            $response['message'] = $e->getMessage();
        }
        $this->_helper->json($response);
    }

}
