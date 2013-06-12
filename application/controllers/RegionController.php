<?php

class RegionController extends Zend_Controller_Action {

    
    
    public function init() 
            {
        
        if (!Model_Services::getUsers()->isAuth())
            $this->redirect('/auth/login');
    }
    


    public function newAction() {
        if ($this->_request->isXmlHttpRequest())
            $this->_helper->layout->disableLayout();

        $regionid = (int) $this->_getParam('regionid');
        if ($regionid) {
            $region = Model_Services::getRegions()->find($region)->current();
        } else {
            $region = Model_Services::getRegions()->createRow();
        }
        $this->view->region=$region;
    }

    public function saveAction() {
        $response = array('error' => 0, 'message => null');
        try {
            $regionid = (int) $this->_getParam('regionid');
            if ($regionid) {
                $region = Model_Services::getRegions()->find($regionid)->current();
            } else {
                $region = Model_Services::getRegions()->createRow();
            }

            $region->setFromArray($this->_getAllParams())->save();
            $response['regionid']=$region->regionid;
            $response['regnm']=$region->regnm;
        } catch (Exception $e) {
            $response['error'] = 1;
            $response['message'] = $e->getMessage();
        }
        $this->_helper->json($response);
    }

}
