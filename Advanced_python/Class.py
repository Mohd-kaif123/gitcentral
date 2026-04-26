class Server:
    def __init__(self,name,ip):
        self.name=name
        self.ip=ip
    def status(self):
        print(f"{self.name} at {self.ip} is running....!")
web_server=Server("Webserver","198.162.1.10")
web_server.status()


# server class hai = blueprint
# web_server object hai = uss blue print ka actual cheez
# Class ek blueprint hota hai. Jaise ghar ka naksha hota hai 
# — usme likha hota hai ki ghar me kya kya hoga. Lekin naksha khud ghar nahi hota.
# Server class ek blueprint hai jo batata hai ki "ek server kaisa hoga, uske paas kya information hogi, aur wo kya kaam kar sakta hai."
# __init__ ek special method hai jise Python automatically call karta hai jab bhi tum koi naya object banate ho.

###################################################################
''' def → function banana shuru
__init__ → naam (double underscore = Python ka special method)
self → current object khud (neeche detail me)
name, ip → bahar se jo values doge woh yahan aayengi '''

###################################################################

# self matlab "jo object abhi ban raha hai, woh khud".
''' Jab tum likhte ho   pythonweb_server = Server("Webserver", "198.162.1.10")
 Tab Python andar se self = web_server kar deta hai automatically.'''
# 