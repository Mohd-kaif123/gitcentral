declare -A user_info
user_info["name"]="kaif"
user_info["age"]=30
user_info["city"]="mumbai"

for key in "${!user_info[@]}"; do
    echo "$key: ${user_info[$key]}"
done