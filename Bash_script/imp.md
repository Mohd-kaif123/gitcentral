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