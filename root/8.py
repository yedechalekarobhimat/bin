# 8. DFS and BFS
class Graph:
    def __init__(self, gdict):
        if gdict is None: gdict = {}
        self.gdict = gdict

def bfs(graph, q, visited):
    if not q: return

    v = q.pop(0)
    print(v, end=' ')
    for vertex in graph[v]:
        if vertex not in visited:
            visited.append(vertex)
            q.append(vertex)
    
    bfs(graph, q, visited)

def dfs(graph, s, visited):
    if not s: return
    
    v = s.pop()
    print(v, end=' ')
    for vertex in graph[v]:
        if vertex not in visited:
            visited.append(vertex)
            s.append(vertex)
    
    dfs(graph, s, visited)

def dfs_2(graph, vertex, path=[]):
    path += [vertex]

    for neighbor in graph[vertex]:
        if neighbor not in path:
            path = dfs_2(graph, neighbor, path)

    return path

if __name__ == '__main__':
    graph = {
        'a': ['c', 'd'],
        'b': ['d', 'e'],
        'c': ['a'],
        'd': ['b', 'e'],
        'e': ['b', 'd']
    }

    gr = Graph(graph)
    print(gr.gdict)

    # BFS
    q = ['a']
    visited = ['a']
    bfs(gr.gdict, q, visited)
    print(" ")

    # DFS
    q = ['a']
    visited = ['a']
    dfs(gr.gdict, q, visited)
    print(" ")

    # DFS 2
    path = dfs_2(gr.gdict, 'a')
    print(" ".join(path))

# graph = {
#     'a': ['b', 'c'],
#     'b': ['a', 'd', 'e'],
#     'c': ['a', 'e'],
#     'd': ['b', 'e', 'f'],
#     'e': ['d', 'f'],
#     'f': ['d', 'e'],
# }