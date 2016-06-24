class Node # node of a linked list
	attr_accessor :value, :next_node

	def initialize(value)
		@value = value
		@next_node = nil
	end
end

class LinkedList
	attr_reader :head, :tail, :size

	def initialize
		clear_list
	end

	def append(value)
		new_node = Node.new(value)
		if @head.nil? # empty list
			@head = new_node
		else
			@tail.next_node = new_node
		end
		@tail = new_node
		@size += 1
	end

	def prepend(value)
		if @head.nil? # empty list, prepend == append
			append(value)
		else
			new_node = Node.new(value)
			new_node.next_node = @head
			@head = new_node
			@size += 1
		end
		
	end

	def at(index) # return node at index, or nil for out of range index
		return nil if index < 0
		return nil if index >= @size
		node = @head
		index.times {node = node.next_node}
		node
	end

	def to_s
		node = @head
		outstr = ""
		while !node.nil? do
			outstr += "( #{node.value} ) -> "
			node = node.next_node
		end
		outstr += "nil"
	end

	def pop
		if @size > 0
			if @size == 1
				popped_node = @head
				clear_list
			else
				node = @head
				while node.next_node != @tail do
					node = node.next_node
				end
				popped_node = @tail
				node.next_node = nil
				@tail = node
				@size -= 1
			end
		else
			popped_node = nil
		end
		popped_node 
	end

	def contains?(value)
		found = false
		node = @head
		while !node.nil? do
			if node.value == value
				found = true
				break
			end
			node = node.next_node
		end
		found
	end

	def find(data)
		found = false
		index = 0
		node = @head
		while !node.nil? do
			if node.value == data
				found = true
				break
			end
			index += 1
			node = node.next_node
		end
		if found
			index
		else
			nil
		end
	end

	def insert_at(index, data)
		if index == 0
			prepend(data)
		else
			node = at(index - 1)
			if !node.nil?
				new_node = Node.new(data)
				node_after = node.next_node
				node.next_node = new_node
				new_node.next_node = node_after
				@size += 1
			end
		end
	end

	def set_at(index, data)
		node = at(index)
		if !node.nil?
			node.value = data
		end
	end

	def remove_at(index)
		node = at(index)
		if !node.nil?
			if node == @head
				@head = @head.next_node
				@size -= 1
			elsif node == @tail
				pop # remove last element
			else # find preceding node
				last_node = @head
				while last_node.next_node != node do
					last_node = last_node.next_node
				end
				last_node.next_node = node.next_node
				@size -= 1
			end			
		end
	end

	private

	def clear_list
		@head = nil
		@tail = nil
		@size = 0
	end
end