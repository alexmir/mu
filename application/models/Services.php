<?php

class Model_Services {
    private static $_users;
    private static $_arbitrs;
    private static $_arbitrsView;
    private static $_regions;
    private static $_firms;
    private static $_sales;
    private static $_zayavkas;
    private static $_lots;
    
    /**
     * 
     * @return Model_Users
     */
    public static function getUsers()
    {
       if (!self::$_users)
           self::$_users= new Model_Users();
       return self::$_users;
    }
    
    public static function getArbitrs()
    {
       if (!self::$_arbitrs)
           self::$_arbitrs= new Model_Arbitrs();
       return self::$_arbitrs;
    }
    
    
    public static function getArbitrsView()
    {
       if (!self::$_arbitrsView)
           self::$_arbitrsView= new Model_ArbitrsView();
       return self::$_arbitrsView;
    }
    
    
    public static function getRegions()
    {
       if (!self::$_regions)
           self::$_regions= new Model_Regions();
       return self::$_regions;
    }    
    
    public static function getFirms()
    {
       if (!self::$_firms)
           self::$_firms= new Model_Firms();
       return self::$_firms;
    } 
    
    public static function getSales()
    {
       if (!self::$_sales)
           self::$_sales= new Model_Sales();
       return self::$_sales;
    }   
    
    public static function getZayavkas()
    {
       if (!self::$_zayavkas)
           self::$_zayavkas= new Model_Zayavkas();
       return self::$_zayavkas;
    }       
    
    public static function getLots()
    {
       if (!self::$_lots)
           self::$_lots= new Model_Lots();
       return self::$_lots;
    }       
}
    
