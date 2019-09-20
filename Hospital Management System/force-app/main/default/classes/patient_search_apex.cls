public class patient_search_apex {
    public list<Patient__c> patient {set;get;}
       public Boolean flag{set;get;}
       public Boolean flag1{set;get;}
        public Boolean flag2{set;get;}
       public String name{set;get;}
      public String phone{set;get;}
     public String email{set;get;}
      public string query{set;get;}
    ApexPages.StandardController controller;
    public patient_search_apex(ApexPages.StandardController controller){
       flag=true;
       flag1=false;
       flag2=false;
       this.controller = controller;  
    }
 
    
   public PageReference Dynamicsearch()
    {
        flag=true;
        flag1=true;
        flag2=false;
        query='Select name,Phone__c,Email__c from Patient__c ';
        
        if(name=='' && phone=='' && email=='' )
        {
            flag=true;
            flag1=false;
            flag2=false;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Please enter any values in the fields'));
        }
        else
        {
            if(name!='' && phone!='' && email!='' )
            {
             query = query + ' where name like \'%'+name+'%\' and Phone__c=\''+phone+'\' and Email__c=\''+email+'\'';
             patient=database.query(query);
            }
            else{
              if(name!='' && phone!='' )
               {
                query = query + ' where name like \'%'+name+'%\'and Phone__c=\''+phone+'\'';  
                }
              else 
              {
              if(phone!='' && email!='')
              {
                query = query +' where Phone__c=\''+phone+'\' and Email__c=\''+email+'\'';
               }
                  else{
                      if(name!='')
               {
                query = query + ' where name like \'%'+name+'%\'';  
               }else{
                   if(phone!=''){
                       query = query + ' where Phone__c like \'%'+phone+'%\'';
                   }
                   else{
                       if(email!=''){
                           query = query + ' where Email__c like \'%'+email+'%\'';
                       }
                       
   
                   }
               }
                  }
           
        }
        
    }
            
            patient=database.query(query); 
  }      
     
         return null;
    }

    public void newpatient() //Refers to the new patient registration form
    {
        
        flag=false;
        flag1=false;
        flag2=true;
    }
 public pagereference saveme()
   {
      
              
                   controller.save();
                     flag=True;
                     flag1=false;
                     flag2=false;
                     ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Patient Registered successfully'));
                     
     
        return null;
  }
    public void cancel(){
      
             name='';
             phone='';
             email='';
             flag=true;
             flag1=false;
             flag2=false;
    }
  
}