@istest
public class patient_search_test_class {
    
     @testSetup static void setup() {
           Patient__c pat=new Patient__c(name='shesh',Blood_Group__c='B+',Email__c='shesh@tdisport.com',phone__c='9865748967',Gender__c='male',Age__c=76,weight__c=52);
           insert pat;
     }
    public testmethod static void savemetest(){
        test.startTest();   
        Patient__c pat=new Patient__c(name='test',Blood_Group__c='B+',Email__c='test@tdisport.com',phone__c='9865763167',Gender__c='male',Age__c=26,weight__c=41);
        patient_search_apex psa=new patient_search_apex(new ApexPages.StandardController(pat));
         psa.saveme();   
        test.stopTest();
    }
    
     public testmethod static void canceltest(){
        
         Patient__c pat=new Patient__c();
        Apexpages.StandardController sc=new apexpages.StandardController(pat);
        patient_search_apex psa=new patient_search_apex(sc);
         psa.cancel();
     }
    public testmethod static void newpatienttest(){
        Patient__c pat=new Patient__c();
        Apexpages.StandardController sc=new apexpages.StandardController(pat);
        patient_search_apex psa=new patient_search_apex(sc);
        
        psa.newpatient();
    }
    public testmethod static void dynamicsearch_test(){
        test.startTest();
       Patient__c pat=new Patient__c();
        Apexpages.StandardController sc=new apexpages.StandardController(pat);
        patient_search_apex pssa=new patient_search_apex(sc);
        pssa.name='shesh';
        pssa.phone='9865748967';
        pssa.email='shesh@tdisport.com';
        pssa.Dynamicsearch();   
        patient__c pt1=[select name,phone__c,email__c from Patient__c where name=:pssa.name and phone__c=:pssa.phone and email__c=:pssa.email];
        system.assertEquals(pt1.name,pssa.name);
        system.assertEquals(pt1.phone__c,pssa.phone);
        system.assertEquals(pt1.email__c,pssa.email);
        test.stopTest();
    }
     public testmethod static void dynamicsearch_test1(){
        test.startTest();
        Patient__c pat=new Patient__c();
        Apexpages.StandardController sc=new apexpages.StandardController(pat);
        patient_search_apex pssa=new patient_search_apex(sc); 
        pssa.name='shesh';
        pssa.phone='9865748967';
        pssa.email='';
        pssa.Dynamicsearch();   
        patient__c pt1=[select name,phone__c from Patient__c where name=:pssa.name and phone__c=:pssa.phone ];
        system.assertEquals(pt1.name,pssa.name);
         system.assertEquals(pt1.phone__c,pssa.phone);
        test.stopTest();
}
     public testmethod static void dynamicsearch_test2(){
        test.startTest();
         Patient__c pat=new Patient__c();
         Apexpages.StandardController sc=new apexpages.StandardController(pat);
         patient_search_apex pssa=new patient_search_apex(sc); 
        pssa.name='';
        pssa.phone='9865748967';
        pssa.email='shesh@tdisport.com';
        pssa.Dynamicsearch();   
        patient__c pt1=[select phone__c,email__c from Patient__c where email__c=:pssa.email and phone__c=:pssa.phone ];
        system.assertEquals(pt1.email__c,pssa.email);
         system.assertEquals(pt1.phone__c,pssa.phone);
        test.stopTest();
}
    public testmethod static void dynamicsearch_test3(){
        test.startTest();
         Patient__c pat=new Patient__c();
        Apexpages.StandardController sc=new apexpages.StandardController(pat);
        patient_search_apex pssa=new patient_search_apex(sc); 
        pssa.name='shesh';
        pssa.phone='';
        pssa.email='shesh@tdisport.com';
        pssa.Dynamicsearch();   
        patient__c pt1=[select name,email__c from Patient__c where name=:pssa.name and email__c=:pssa.email];
        system.assertEquals(pt1.name,pssa.name);       
        system.assertEquals(pt1.email__c,pssa.email);
        test.stopTest();
}
 
    public testmethod static void dynamicsearch_test4(){
        test.startTest();
         Patient__c pat=new Patient__c();
        Apexpages.StandardController sc=new apexpages.StandardController(pat);
        patient_search_apex pssa=new patient_search_apex(sc); 
        pssa.name='';
        pssa.phone='';
        pssa.email='';
        pssa.Dynamicsearch();   
        integer pt1=[select count() from Patient__c where name=:pssa.name and phone__c=:pssa.phone and email__c=:pssa.email];
        system.assertEquals(pt1,0);
        test.stopTest();
}
    public testmethod static void dynamicsearch_test5(){
        test.startTest();
        Patient__c pat=new Patient__c();
        Apexpages.StandardController sc=new apexpages.StandardController(pat);
        patient_search_apex pssa=new patient_search_apex(sc); 
        pssa.name='shesh';
        pssa.phone='';
        pssa.email='';
        pssa.Dynamicsearch();   
        patient__c pt1=[select name from Patient__c where name=:pssa.name ];
        system.assertEquals(pt1.name,pssa.name);
        test.stopTest();
}
    public testmethod static void dynamicsearch_test6(){
        test.startTest();
         Patient__c pat=new Patient__c();
        Apexpages.StandardController sc=new apexpages.StandardController(pat);
        patient_search_apex pssa=new patient_search_apex(sc); 
        pssa.name='';
        pssa.phone='9865748967';
        pssa.email='';
        pssa.Dynamicsearch();   
        patient__c pt1=[select phone__c from Patient__c where phone__c=:pssa.phone];
        system.assertEquals(pt1.phone__c,pssa.phone);
        test.stopTest();
}
     public testmethod static void dynamicsearch_test7(){
        test.startTest();
        Patient__c pat=new Patient__c();
        Apexpages.StandardController sc=new apexpages.StandardController(pat);
        patient_search_apex pssa=new patient_search_apex(sc);
        pssa.name='';
        pssa.phone='';
        pssa.email='shesh@tdisport.com';
        pssa.Dynamicsearch();   
        patient__c pt1=[select email__c from Patient__c where email__c=:pssa.email];
        system.assertEquals(pt1.email__c,pssa.email);
        test.stopTest();
}
}