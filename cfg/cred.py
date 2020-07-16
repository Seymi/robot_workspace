import json

f=open('./cfg/credentials.json')
cred = json.load(f)
f.close()

for item in cred:
  print(item)
