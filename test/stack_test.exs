defmodule AlgoTest.Stack do
  use ExUnit.Case
  alias Algo.Basic.Stack

  test "Create a new empty Stack" do
    assert Stack.new() == %Stack{data: []}
  end

  test "Create a new non-empty Stack" do
    assert Stack.new([80, 90, 100]) == %Stack{data: [80, 90, 100]}
  end

  test "Push a value into a stack" do
    stack =
      Stack.new()
      |> Stack.push(80)
      |> Stack.push(90)
      |> Stack.push(100)

    assert stack == %Stack{data: [100, 90, 80]}
  end

  test "Try popping or peeking from empty stack" do
    empty_stack = Stack.new()

    assert Stack.pop(empty_stack) == {:error, nil, empty_stack}
    assert Stack.peek(empty_stack) == {:error, nil, empty_stack}
  end

  test "Popping a non-empty stack" do
    stack_1 = Stack.new([1])
    stack_many = Stack.new() |> Stack.push(2) |> Stack.push(3) |> Stack.push(4)

    assert Stack.pop(stack_1) == {:ok, 1, %Stack{data: []}}
    assert Stack.pop(stack_many) == {:ok, 4, %Stack{data: [3, 2]}}
  end

  test "Peeking into a non-empty stack" do
    stack_1 = Stack.new([1])
    stack_many = Stack.new() |> Stack.push(2) |> Stack.push(3) |> Stack.push(4)

    assert Stack.peek(stack_1) == {:ok, 1, stack_1}
    assert Stack.peek(stack_many) == {:ok, 4, stack_many}
  end

  test "Display the stack size" do
    assert Stack.size(Stack.new()) == 0
    assert Stack.size(Stack.new([80, 90, 100])) == 3
  end

  test "Check for emptiness" do
    assert Stack.empty?(Stack.new())
    refute Stack.empty?(Stack.new([1000, 1001]))
  end

  test "Annotate a stack" do
    stack = Stack.new() |> Stack.push("A") |> Stack.push("B") |> Stack.push("C")

    assert Stack.annotate(stack) == %{order: "A -> B -> C", upnext: "C"}
  end
end
