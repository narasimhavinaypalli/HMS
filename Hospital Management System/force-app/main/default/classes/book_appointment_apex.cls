public class book_appointment_apex {
   
    public Boolean Flag {set;get;}
    public Boolean Flag1{set;get;}
    public Boolean Flag2{set;get;}
    Public List<Doctor__c> Doctors {get;set;}
    private ApexPages.StandardController controller;
    public book_appointment_apex(ApexPages.StandardController controller){
        this.controller=controller;
        Doctors=[select Name,Doctor_available_from__c,Doctor_available_to__c,Available__c from Doctor__c];
        Flag = True;
        Flag1= True;
        Flag2 = false;
       
    }
    
   public PageReference bookAppointment()
    {
        
                   controller.save();
                  string a=(string)controller.getId();
                 
                   if(a!=null)
                   {    
                     Flag = false;
                     Flag1 = false;
                     Flag2 = True;  
                   }
       
         return null;
    }
    
    public PageReference back(){
          Flag = True;
          Flag1= True;
          Flag2 = false;
        return null;
    }
    
}