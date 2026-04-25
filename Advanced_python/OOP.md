##Object Oriented Programming

-object Oriented Programming lets you structure your code using classes and Objects
-class is a blueprint of the structure
object is a part of that blueprint

##Example:
class Server:
    def __init__(self,name,ip):
            self.name=name
            self.ip=ip
    def status(self):
        print(f"{self.name} at {self.ip} is running.....! ")
        
web_server=Server("Webserver","198.162.1.10")
web_server.status()

-Here Server is a class : Blueprint
-init => RUns when you create a new Server
-self.name,self.ip => These are the server's Details (Attributes)
-status()=> a function (Method) will print the name and Ip Address
-web_server=> Server(..) Creating and Actual Server (Object)
-web_server.status=> calling method of the class

.......................................................................

1. Class: Server
Class ek Blueprint ya saancha hai.

Kyu likhte hain: Ye ek definition hai jo batati hai ki kisi bhi "Server" mein kya-kya khoobiyan hongi. Aapne class Server: likha hai, iska matlab aapne Python ko bata diya ki ab se jab bhi main koi naya server banaunga, uske paas name, ip aur ek status check karne ka function zaroori hona chahiye.

Asaan bhasha mein: Ye ek "Form" ki tarah hai jo abhi khaali hai.

####################
2. Object: web_server
Object us class ka ek Real Example ya Instance hai.

Kyu likhte hain: Class sirf ek idea hai, lekin computer ki memory mein jagah tabhi milti hai jab aap uska object banate hain. Jab aapne web_server = Server(...) likha, toh aapne us khaali "Form" ko bhar diya.

Details: Isme web_server object hai. Aap ek aur object bhi bana sakte hain: db_server = Server("Database", "10.0.0.1"). Dono alag-alag objects hain par ek hi Server class se bane hain.

Asaan bhasha mein: Ye ek bhara hua "Form" hai jo actual memory use kar raha hai.

####################

3. Method: status() aur __init__
Method class ke andar likhe gaye Functions ko kehte hain.

Kyu likhte hain: Methods batate hain ki wo object kya "kaam" kar sakta hai.

__init__: Ye ek special method hai jo data ko save (initialize) karta hai.

status(): Ye aapka banaya hua custom method hai. Iska kaam server ka status print karna hai.

Self ka role: Method ke andar self likhna zaroori hai taaki method ko pata chale ki usne apne hi object ka name aur ip use karna hai.

.........................................................................

#Comparison Table:-

Term        Aapke Code Mein     Kya Kaam Hai?
Class       Server              Ek structure/blueprint dena.
Object      web_server          Us structure ka real implementation.
Attributes  name, ip            Object ki jaankari (data) store karna.
Method      status()            Object se koi action perform karwana.


.........................................................................

##Task:-
Write a Program to call different methods of a class in Python using Class and Object
Time: 5 minutes
Hint: Create a Class that stores information about a server and has a method to check if it need an update or not

Solution
class Server:
    def __init__(self,name,current_version,latest_version):
        self.name=name
        self.current_version=current_version
        self.latest_version=latest_version
    # Method 1: Display Server Information
    def display_info(self):
        print(f"Server Name: {self.name}")
        print(f"Current Version: {self.current_version}")
        print(f"Latest Version:{self.latest_version}")
    # Method 2: Check if update is needed
    def check_upadte(self):
        if self.current_version < self.latest_version:
            print("Update Required!")
            return True
        else:
            print("Server is up-to-date.")
            return False
    # Method 3: update server
    def update_server(self):
        if self.check_upadte():
            print("Updating Server....")
            self.current_version=self.latest_version
            print("Update Completed!")
        else:
            print("No Update Needed!")
# Creating an Object
server1 = Server("Production Server",1.0,2.0)

# Calling Different Methods
server1.display_info()
server1.check_upadte()
server1.update_server()