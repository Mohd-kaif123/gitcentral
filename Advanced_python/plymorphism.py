class Bank:
    def withdraw(self,amount):
        pass
class SBI(Bank):
    def withdraw(self,amount):
        print("SBI: Withdraw using ATM")
class HDFC(Bank):
    def withdraw(self,amount):
        print("HDFC: Withdraw using Mobile App")
class ICIC(Bank):
    def withdraw(self,amount):
        print("ICIC: Withraw form Branch")
'''banks=[SBI(),HDFC(),ICIC()]

for bank in banks:
    bank.withdraw(1000)'''

process = SBI(1000)
process.withdraw()
