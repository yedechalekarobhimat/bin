def A_star(strt_node, goal_node):
    v = [strt_node]
    q = [strt_node]
    for vertex in graph[strt_node]:
        f_n = vertex[1] + h(vertex[0])
        # print(f'{vertex} -- {f_n}')

    while len(q):
        vertex = q.pop(0)
        for neighs in graph[vertex]:
            if neighs[0] not in v:
                print(neighs)
                q.append(neighs[0])
                v.append(neighs[0])



# Input data
def h(n):
    H_dist = {
        'S': 5,
        'A': 3,
        'B': 4,
        'C': 2,
        'D': 6,
        'G': 0,
    }

    return H_dist[n]

graph = {
    'S': [('A', 1), ('G', 10)],
    'A': [('B', 2), ('C', 1)],
    'B': [('D', 2)],
    'C': [('D', 3), ('G', 4)],
    'D': [('G', 2)],
    'G': [],
}

A_star('S', 'G')

print('Coming SOON...')