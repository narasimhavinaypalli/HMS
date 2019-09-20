public class renderBillingClass {
    public Boolean Flag {set;get;}
    public Boolean Flag1{set;get;}
    private ApexPages.StandardController controller;
    public renderBillingClass(ApexPages.StandardController controller){
        this.controller=controller;
        Flag = True;
        Flag1 = false;
       
    }
   public PageReference showbill()
    {
      
       
           
                    controller.save();
                     Flag = false;
                     Flag1 = True;
                     
           
          
        return null;
    }
    
  }