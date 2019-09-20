public class PrescriptionClass {
    public Boolean flag{set;get;}
    public Boolean flag1{set;get;}
    private ApexPages.StandardController controller;
    Prescription__c request;
    public PrescriptionClass(ApexPages.StandardController controller){
        this.controller=controller;
             Flag=True;
             Flag1=False;
    }
   public PageReference Save()
   
            {
                 controller.save();
                     Flag = false;
                     Flag1 = true;
                     
                     return null;
            }
          
    }