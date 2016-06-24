# Linked List

Odin Project : Ruby Programming : Data Structures

This code implements a linked list in Ruby.

Method #insert_at includes a data parameter for the new node, as well as the index.  The addition of the new node is such that the new node will have the given index, that is, it is added before the current node at index.

Method #set_at(index,data) sets the node at index to have the given data - it overwrites the previous data value

Index values are counted from 0

The list includes @size as an instance variable.  This is because size checks are needed for all the methods
with an index parameter, and finding the size by scanning the list each time seemed to me to be too
expensive.  The downside is that I have to be careful about incrementing and decrementing @size for any method
that changes the number of elements in the list (#append, #prepend, #pop, #insert_at, #remove_at)

For several methods (e.g. #pop, #insert_at), you need to find a preceding node.  I just use simple linear search, but
adding a reverse link to Node, pointing to the previous node if any, would help in these cases.