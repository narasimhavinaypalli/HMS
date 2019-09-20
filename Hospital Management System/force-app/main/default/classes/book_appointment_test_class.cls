@istest
public class book_appointment_test_class {

    @testsetup static void insertrec(){
        
        Patient__c pat=new Patient__c(name='Ronak',Blood_Group__c='A+',Email__c='ronak@tdisport.com',phone__c='9865748765',Gender__c='male',Age__c=26,weight__c=51);
        Doctor__c dc=new Doctor__c(name='Owaise',Doctor_available_from__c='11.30',Doctor_available_to__c='16.30',Doctor_Degree__c='Mbbs',Doctor_Fee__c=200,Specialization__c='Neurologist',Available__c='Yes');
        insert pat;
        insert dc;
    }
 public testmethod static void book_appointment_test()
 {
      test.startTest();
       Patient__c pat=[select id from Patient__c where name=:'Ronak'];
       Doctor__c dc=[select id from Doctor__c where name=:'Owaise'];
     
     appointment__c ap=new appointment__c(Doctor__c=dc.id,Patient__c=pat.id,Appointment_Date__c=system.today(),Appointment_Time__c='11.30');
     book_appointment_apex baa=new book_appointment_apex(new apexpages.StandardController(ap));
     baa.bookAppointment();
     appointment__c ap1=[select Patient__c from appointment__c where Patient__c=:ap.Patient__c];
     system.assertEquals(ap1.Patient__c, ap.Patient__c);
     test.stopTest();
 }
    public testmethod static void book_appointment_test1()
 {
      test.startTest();
       Patient__c pat=[select id from Patient__c where name=:'Ronak'];
       Doctor__c dc=[select id from Doctor__c where name=:'Owaise'];
      appointment__c ap=new appointment__c(Doctor__c=dc.id,Patient__c=pat.id,Appointment_Date__c=Date.newInstance(2019, 4, 4),Appointment_Time__c='11.30');
     book_appointment_apex baa=new book_appointment_apex(new apexpages.StandardController(ap));
     baa.bookAppointment();
      integer ap1=[select count() from appointment__c where Patient__c=:pat.id];
     system.assertEquals(ap1,0);
     test.stopTest();
 }
       public testmethod static void book_appointment_test2()
 {
      test.startTest();
       Patient__c pat=[select id from Patient__c where name=:'Ronak'];
       Doctor__c dc=[select id from Doctor__c where name=:'Owaise'];
      appointment__c ap=new appointment__c(Doctor__c=dc.id,Patient__c=pat.id,Appointment_Date__c=system.today(),Appointment_Time__c='10.30');
     book_appointment_apex baa=new book_appointment_apex(new apexpages.StandardController(ap));
     baa.bookAppointment();
      integer ap1=[select count() from appointment__c where Patient__c=:pat.id];
     system.assertEquals(ap1,0);
     test.stopTest();
 }
     public testmethod static void book_appointment_test3()
 {
      test.startTest();
       Patient__c pat=[select id from Patient__c where name=:'Ronak'];
       Doctor__c dc=[select id from Doctor__c where name=:'Owaise'];
     
     appointment__c ap=new appointment__c(Doctor__c=dc.id,Patient__c=pat.id,Appointment_Date__c=system.today(),Appointment_Time__c='11.30');
     book_appointment_apex baa=new book_appointment_apex(new apexpages.StandardController(ap));
     baa.bookAppointment();
     
      appointment__c app=new appointment__c(Doctor__c=dc.id,Patient__c=pat.id,Appointment_Date__c=system.today(),Appointment_Time__c='11.30');
     book_appointment_apex baaa=new book_appointment_apex(new apexpages.StandardController(app));
     baaa.bookAppointment();
     
     integer ap1=[select count() from appointment__c where Patient__c=:ap.Patient__c];
    
     system.assertEquals(ap1, 1);
     test.stopTest();
 }
    public testmethod static void backtest(){
        
         appointment__c ap=new appointment__c();
        Apexpages.StandardController sc=new apexpages.StandardController(ap);
        book_appointment_apex baa=new book_appointment_apex(sc);
         baa.back();
     }
    
}