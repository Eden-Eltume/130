class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo_item)
    if todo_item.instance_of? Todo
      @todos << todo_item
    else
      puts "Can only add Todo objects"
    end
  end

  def <<
    add()
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def done?
    @todos.all?{|todo| todo.done?}
  end

  def to_a
    @todos.clone
  end

  def item_at(location)
    idx = location - 1
    @todos.fetch(idx)
  end

  def mark_done_at(location)
    item_at(location).done = true
  end

  def mark_undone_at(location)
    item_at(location).done = false
  end

  def done!
    @todos.map{|item| item.done = true}
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(location)
    item = item_at(location)
    @todos.delete(item)
  end

  def to_s
    text = "--- #{title} ---\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----


# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"


# <<
# same behavior as add
=begin
# ---- Interrogating the list -----

# size
list.size                       # returns 3

# first
list.first                      # returns todo1, which is the first item in the list

# last
list.last                       # returns todo3, which is the last item in the list

#to_a
list.to_a                      # returns an array of all items in the list

#done?
list.done?                     # returns true if all todos in the list are done, otherwise false                         


# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
list.item_at(1)                 # returns 2nd item in list (zero based index)
#list.item_at(100)               # raises IndexError


# ---- Marking items in the list -----


# mark_done_at
#list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
#list.mark_done_at(100)          # raises IndexError

# mark_undone_at
#list.mark_undone_at             # raises ArgumentError
 list.mark_undone_at(1)          # marks the 2nd item as not done,
#list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done

# ---- Deleting from the list -----

# shift
list.shift                      # removes and returns the first item in list

# pop
list.pop                        # removes and returns the last item in list

# remove_at
#list.remove_at                  # raises ArgumentError
list.remove_at(1)               # removes and returns the 2nd item
#list.remove_at(100)             # raises IndexError


# ---- Outputting the list -----
=end
to_s

list.mark_done_at(2)

puts list.to_s

                      # returns string representation of the list
# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym