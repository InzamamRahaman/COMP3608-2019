
import collections

INPUT_FILEPATH = 'edgelist.txt'
DELIMITER = ','

G = collections.defaultdict(dict)

with open(INPUT_FILEPATH, 'r') as fp:
    for line in fp:
        contents = line.split(DELIMITER)
        cost = 1
        u = (contents[0])
        v = (contents[1])
        if len(contents) > 2:
            cost = float(contents[2])
        G[u][v] = cost

print(G)



