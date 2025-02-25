type ListNodeRef = ref object
  val:  int
  next: ListNodeRef
  prev: ListNodeRef

type ListRef = ref object
    length: uint
    head:   ListNodeRef

proc insert_head(list: ListRef, value: int) =
    let new_node_ref = ListNodeRef(val: value, next: list.head, prev: nil)

    if list.head != nil: 
        list.head.prev = new_node_ref
    
    list.head = new_node_ref
    list.length += 1

proc insert_node(list: ListRef, value: int) =
    var temp_head = list.head
    let new_node_ref = ListNodeRef(val: value, next: nil, prev: nil)

    if list.length == 0:
        list.head = new_node_ref
    else:
        while temp_head.next != nil:
            temp_head = temp_head.next

        new_node_ref.prev = temp_head
        temp_head.next = new_node_ref
    
    list.length += 1

proc print_dll(list: ListRef) =
    if list.length < 0: return

    var tempHead: ListNodeRef = list.head
    while tempHead != nil:
        echo(tempHead.val)
        tempHead = tempHead.next


var my_dll = ListRef(length: 0, head: nil)

echo("length before insertions: ", my_dll.length)
for i in countup(1, 9):
    insert_node(my_dll, i)
echo("length before insertions: ", my_dll.length)

print_dll(my_dll)