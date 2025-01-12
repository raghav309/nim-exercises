type NodeRef = ref object
  val:  int
  next: NodeRef
  prev: NodeRef

type DLLRef = ref object
    length: int
    head:   NodeRef

proc insert_node(list: DLLRef, value: int) =
    var temp_head = list.head
    let new_node_ref = NodeRef(val: value, next: nil, prev: nil)

    if list.length == 0:
        list.head = new_node_ref
    else:
        while temp_head.next != nil:
            temp_head = temp_head.next

        new_node_ref.prev = temp_head
        temp_head.next = new_node_ref
    
    list.length += 1

proc print_dll(list: DLLRef) =
    if list.length < 0: return

    var tempHead: NodeRef = list.head
    while tempHead != nil:
        echo(tempHead.val)
        tempHead = tempHead.next


var my_dll = DLLRef(length: 0, head: nil)

echo("length before insertions: ", my_dll.length)
for i in countup(1, 9):
    insert_node(my_dll, i)
echo("length before insertions: ", my_dll.length)

print_dll(my_dll)