<?php

class Model_Arbitrs_Arbitr extends Zend_Db_Table_Row_Abstract
{
    protected function _insert()
    {
      $this->_checkFields();
    }
    
    protected function _update()
    {
      $this->_checkFields();
    }
    
    protected function _checkFields()
    {
        if((isset($this->_modifiedFields['inn']) && $this->_modifiedFields['inn'] == true)||
                (isset($this->_modifiedFields['nsvid']) && $this->_modifiedFields['nsvid'] == true))
        {
            
        }
        
        
    }
    
}





