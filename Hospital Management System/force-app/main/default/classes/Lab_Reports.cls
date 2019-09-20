public class Lab_Reports {
public Boolean flag{set;get;}
    public Boolean flag1{set;get;}
    public ApexPages.StandardController controller;
    public Lab_Reports(ApexPages.StandardController controller){
        this.controller=controller;
        flag=True;
        flag1=False;
    }
    public PageReference save()
    {
                 controller.save();
                 string a=(string)controller.getId();
                if(a!=null){
                     Flag = false;
                     Flag1 = True;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Report generated successfully'));
                 }
       
        return null;
    }
}