import json

file=input(">>")

with open(file,'rb')as f:
    data = f.read()
    open(file[0:-4]+'.json','w') #create json file
    length = len(data.split('\n'))
    for l in range(length):
        