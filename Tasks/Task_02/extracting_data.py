
import requests

url = "https://commerce-app.gov.in/eidb/Icntcom.asp"

file_name = "Data.csv"
u = requests.get(url)

file_size = int(u.headers['content-length'])
#print "Downloading: %s Bytes: %s" % (file_name, file_size)

with open(file_name, 'wb') as f:
    for chunk in u.iter_content(chunk_size=1024): 
        if chunk: # filter out keep-alive new chunks
            f.write(chunk)
            f.flush()
f.close()