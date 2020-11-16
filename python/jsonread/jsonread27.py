import json
import urllib2

url = 'https://jsonplaceholder.typicode.com/posts/1/comments'

# Uncomment this to have a dynamic url on cmdline
#url = input('Enter URL: ')

# Check whether the url is having a value
if len(url) < 1 : exit()

# Opening the url
uh = urllib2.urlopen(url)

# Reading the data from json
data = uh.read()

# Decoding the data into an array
js = json.loads(data.decode())

# We can do anything you want to do with this array
# I am printing the array which is given in the url.
for x in js :
    print(x['email'])
