trigger Duplicate_Appointment on Appointment__c(before insert) {
    List<Appointment__c> appointments=[select Appointment_Date__c,Appointment_Time__c,Doctor__c,Patient__c,Doctor__r.Doctor_available_from__c,Doctor__r.Doctor_available_to__c from Appointment__c];
    Map<String,Appointment__c> sap= new Map<String,Appointment__c>();
    Doctor__c doc=new Doctor__c();
    set<Id> setDoctorIds = new Set<Id>();
    for(Appointment__c app:trigger.new)
    {
        setDoctorIds.add(app.Doctor__c);
    }
    Map<String,Doctor__c> mapOfDcotor= new Map<String,Doctor__c>([SELECT Id,Doctor_available_from__c,Doctor_available_to__c FROM Doctor__c WHERE Id IN:setDoctorIds]);
    for(Appointment__c apps:appointments)
    {        
        sap.put(String.valueof(apps.Doctor__c+''+apps.Appointment_Date__c+''+apps.Appointment_Time__c),apps);
    }    
    for(Appointment__c app:trigger.new)
    {
        if(trigger.isinsert&&trigger.isbefore){
            if(sap.get(String.valueof(app.Doctor__c+''+app.Appointment_Date__c+''+app.Appointment_Time__c))!=null)
            {   
                
                app.adderror('appointment time already reserved');     
            }
            double aptime = Double.valueOf(app.Appointment_Time__c);
            if(aptime < Double.valueOf(mapOfDcotor.get(app.Doctor__c).Doctor_available_from__c)
               || aptime >= Double.valueOf(mapOfDcotor.get(app.Doctor__c).Doctor_available_to__c)){
                  
                   app.adderror('Select time only in doctor available timings');
               }
            
        }
    }
}