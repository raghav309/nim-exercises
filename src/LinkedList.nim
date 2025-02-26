type ListNodeRef* = ref object
    data: int
    next: ListNodeRef
    prev: ListNodeRef

type ListRef* = ref object
    size: uint
    front: ListNodeRef


proc ListCreate*() : ListRef = return ListRef(size: 0, front: nil)
proc ListGetSize*(list: ListRef) : uint = return list.size


proc ListPrint*(list: ListRef) =
    var listAsString: string
    var tempFront = list.front

    while tempFront != nil:
        listAsString.add($tempFront.data & " ")
        tempFront = tempFront.next
    
    echo("List: ", listAsString)


proc ListInsertAt*(list: ListRef) = return
proc ListInsertAfter*(list: ListRef) = return
proc ListInsertBefore*(list: ListRef) = return


proc ListInsertFront*(list: ListRef, data: int) =
    var newNodeRef = ListNodeRef(data: data, next: nil, prev: nil)

    if list.size != 0:
        newNodeRef.next = list.front
        list.front.prev = newNodeRef
    
    list.front = newNodeRef
    list.size += 1

proc ListInsertEnd*(list: ListRef, data: int) =
    var newNodeRef = ListNodeRef(data: data, next: nil, prev: nil)
    
    if list.size == 0:
        list.front = newNodeRef
    else:
        var tempFront = list.front
        while tempFront.next != nil:
            tempFront = tempFront.next
        
        tempFront.next = newNodeRef
        newNodeRef.prev = tempFront
    
    list.size += 1


proc ListRemoveFront*(list: ListRef) : ListNodeRef =
    var tempFront = list.front 
    
    if tempFront != nil:
        list.front = list.front.next
        list.size -= 1
    
    return tempFront


proc ListRemoveEnd*(list: ListRef) : ListNodeRef =
    if list.size == 0: return nil
    
    var tempFront = list.front
    
    if list.size == 1:
        list.front = nil
    elif list.size > 1:
        while tempFront.next != nil:
            tempFront = tempFront.next

        tempFront.prev.next = nil
        
    list.size -= 1
    return tempFront  


proc ListRemoveNode*(list: ListRef, node: ListNodeRef) : ListNodeRef =
    if list == nil or node == nil: return nil
    if node.prev == nil: return ListRemoveFront(list)
    if node.next == nil: return ListRemoveEnd(list)

    node.prev.next = node.next
    node.next.prev = node.prev
    node.prev = nil
    node.next = nil
    list.size -= 1
    return node


proc ListRemoveAt*(list: ListRef, index: uint) : ListNodeRef =
    if list == nil or index >= list.size: return nil
    if index == 0: return ListRemoveFront(list)
    if index == list.size - 1: return ListRemoveEnd(list)

    var currentIndex: uint = 1
    var currentNode = list.front.next
    while currentIndex < index:
        currentIndex += 1
        currentNode = currentNode.next
    return ListRemoveNode(list, currentNode)