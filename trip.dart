import 'dart:io'; 
import 'dart:core';

 List info =List <Trip> ();
 
DateTime date=new DateTime(1212,5,4);
void main(List<String> arguments) {
  Trip t = new Trip(1,"ll",1,date,1);
  Passanger r = new Passanger(2,"ll","uu","uu",0);
   int choice=0;
   String y;
   while(true){
   print("******************************************************");
   print("Welcome in Travel Agency please enter your choice ");
   print("******************************************************");
   print("1-Add Trip");
   print("2-Edit Trip");
   print("3-Delete Trip");
   print("4-View Trip");
   print("5-Search Trip");
   print("6-Reserve Trip");
   print ("7-view passanger");
   print("8-View latest Trip");
   print("9-Exit");
   choice  = int.parse(stdin.readLineSync());;
  switch(choice){
    case 1:
    String y2;
    do {
     print("enter trip id ");
    int id  =int.parse(stdin.readLineSync());
    print("enter trip location");
    String name = stdin.readLineSync();
    print("enter trip passlimit ");
    int limit  = int.parse(stdin.readLineSync());
    print("enter trip price");
    double price = double.parse(stdin.readLineSync());
    print ("enter trip number day");
    int day  = int.parse(stdin.readLineSync());
    print ("enter trip number month");
    int month  = int.parse(stdin.readLineSync());
    print ("enter trip number year");
    int year  = int.parse(stdin.readLineSync());
     date=new DateTime(year,month,day);
    Trip o = new Trip(id,name ,limit,date,price);
    t.Add_trip(o);
    print("Do you want add another trip ");
     y2 = stdin.readLineSync();
    } while (y2=='yes');
    
    break;
    
    case 2:
     do {
       t.Edit_trip();
       print("Do you want Edit agin");
       y= stdin.readLineSync();
    } while (y=='yes');
     break;

     case 3:
     int id=0;
     print("Enter id of trip that want delete it");
     id =int.parse(stdin.readLineSync());
     t.delete(id);
     break;

     case 4:
     t.view_trip();
     break;

     case 5:
     int price=0;
     print("Enter price of Trip");
     price = int.parse(stdin.readLineSync());
     t.Search(price);
     break;

     case 6:
     int id=0;
     print("Welcome customer this is All trip please  reserve by id");
     print("***********************************************************");
     t.view_trip();
     print("Enter Trip id :");
      id =int.parse(stdin.readLineSync());
     print("Enter your ID :");
     int d=int.parse(stdin.readLineSync());
     print("Enter your name :");
     String name=stdin.readLineSync();
     print("Enter your email :");
     String email=stdin.readLineSync();
     print("Enter your phone :");
     String phone=stdin.readLineSync();
     Passanger p = new Passanger(d,name,email,phone,id);
     r.Add_passanger(p);
     r.reserv_trip(id);
     break;

     case 7:
     int c,id;
     print("1-view All passangers");
     print("2-view passangers in a certain Trip by its Id");
     print("Enter your choose :");
     c=int.parse(stdin.readLineSync());
     if(c==1){
       r.veiw_All();
     }
     else if(c==2){
       print("Enter Trip ID :");
       id=int.parse(stdin.readLineSync());
       r.veiw(id);
     }
     break;

    case 8:
    t.last_Trip();
    break;
     
     case 9:
     print("Good bye");
     return;
     break;

      default:
         print("your choose is invaild please try Again");
  }
   }
}
class Trip {
  int id;
  String location;
  int passlimit;
  DateTime date;
  double price;
  int reserve;
 
