@isTest
private class docsearchTestapex_class {

@testSetup static void setup() {
           Doctor__c dc=new Doctor__c(name='Keshav',Doctor_available_from__c='09.30',Doctor_available_to__c='16.30',Doctor_Degree__c='Mbbs',Doctor_Fee__c=200,Specialization__c='Neurologist',Available__c='Yes');
           insert dc;
     }
    public testmethod static void savemetest(){
        test.startTest();   
        Doctor__c dc=new Doctor__c(name='test',Doctor_available_from__c='09.30',Doctor_available_to__c='16.30',Doctor_Degree__c='Mbbs',Doctor_Fee__c=200,Specialization__c='testology',Available__c='Yes');
        doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc));
         dssa.saveme();   
        test.stopTest();
    }
    public testmethod static void savemetest1(){
        test.startTest();   
        Doctor__c dc=new Doctor__c(name='test',Doctor_available_from__c='16.30',Doctor_available_to__c='09.30',Doctor_Degree__c='Mbbs',Doctor_Fee__c=200,Specialization__c='testology',Available__c='Yes');
        doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc));
         dssa.saveme();   
        test.stopTest();
    }
     public testmethod static void canceltest(){
        test.startTest(); 
         Doctor__c dc=new Doctor__c();
        doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc));
         dssa.cancel();
          test.stopTest();
     }
    public testmethod static void newdoctortest(){
        test.startTest(); 
        Doctor__c dc=new Doctor__c();
        doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc));
        dssa.newdoctor();
        test.stopTest(); 
    }
    public testmethod static void dynamicsearch_test(){
        test.startTest();
        Doctor__c dc=new Doctor__c();
        doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc));
        dssa.name='Keshav';
        dssa.specialization='Neurologist';
        dssa.doctordegree='Mbbs';
        dssa.Dynamicsearch();   
        Doctor__c dc1=[select name,Specialization__c,Doctor_Degree__c from Doctor__c where name=:dssa.name and Specialization__c=:dssa.specialization and Doctor_Degree__c=:dssa.doctordegree];
        system.assertEquals(dc1.name,dssa.name);
        system.assertEquals(dc1.Specialization__c,dssa.specialization);
        system.assertEquals(dc1.Doctor_Degree__c,dssa.doctordegree);
        test.stopTest();
    }
     public testmethod static void dynamicsearch_test1(){
        test.startTest();
       Doctor__c dc=new Doctor__c();
        doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc)); 
        dssa.name='Keshav';
        dssa.specialization='Neurologist';
        dssa.doctordegree='';
        dssa.Dynamicsearch();   
        Doctor__c dc1=[select name,Specialization__c from Doctor__c where name=:dssa.name and Specialization__c=:dssa.specialization];
        system.assertEquals(dc1.name,dssa.name);
        system.assertEquals(dc1.Specialization__c,dssa.specialization);
       
        test.stopTest();
}
     public testmethod static void dynamicsearch_test2(){
        test.startTest();
        Doctor__c dc=new Doctor__c();
        doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc));
        dssa.name='';
        dssa.specialization='Neurologist';
        dssa.doctordegree='Mbbs';
        dssa.Dynamicsearch();   
         Doctor__c dc1=[select Specialization__c,Doctor_Degree__c from Doctor__c where Specialization__c=:dssa.specialization and Doctor_Degree__c=:dssa.doctordegree];
        system.assertEquals(dc1.Specialization__c,dssa.specialization);
        system.assertEquals(dc1.Doctor_Degree__c,dssa.doctordegree);
        test.stopTest();
}
    public testmethod static void dynamicsearch_test3(){
         test.startTest();
         Doctor__c dc=new Doctor__c();
         doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc)); 
        dssa.name='Keshav';
        dssa.specialization='';
        dssa.doctordegree='Mbbs';
        dssa.Dynamicsearch();   
        Doctor__c dc1=[select name,Doctor_Degree__c from Doctor__c where name=:dssa.name and Doctor_Degree__c=:dssa.doctordegree];
        system.assertEquals(dc1.name,dssa.name);
        system.assertEquals(dc1.Doctor_Degree__c,dssa.doctordegree);
        test.stopTest();
}
 
    public testmethod static void dynamicsearch_test4(){
        test.startTest();
        Doctor__c dc=new Doctor__c();
        doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc)); 
        dssa.name='';
        dssa.specialization='';
        dssa.doctordegree='';

        dssa.Dynamicsearch();   
        integer dc1=[select count() from Doctor__c where name=:dssa.name and Specialization__c=:dssa.specialization and Doctor_Degree__c=:dssa.doctordegree];        
        system.assertEquals(dc1,0);
        test.stopTest();
}
    public testmethod static void dynamicsearch_test5(){
        test.startTest();
       Doctor__c dc=new Doctor__c();
        doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc));
        dssa.name='Keshav';
        dssa.specialization='';
        dssa.doctordegree='';

        dssa.Dynamicsearch();   
        Doctor__c dc1=[select name from Doctor__c where name=:dssa.name ];
        system.assertEquals(dc1.name,dssa.name);
        test.stopTest();
}
    public testmethod static void dynamicsearch_test6(){
        test.startTest();
        Doctor__c dc=new Doctor__c();
        doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc));
        dssa.name='';
        dssa.specialization='Neurologist';
        dssa.doctordegree='';
        dssa.Dynamicsearch();   
        Doctor__c dc1=[select Specialization__c from Doctor__c where Specialization__c=:dssa.specialization];
        system.assertEquals(dc1.Specialization__c,dssa.specialization);
        test.stopTest();
}
     public testmethod static void dynamicsearch_test7(){
        test.startTest();
        Doctor__c dc=new Doctor__c();
        doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc));
        dssa.name='';
        dssa.specialization='';
        dssa.doctordegree='Mbbs';
        dssa.Dynamicsearch();   
        Doctor__c dc1=[select Doctor_Degree__c from Doctor__c where Doctor_Degree__c=:dssa.doctordegree];
        system.assertEquals(dc1.Doctor_Degree__c,dssa.doctordegree);
        test.stopTest();
}
}