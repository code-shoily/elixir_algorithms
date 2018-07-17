defmodule AlgoTest.LinkedList do
  use ExUnit.Case
  alias Algo.Basic.LinkedList

  setup do
    [
      list_sample: %LinkedList{
        data: 10,
        next: %LinkedList{
          data: 20,
          next: %LinkedList{data: 30, next: %LinkedList{data: 40, next: nil}}
        }
      }
    ]
  end

  test "Create an empty list" do
    assert LinkedList.new() == %LinkedList{data: nil, next: nil}
  end

  test "Create a list with one element" do
    assert LinkedList.one(10) == %LinkedList{data: 10, next: nil}
  end

  test "Insert a value on the head of the list", context do
    new_list = %LinkedList{
      data: 0,
      next: %LinkedList{
        data: 10,
        next: %LinkedList{
          data: 20,
          next: %LinkedList{data: 30, next: %LinkedList{data: 40, next: nil}}
        }
      }
    }

    assert LinkedList.insert_first(LinkedList.new(), 10) == %LinkedList{
             data: 10,
             next: nil
           }

    assert LinkedList.insert_first(LinkedList.one(10), 20) == %LinkedList{
             data: 20,
             next: %LinkedList{data: 10, next: nil}
           }

    assert LinkedList.insert_first(context[:list_sample], 0) == new_list
  end

  test "Insert a value at the end of the list", context do
    new_list = %LinkedList{
      data: 10,
      next: %LinkedList{
        data: 20,
        next: %LinkedList{
          data: 30,
          next: %LinkedList{data: 40, next: %LinkedList{data: 50, next: nil}}
        }
      }
    }

    assert LinkedList.insert_last(LinkedList.new(), 10) == %LinkedList{
             data: 10,
             next: nil
           }

    assert LinkedList.insert_last(LinkedList.one(10), 20) == %LinkedList{
             data: 10,
             next: %LinkedList{data: 20, next: nil}
           }

    assert LinkedList.insert_last(context[:list_sample], 50) == new_list
  end

  test "Traverse a list", context do
    assert LinkedList.traverse(LinkedList.new()) == []
    assert LinkedList.traverse(LinkedList.one(10)) == [10]
    assert LinkedList.traverse(context[:list_sample]) == [10, 20, 30, 40]
  end

  test "Find a needle in the List", context do
    refute LinkedList.contains?(LinkedList.new(), 10)
    assert LinkedList.contains?(LinkedList.one(10), 10)
    refute LinkedList.contains?(LinkedList.one(10), 20)
    assert LinkedList.contains?(context[:list_sample], 20)
    refute LinkedList.contains?(context[:list_sample], 50)
  end

  test "Compute the size of the list", context do
    assert LinkedList.size(LinkedList.new()) == 0
    assert LinkedList.size(LinkedList.one(10)) == 1
    assert LinkedList.size(context[:list_sample]) == 4
  end

  test "Find value at an index from the list", context do
    assert LinkedList.at(LinkedList.new(), 0) == nil
    assert LinkedList.at(LinkedList.one(10), 0) == 10
    assert LinkedList.at(LinkedList.one(10), 2) == nil
    assert LinkedList.at(context[:list_sample], 2) == 20
  end

  test "Insert value at an index into the list", context do
    new_list = %LinkedList{
      data: 10,
      next: %LinkedList{
        data: 20,
        next: %LinkedList{
          data: 25,
          next: %LinkedList{data: 30, next: %LinkedList{data: 40, next: nil}}
        }
      }
    }

    assert LinkedList.insert_at(LinkedList.new(), 0, 10) == LinkedList.new(10)
    assert LinkedList.insert_at(LinkedList.one(10), 10, 20) == nil
    assert LinkedList.insert_at(context[:list_sample], 2, 25) == new_list
  end
end
