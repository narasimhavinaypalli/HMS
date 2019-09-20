@istest
public class Lab_Reports_test {
@testSetup static void setup() {
   
       Patient__c pat=new Patient__c(name='shesh',Blood_Group__c='B+',Email__c='shesh@tdisport.com',phone__c='9865748967',Gender__c='male',Age__c=76,weight__c=52);
        insert pat;
 Doctor__c dc=new Doctor__c(name='Keshav',Doctor_available_from__c='09.30',Doctor_available_to__c='16.30',Doctor_Degree__c='Mbbs',Doctor_Fee__c=200,Specialization__c='Neurologist',Available__c='Yes');
         insert dc;
 Appointment__c a=new Appointment__c(Doctor__c=dc.id,Patient__c=pat.id,Appointment_Date__c=system.today(),Appointment_Time__c='10.30');
         insert a;  
 Prescription__c pre=new Prescription__c(Appointment__c=a.Id,Patient__c=pat.Id,In_Patient__c=true,Lab_tests__c='Blood Test',Medicines__c='BETACIN 25MG',Course_Duration__c='2 days',Problem_Description__c='fever');
        insert pre;
 Room__c rm=new Room__c(Room_Number__c='A101',Room_Type__c='AC',Status__c='Vacant',Room_Amount__c=500);  
    insert rm;
 In_Patient__c ip=new In_Patient__c(Patient__c=pat.Id,Prescription__c=pre.Id,Room__c=rm.Id,Advance_Amount__c=200,Date_of_Admission__c=system.today(),Guardian_Name__c='jack',Guardian_Phone__c='8547562547');
    insert ip;
   }
    
  public testmethod static void Lab_Report_test(){
       test.startTest();
       Prescription__c pree=[select id from Prescription__c where In_Patient__c=:true];
       
       Room__c rom=[select id from room__c where Room_Number__c='A101'];
       In_Patient__c ips=[select id from In_Patient__c where Date_of_Admission__c=:system.today()];
        Lab_Report__c lab=new Lab_Report__c(In_Patient__c=ips.Id,Prescription__c=pree.Id,Test_Names__c='Blood Test',Test_Results__c='Negative',Tests_Amount__c=200,Date_of_Test__c=system.today()); 
       Lab_Reports lrs =new Lab_Reports(new apexpages.StandardController(lab));
       lrs.Save();
     integer count=[select count() from Lab_Report__c];
     system.assertEquals(count,1);
      test.stopTest();
  }
}