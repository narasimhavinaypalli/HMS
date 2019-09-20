trigger Doctor_from_to_time on Doctor__c (before insert,before update) {
    Doctor__c dc=new Doctor__c();
   doctor_search_apex dssa=new doctor_search_apex(new ApexPages.StandardController(dc));
    for(Doctor__c doc:trigger.new)
    {
        if(Double.valueOf(doc.Doctor_available_from__c)>=Double.valueOf(doc.Doctor_available_to__c))
        {
            doc.adderror('Doctor available "To Time" cannot be greater than or equal to "From Time"');
        }
        else
        {
                     dssa.flag=True;
                     dssa.flag1=false;
                     dssa.flag2=false;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Doctor Registered successfully'));
        }
    }
}