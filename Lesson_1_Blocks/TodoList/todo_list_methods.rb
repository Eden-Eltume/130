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

  def <<(item)
    add(item)
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

  def each
    @todos.each{|todo| yield(todo)}
    self
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end