  Trip(int id,String location,int passlimit,DateTime date,double price){
    this.id=id;
    this.location=location;
    this.passlimit=passlimit;
    this.date=date;
    this.price=price;
    this.reserve=0;
  }
  void Add_trip(Trip t){
    info.add(t);

  }
  void delete (int id){
    
   for(int i=0;i<info.length;i++){
      if(info[i].id==id){
        info.remove(info[i]);
      }
  }
  }
  void Edit_trip(){
    dynamic edit;
    int e=0;
    print("Enter the id of Trip that want Edit it");
    int id;
    id=int.parse(stdin.readLineSync());
    for(int i=0;i<info.length;i++){
      if(info[i].id==id){
        e=i;
      }
    }
    
    int c;
    print("Enter what do you edit it");
    print("*************************************");
    print("1-id");
    print("2-location");
    print("3-passlimit");
    print("4-date");
    print("5-price");
    print("6-reserve");
    c = int.parse(stdin.readLineSync());
    if(c!=4&&c!=2 &&c!=5)
    {
      print("Enter your edit");
      edit =int.parse(stdin.readLineSync());
    }
    switch(c){
      case 1:
      info[e].id=edit;
      break;
      case 2:
     print("Enter your edit location");
      edit =stdin.readLineSync();
       info[e].location=edit;
       break;
      case 3:
      
      info[e].passlimit=edit;
      break;
      case 4:
       print ("enter trip number day");
       int day  = int.parse(stdin.readLineSync());
       print ("enter trip number month");
       int month  = int.parse(stdin.readLineSync());
       print ("enter trip number year");
       int year  = int.parse(stdin.readLineSync());
        date=new DateTime(year,month,day);
       info[e].date=date;
       break;
       case 5:
       print("Enter your edit");
       edit =double.parse(stdin.readLineSync());
        info[e].price=edit;
        break;
        case 6:
         info[e].reserve=edit;
         break;

      default:
      print("your choose is invaild please try Again");

    }
    print("your Edit is successful");
    

  }
  void view_trip(){
    info.sort((a, b) => a.date.compareTo(b.date));
    for(int i=0;i<info.length;i++){
     print("Trip  ${i+1} information :");
     print('trip id => ${info[i].id}');
     print('trip location => ${info[i].location}');
     print('trip passlimit => ${info[i].passlimit}');
     print('trip date  =>${info[i].date}');
     print('trip price => ${info[i].price}');
     print("**********************************************");
    }
  }
  void Search(int pri){
    int index = info.indexWhere((st) => st.price==pri); 
     print('trip ID ${info[index].id}');
     print('trip location ${info[index].location}');
     print('trip passlimit  ${info[index].passlimit}');
     print('trip date  ${info[index].date}');
     print('trip price ${info[index].price}');
  }
   void last_Trip(){
    if(info.length<10){
    for(int i=0;i<info.length;i++){
     print("Trip  ${i+1} information :");
     print('trip id => ${info[i].id}');
     print('trip location => ${info[i].location}');
     print('trip passlimit => ${info[i].passlimit}');
     print('trip date  =>${info[i].date}');
     print('trip price => ${info[i].price}');
     print("********************************************");
    }
    }
    else{
      for(int i=info.length-10;i<info.length;i++){
     print("Trip  ${i+1} information :");
     print('trip id => ${info[i].id}');
     print('trip location => ${info[i].location}');
     print('trip passlimit => ${info[i].passlimit}');
     print('trip date  =>${info[i].date}');
     print('trip price => ${info[i].price}');
     print("********************************************");
    }
  }
  
}
    
  }
 

class Passanger {
  int id;
  String name;
  String email;
  String phone;
  int idtrip;
  Trip p=new Trip(1,"kk",5,date,2);
  List pass =List <Passanger> ();
  Passanger(int id,String name,String email,String phone,int idtrip){
    this.id=id;
    this.name=name;
    this.email=email;
    this.phone=phone;
    this.idtrip=idtrip;
  }
  void Add_passanger(Passanger p){
    pass.add(p);
  }
  
  void veiw_All(){
    double pri;
    for(int i=0;i<pass.length;i++){
    print("Passanger  ${i+1} information :");
     print('passanger ID => ${ pass[i].id}');
     print('passanger name => ${pass[i].name}');
     print('passanger phone => ${pass[i].email}');
     print('passanger number  =>${pass[i].phone}');
     print('passanger IdTrip => ${pass[i].idtrip}');
     print("Trip information for the  ${i+1} passengers :"); 
     for(int j=0;j<info.length;j++){
       if(info[j].id==pass[i].idtrip){
         print('trip ID => ${info[j].id}');
     print('trip location => ${info[j].location}');
     print('trip passlimit => ${info[j].passlimit}');
     print('trip date  =>${info[j].date}');
     pri=discount(info[j].price);
     print('trip price => ${pri}');
     print("************************************************");
       }

     }

    }
    
      
  }
  void veiw (int id){
    double pri;
    for(int i=0;i<pass.length;i++){
     if(pass[i].idtrip==id){
       print(" information of the  ${i+1} passengers :"); 
     print('passanger id => ${ pass[i].id}');
     print('passanger name => ${pass[i].name}');
     print('passanger phone => ${pass[i].email}');
     print('passanger number  =>${pass[i].phone}');
     print('passanger IdTrip => ${pass[i].idtrip}');
     
     
     

    }
     }
     for(int i=0;i<info.length;i++){
       if(info[i].id==id){
         print("information of trip");
    print('trip ID => ${info[i].id}');
     print('trip location => ${info[i].location}');
     print('trip passlimit => ${info[i].passlimit}');
     print('trip date  =>${info[i].date}');
     pri=discount(info[i].price);
     print('trip price => ${pri}');
     print("************************************************");
       }

     }
    }
    double discount(double value)
  {
    if(value>10000)
    {
      double result=20/100*value;
      result=value-result;
      return result;
    }
    else{
      return value;
    }
    return 0.0;
  }
  
  void  reserv_trip(int id){
    int r=0;
    for(int i=0;i<info.length;i++){
      if(info[i].id==id){
        info[i].reserve+=1;
         r=i;
      }  
    }
    if (info[r].reserve>info[r].passlimit){
      print("Your reservation failed because that flight is full");
       print("please choose anther Trip");
    }
    else{
      print("Your reservation was successful");
      print("Thank You");
    }
  }


}


  
   
  

   