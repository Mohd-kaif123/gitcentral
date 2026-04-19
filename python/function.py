def great(name):
    return print(f"Welcome {name}")
great("mohd kaif")

#...................................
def check_memory(usage):
    return print("High memory usage")
check_memory(80)

#......................................
def check_memory(usage):
    if usage > 70:     
        return print("High memory usage")
    else:
        return print("Memory is normal")
check_memory(60)
    