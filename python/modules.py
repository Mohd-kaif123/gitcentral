import os
print (os.listdir("."))

#Create and write data
with open("test_file.txt","w") as file:
    file.write("This is a test file")

#Read file content
with open("test_file.txt","r") as f:
    content=f.read()
    print(content)

#update file (append data)
with open("test_file.txt","a") as f:
    f.write("\nAdding new line to update the file.\n")