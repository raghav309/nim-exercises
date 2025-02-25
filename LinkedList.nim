type ListNodeRef* = ref object
    data: int
    next: ListNodeRef
    prev: ListNodeRef

type ListRef* = ref object
    size: uint
    front: ListNodeRef

proc ListPrint*(list: ListRef) =
    var listAsString: string
    var tempFront = list.front

    while tempFront != nil:
        listAsString.add($tempFront.data & " ")
        tempFront = tempFront.next
    
    echo("List: ", listAsString)

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