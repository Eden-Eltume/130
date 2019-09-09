require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist_final'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert(@list.all_done)
  end

  def test_wrong_type
    assert_raises(TypeError){ @list.add(1)}
    assert_raises(TypeError){ @list.add("hi")}
  end

  def test_shovel
    todo4 = Todo.new("Work on Launch School")
    @list << todo4
    assert(@list.to_a.include?(todo4))
  end

  def test_add
    todo5 = Todo.new("Eat healthy")
    @list.add(todo5)
    assert(@list.to_a.include?(todo5))
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError){ @list.item_at(10)}
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert(@todo1.done?)
    assert_raises(IndexError){ @list.mark_done_at(15)}
  end

  def test_mark_undone_at
    @list.mark_undone_at(0)
    refute(@todo1.done?)
    assert_raises(IndexError){ @list.mark_undone_at(20)}
  end

  def test_done
    @list.done!
    done_statuses = @list.to_a.map{|todo| todo.done}

    assert_equal([true, true, true], done_statuses)
  end

  def test_remove_at
    assert_equal(@todo2, @list.remove_at(1))
    assert_equal([@todo1, @todo3], @list.to_a)
    assert_raises(IndexError){ @list.remove_at(100)}
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_one_output
    @todo3.done!

    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_list_done
    @list.mark_all_done

    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each{|todo| todo.description = "I did it"}
    did_it = ["I did it", "I did it", "I did it"]
    list_description = [@todo1.description, @todo2.description, @todo3.description]

    assert_equal(did_it, list_description)
  end

  def test_original_object
    assert_equal(@list, @list.each{|todo| nil})
  end

  def test_select
    clean_list = @list.select{|todo| todo.title.include?("Clean")}
    assert_equal([@todo2], clean_list.to_a)
  end
end