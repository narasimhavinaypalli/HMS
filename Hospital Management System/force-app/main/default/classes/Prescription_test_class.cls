@istest
public class Prescription_test_class {

   @testSetup static void setup() {
   
        Patient__c pat=new Patient__c(name='shesh',Blood_Group__c='B+',Email__c='shesh@tdisport.com',phone__c='9865748967',Gender__c='male',Age__c=76,weight__c=52);
        insert pat;
         Doctor__c dc=new Doctor__c(name='Keshav',Doctor_available_from__c='09.30',Doctor_available_to__c='16.30',Doctor_Degree__c='Mbbs',Doctor_Fee__c=200,Specialization__c='Neurologist',Available__c='Yes');
         insert dc;
         Appointment__c a=new Appointment__c(Doctor__c=dc.id,Patient__c=pat.id,Appointment_Date__c=system.today(),Appointment_Time__c='10.30');
         insert a;       
   }
  public testmethod static void Prescription_test(){
      test.startTest();
      Patient__c pt=[select id from Patient__c where name='shesh'];
      Appointment__c ap=[select id from Appointment__c where Appointment_Date__c=:system.today()];
      Prescription__c pre=new Prescription__c(Appointment__c=ap.Id,Patient__c=pt.Id,In_Patient__c=true,Lab_tests__c='Blood Test',Medicines__c='BETACIN 25MG',Course_Duration__c='2 days',Problem_Description__c='fever');
      system.debug(ap);
      PrescriptionClass pc =new PrescriptionClass(new apexpages.StandardController(pre));
      pc.Save();
      
      test.stopTest();
  }
}