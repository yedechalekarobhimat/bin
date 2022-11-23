def selection_sort(arr):
    for i in range(len(arr)):
        min_id = i
        for j in range(i+1, len(arr)):
            if arr[j] < arr[min_id]:
                min_id = j
        arr[i], arr[min_id] = arr[min_id], arr[i]
    
    return arr



if __name__ == '__main__':
    arr = [20, 12, 10, 15, 2, -3, -10]
    arr = selection_sort(arr)
    print(arr)