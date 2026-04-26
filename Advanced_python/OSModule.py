import os
import shutil

path="D:\\" if os.name =="nt" else "/mnt/d"

total,used,free=shutil.disk_usage(path)

def to_gb(bytes_values):
    return bytes_values // (1024**3)

print(f"OS Name: ${os.name}")
print(f"Checking disk usage for:{path}")
print(f"Total:",to_gb(total),"GB")
print(f"Used:", to_gb(used),"GB")
print(f"Free:",to_gb(free),"GB")