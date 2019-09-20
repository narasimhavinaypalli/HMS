public class doctor_search_apex {
    public list<Doctor__c> doctor{set;get;}
       public Boolean flag{set;get;}
       public Boolean flag1{set;get;}
        public Boolean flag2{set;get;}
       public String name{set;get;}
      public String specialization{set;get;}
     public String doctordegree{set;get;}
      public string query{set;get;}
    private ApexPages.StandardController controller;
   
    public doctor_search_apex(ApexPages.StandardController controller){
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
        query='Select name,Specialization__c,Doctor_Degree__c from Doctor__c ';
        
        if(name=='' && specialization=='' && doctordegree=='')
        {
            
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter any values in the fields'));
            flag=true;
            flag1=false;
            flag2=false;
        }
        else
        {
            if(name!=''&& specialization!='' && doctordegree!='' )
            {
             query = query + ' where name like \'%'+name+'%\' and Specialization__c=\''+specialization+'\' and Doctor_Degree__c=\''+doctordegree+'\'';
             doctor=database.query(query);
            }
            else{
              if(name!='' && specialization!='' )
               {
                query = query + ' where name like \'%'+name+'%\'and Specialization__c=\''+specialization+'\'';  
                }
              else 
              {
              if(specialization!='' && doctordegree!='')
              {
                query = query +' where Specialization__c=\''+specialization+'\' and Doctor_Degree__c=\''+doctordegree+'\'';
               }
                  else{
                      if(name!='' )
                      {
                query = query + ' where name like \'%'+name+'%\'';  
                      }
                      else{
                           if(specialization!='' ){
                            query = query + ' where Specialization__c like \'%'+specialization+'%\'';
                              }
                         else{
                          if(doctordegree!=''){
                           query = query + ' where Doctor_Degree__c like \'%'+doctordegree+'%\'';
                              }   
                   }
               }
                  }
           
        }
        
    }
            doctor=database.query(query); 
  }      
     
         return null;
    }

    public void newdoctor() //Refers to the new doctor registration form
    {
       flag=false;
        flag1=false;
        flag2=true;
    }

    public pagereference saveme()
   {

                controller.save();
                return null;
    }
    
     public PageReference cancel(){
        
             flag=true;
             flag1=false;
             flag2=false;
             return null;
    }
}