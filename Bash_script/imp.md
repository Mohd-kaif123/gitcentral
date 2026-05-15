1. Code ko "Ratto" mat, "Steps" mein tod do
Jab aap bada code dekhte hain, toh wo mushkil lagta hai. Lekin agar aap dhyan se dekhein, toh har script ka ek standard Pattern hota hai:

Variables: Sabse upar saari details (Source, Path, Date) ek baar likh do.

Checks: Kaam shuru karne se pehle check karo (Kya folder hai? Kya user root hai?).

Action: Asli kaam wali command (tar, cp, mv).

Message: User ko batao ki kaam ho gaya.

2. Basic Rules of Thumb (Yaad rakhne ke liye)
Variable Use: Jab variable banao toh seedha naam (folder="data"), jab use karo toh dollar ($folder).

Spaces in if: Hamesha yaad rakho if [ space_yaha_hai ]. Ye Bash ka sabse bada rule hai.

Quotes (" "): Jab bhi kisi file path ya variable mein space hone ka chance ho, use hamesha quotes mein rakho (e.g., "$backup_dir").

################################################################################

1. Kab "Variable" use karein aur kab "Argument"?
Variable: Jab koi information script ke andar hi fix ho (jaise backup ka folder path).

Argument ($1, $2): Jab aap chahte ho ki script chalate waqt hi user detail de de (e.g., ./script.sh filename.txt). Ye professional tools mein zyada use hota hai.

User Input (read): Jab script chalne ke baad aapko user se "baat" karni ho ya koi secret (password) mangna ho.

################################################################################

2. "If" vs "Loop" (Decision vs Repetition)
Aapko decide karna hai ki kaam ek baar karna hai ya baar-baar:

Situation                       Kya use karein?                 Example
1) Check karna hai (Yes/No)     if...else                   Kya file exist karti hai?
Multiple conditions 
2) check karni hain             if...elif...else            Agar file hai toh padho, agar directory hai toh andar jao, warna error do.
3) Ginti (Count) pata hai       for loop                    1 se 10 tak files banao.
Ginti nahi pata, bas 
4) condition jab tak sahi ho    while loop                  Jab tak user sahi password na dale, puchte raho.