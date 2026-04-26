from datetime import datetime


now=datetime.datetime.now()
print("Date:",now)

#format the date time
formatted= now.strftime("%Y-%m-%d %H:%M:%S")
print("formatted Date:", formatted)
#print(f"formatted Date: "{formatted}")

# using strptime p=parsing convert the string format into date time
data_str="2026-04-25 16:18:32"
parsed=datetime.datetime.strptime(data_str, "%Y-%m-%d %H:%M:%S")
print("parsad Datetime:",parsed)