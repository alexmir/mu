<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    protected function _initRender() {
        $this->bootstrap('Layout');
        $layout = $this->getResource('Layout');

        // use custom view object with helpers inside
        $view = new Zend_View();
        $layout->setView($view);

        $view->doctype('XHTML1_STRICT');
        $view->headMeta()->appendHttpEquiv('Content-Type', 'text/html; charset=UTF-8');

        $view->headScript()
            ->appendFile('http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js', 'text/javascript')
            ->appendFile('/js/core.js', 'text/javascript')
            ->appendFile('/js/datepicker.js', 'text/javascript')
            ->appendFile('/js/chosen.jquery.min.js', 'text/javascript')
            ->appendFile('/js/modal.js', 'text/javascript');

        
        $view->headLink()
                ->appendStylesheet('/css/modal.css')
                ->appendStylesheet('/css/chosen.css')
                ->appendStylesheet('/css/datepicker.css')
                ->appendStylesheet('/css/core.css');

        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->setView($view);
        $viewRenderer->setViewSuffix('tpl');
    }

    protected function _initResourceLoader() {
        $resourceLoader = new Zend_Loader_Autoloader_Resource(array(
            'namespace' => '',
            'basePath' => APPLICATION_PATH,
        ));
        $resourceLoader->addResourceType('model', 'models/', 'Model');
        $resourceLoader->addResourceType('form', 'forms/', 'Form');
        $resourceLoader->addResourceType('service', 'services/', 'Service');

        return $resourceLoader;
    }

}

