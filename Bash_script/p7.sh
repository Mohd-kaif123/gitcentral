#!/bin/bash
# 1. Variable define karo taki script dynamic rahe
PROJECT_DIR="/mnt/d/bash_script/gitcentral/Bash_script/practise-project"
SERVICE_NAME="my-app"

echo "==========================================="
echo "      STARTING AUTOMATIC DEPLOYMENT        "
echo "==========================================="

# 2. Project directory ke andar jao
echo "Going to project directory...."
# || (OR operator): iska matlab hai "Agar pehla kaam FAIL ho jaye, toh dusra kaam karo".
cd $PROJECT_DIR || { echo "Error: Directory nahi mili!"; exit 1; }

#3. GIT PULL: Latest code download karo
echo "Fetching latest code from Git.."
git checkout main
git pull origin main

if [ $? -eq 0 ]; then
    echo "Git pull successfull!"
else
    echo "Error: Git pull fail ho gaya!"; exit 1;
fi 

# 4. Build: project ko build karo (jaise Node.js me dependencies install karna )
echo "Building the application..."
npm install

if [ $? -eq 0 ];
then
    echo "Build successful!"
else
    echo "Error: Build fail ho gaeya"; 
    exit 1;
fi

# 5. RESTART SERVICE: Application ko restart karo taki new code live hojae
echo "Restarting the service..."
sudo systemctl restart $SERVICE_NAME

if [ $? -eq 0 ]; then
    echo "Service restarted successfully!"
    echo "====================================="
    echo "  DEPLOYMENT COMPLETED SUCCESSFULLY  "
    echo "====================================="
else
    echo " Error: service restart nahi paeya!";
    exit 1;
fi