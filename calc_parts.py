"""
"""

import sys

size = int(sys.argv[1])
n_parts = int(sys.argv[2])

chunksize = size // n_parts
left = size % n_parts 

for i in range(n_parts):
    start = i * chunksize 
    end = start + chunksize - 1 
    if i == n_parts - 1:
        end += left 
    print(start, end)
     

