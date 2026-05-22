#!/bin/bash
#------------ System Health logging ------------#

LOG_FILE="/mnt/d/bash_script/gitcentral/Bash_script/health.log"
touch -p $LOG_FILE
# 1. Date and Time
TIMESTAMP=$(date "%y-%m-%d %H-%M-%S")
# 2. CPU Usage (Idle % nikal kar use 100 se minus karenge)
: ':- -bn1 ka matlab hai "sirf 1 baar screen par print karo aur ruk jao
  :- grep "Cpu(s)": top ke poore output me se ye sirf wo line nikalta hai jahan CPU ki details (user, system, idle %) likhi hoti hain. 
  :- sed ek text editor hai. Ye is poori lambi line me se baki sabkachra hata kar sirf idle percentage ka number (jaise 85.5) nikal leta hai.
  :-  awk '{print 100 - $1"%"}': Agar system 85.5% khaali hai, toh use kitna ho raha hai? $100 - 85.5 = 14.5\%$. 
  awk ne bas $100$ me se us number ($1) ko minus kiya aur aage % laga diya. '

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

# 3. RAM Usage (Used / Total MBs)
: ':- -m ==> details (MB) me dikhata hai, 
  :- awk 'NR==2{...}': NR==2 ==> mean ( Row=2) baki lines ignore kardo sirf dusri line chaiye
  :- $3 aur $2 kya hai? ==>  Linux ke standard free -m output me: $2 = Total RAM (Column number 2)
     $3 = Used RAM (Column number 3)
  :- %.2f%% ==> mean point ke baad 2 decimals tak dikhao '

RAM_USAGE=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)", $3,$2,$3*100/$2 }')

# 4. Disk Usage (Root '/' directory ka usage)
: ' :- 'NR==2 {print ... $5}' ==> ye command ke o/p me sirf 2 lines hoti hai( header aur data).
    :- NR==2 ==> isse hum dusri line par gaye, aur $5 ka matlab hai 5th Column. df -h ke 5th column me hamesha Use% likha hota hai. To ye seedhe wahi utha leta hai.
DISK_USAGE=$(df -h / | awk 'NR==2 {print "Disk Usage: " $5}')

# sabka ek sath format karke log file me append karo
echo "$TIMESTAMP | CPU: $CPU_USAGE | $RAM_USAGE | $DISK_USAGE" >> "$LOG_FILE"



