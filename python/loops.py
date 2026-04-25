# for loop
for i in range(1,5):
    print(f"checking Server {i}....")

#while loop
server_up= False
while not server_up:
    print("waiting for the server to start...")
    server_up = True    # condition to break the loop
print("Servver is a up and running!")

#while loop
i = 1
while i<=10:
    print(f"Checking server {i}...")
    i+=1

#While loop
j=10

while j<=20:
    if j == 25:
        print("Server 25 is up and running!")
        break
    j+=1