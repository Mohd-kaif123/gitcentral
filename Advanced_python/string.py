message= " Hello Devops World "

#1. Remove leading and Trailing spaces
print("1. strip():",message.strip())

#2. convert to uppercase
print("2. upper():",message.upper())

#3. convert to lowercase
print("3. lower():",message.lower())

#4. Replace the word
print("4. replace():",message.replace("Devops","python"))

#5. check if string start with a word
print("5. startwith('Hello'):",message.strip().startwith("Hello"))

#6. check if string start with a word
print("6. endwith('World'):",message.strip().endwith("World"))

#7. find the position of substring
print("7. find('Devops'):",message.find("Devops"))

#8. count how many times a word appears
print("8. count('o'):",message.count('o'))
print("8. count('1'):",message.count('1'))

#9. split the string into a list(array)
words=message.strip().split(" ")
print("9. split():",words)

#10. join the list back into a list(array)
print("q0. join():","-".join(words))

#11. check all character are alphabets
print("11. isalpha():","Hello123".isalpha())
print("11. isalpha():","Hello".isalpha())

#12. check that string contains only digits
print("12. isdigit():","1234567".isdigit())
print("12. isdigit():","123457dfsgs".isdigit())