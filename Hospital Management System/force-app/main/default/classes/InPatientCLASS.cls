public class InPatientCLASS {
    public Boolean flag{set;get;}
    public Boolean flag1{set;get;}
    public ApexPages.StandardController controller;
    public InPatientCLASS(ApexPages.StandardController controller){
        this.controller=controller;
        Flag=True;
        Flag1=False;
    }
    public PageReference save()
    {
         
       
           
                 controller.save();
                 string a=(string)controller.getId();
                if(a!=null){
                     Flag = false;
                     Flag1 = True;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Patient Registered successfully'));
                 }
       
        return null;
    }
}