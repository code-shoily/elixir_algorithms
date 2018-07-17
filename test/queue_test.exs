defmodule AlgoTest.Queue do
  use ExUnit.Case
  alias Algo.Basic.Queue

  test "Create a new empty Queue" do
    assert Queue.new() == %Queue{data: []}
  end

  test "Create a new non-empty Queue" do
    assert Queue.new([80, 90, 100]) == %Queue{data: [80, 90, 100]}
  end

  test "Push a value into a queue" do
    queue =
      Queue.new()
      |> Queue.enqueue(80)
      |> Queue.enqueue(90)
      |> Queue.enqueue(100)

    assert queue == %Queue{data: [80, 90, 100]}
  end

  test "Try dequeueing or peeking from empty queue" do
    empty_queue = Queue.new()

    assert Queue.dequeue(empty_queue) == {:error, nil, empty_queue}
    assert Queue.peek(empty_queue) == {:error, nil, empty_queue}
  end

  test "Dequeuing a non-empty queue" do
    queue_1 = Queue.new([1])
    queue_many = Queue.new() |> Queue.enqueue(2) |> Queue.enqueue(3) |> Queue.enqueue(4)

    assert Queue.dequeue(queue_1) == {:ok, 1, %Queue{data: []}}
    assert Queue.dequeue(queue_many) == {:ok, 2, %Queue{data: [3, 4]}}
  end

  test "Peeking into a non-empty queue" do
    queue_1 = Queue.new([1])
    queue_many = Queue.new() |> Queue.enqueue(2) |> Queue.enqueue(3) |> Queue.enqueue(4)

    assert Queue.peek(queue_1) == {:ok, 1, queue_1}
    assert Queue.peek(queue_many) == {:ok, 2, queue_many}
  end

  test "Display the queue size" do
    assert Queue.size(Queue.new()) == 0
    assert Queue.size(Queue.new([80, 90, 100])) == 3
  end

  test "Check for emptiness" do
    assert Queue.empty?(Queue.new())
    refute Queue.empty?(Queue.new([1000, 1001]))
  end

  test "Annotate a queue" do
    empty_queue = Queue.new()
    queue = empty_queue |> Queue.enqueue("A") |> Queue.enqueue("B") |> Queue.enqueue("C")

    assert Queue.annotate(empty_queue) == %{order: nil, end: nil}
    assert Queue.annotate(queue) == %{order: "A -> B -> C", start: "A", end: "C"}
  end
end
