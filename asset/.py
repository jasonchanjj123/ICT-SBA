import json

file = "asset/"+input(">>")

with open(file,'r+',encoding="utf-8")as f:
    data = f.read()
    new_f = open(file[0:-4]+'.json','w',encoding="utf-8") #create json file
    table = data.split('\n')
    length = len(table)
    list_=[[[int(table[l][num+l2*9])  for num in range(9)]for l2 in range(9)]for l in range(length-1)]
    r={}
    r["test"]=list_
    json.dump(r,new_f)

