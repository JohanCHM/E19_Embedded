#!/usr/bin/python

import argparse             # for manipulaton of parameters
import sys

parser = argparse.ArgumentParser(description='Convert an Image into a Binary file')
parser.add_argument("source.*",  type=str, help="Source file to covert into Binary")
parser.add_argument("destination.bin", type=str, help="Destination file into wich write the data")
args = parser.parse_args()

# if '-h' in sys.argv:
#     print ("Usage:", sys.argv[0], "<source-img.*> <dest-bin.bin>")
#     sys.exit()

print(f'converting {sys.argv[1]} to {sys.argv[2]}')

img = open(sys.argv[1],'rb')
bitdest = open(sys.argv[2],'wb')
bitdest.write(img.read())
bitdest.close()
img.close()
print ('Conversion completed. Image transformed to Binary')