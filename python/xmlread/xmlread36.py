import urllib.request, urllib.parse, urllib.error
import xml.etree.ElementTree as ET

#url = input('Enter location: ')
url = 'http://py4e-data.dr-chuck.net/comments_42.xml'

# Checking whether the URL is in variable or not
if len(url) < 1 : exit()

# Opening the URL
uh = urllib.request.urlopen(url)

# Striping the file and decoding
data = uh.read().decode().rstrip("\n")

# Getting data in tree format
tree = ET.fromstring(data)

# Finding the comments in the tree
lst = tree.findall('comments/comment')

sum = 0

# Iterating the item and counting
for item in lst:

    sum += int(item.find('count').text)

# Printing the sum
print(sum)
