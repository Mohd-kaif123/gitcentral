#------------if condition-----------#
#!/bin/bash
: '
read -p "Enter a number:" num 

if [ $((num % 2)) -eq 0 ]
then
    echo "Result : $num is Even"
else
    echo "Result: $num is odd"
fi
'

#-------------Voting Eligibility--------------#
: '
read -p "Enter your Age:" age 
if [ $age -ge 18 ]; then
    echo "you are Eligible"
else
    echo "you are not eligible"
fi
'
#-------------file exit checker-------------#
: '
if [ -d "bash"  ]; then    # -f for searchng file
    echo "file hai"       # -d for searchin folder
else
    echo "file nahi hai"
fi
'

#---------------for loop---------------#
: '
for i in {1..5}
do 
    echo "Number: $i"
done
'
#------------multiplicatin--------------#

read -p "Enter a number:" num
for i in {1..10}
do
    result=$((num * i))
    echo "$num * $i = $result"
done
