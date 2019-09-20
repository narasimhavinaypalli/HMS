@istest
public class renderbilling_test_class {
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
 Lab_Report__c lr=new Lab_Report__c(Test_Names__c='Blood Test',Test_Results__c='Positive',Tests_Amount__c=2000,In_Patient__c=ip.Id,Prescription__c=pre.Id,Date_of_Test__c=system.today());
   insert lr;
      }

    public testmethod static void bill_test(){
        test.startTest();
         Patient__c pts=[select id from Patient__c where name='shesh'];
         In_Patient__c ips=[select id from In_Patient__c where Guardian_Name__c='jack'];
         Lab_Report__c lrs=[select id from Lab_Report__c where Date_of_Test__c=:system.today()];
      
        Billing__c b=new Billing__c(Patient__c=pts.Id,In_Patient__c=ips.id,Lab_Report__c=lrs.id,Payment_Mode__c='cash');
        renderBillingClass rbc=new renderBillingClass(new ApexPages.StandardController(b));
        rbc.showbill();
        Billing__c bill=[select Patient__c from Billing__c where Patient__c =:pts.Id];
        system.assertEquals(bill.Patient__c, pts.Id);
        test.stopTest();
  }
     public testmethod static void bill_test1(){
        test.startTest();
         Patient__c pts=[select id from Patient__c where name='shesh'];
         In_Patient__c ips=[select id from In_Patient__c where Guardian_Name__c='jack'];
         Lab_Report__c lrs=[select id from Lab_Report__c where Date_of_Test__c=:system.today()];
      
        Billing__c b=new Billing__c(Patient__c=pts.Id,In_Patient__c=ips.id,Lab_Report__c=lrs.id,Payment_Mode__c='cash');
        renderBillingClass rbc=new renderBillingClass(new ApexPages.StandardController(b));
        rbc.showbill();
        Billing__c bill=[select Patient__c from Billing__c where Patient__c =:pts.Id];
        system.assertEquals(bill.Patient__c, pts.Id);
        test.stopTest();
  }
}