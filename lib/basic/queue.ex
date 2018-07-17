defmodule Algo.Basic.Queue do
  @moduledoc """
  An implementation of a Queue
  """
  alias __MODULE__

  @type t(a) :: %Queue{data: list(a)}
  @type t :: t(any())
  @typep annotation :: %{order: String.t() | nil, end: any()}

  defstruct data: []

  @spec new() :: Queue.t()
  def new, do: %Queue{}

  @spec new([a]) :: Queue.t(a) when a: any()
  def new(xs), do: %Queue{data: xs}

  @spec enqueue(Queue.t(), any()) :: Queue.t()
  def enqueue(%Queue{data: xs}, x), do: %Queue{data: xs ++ [x]}

  @spec dequeue(Queue.t()) :: {:ok, any(), Queue.t()} | {:error, nil, %Queue{}}
  def dequeue(%Queue{data: []} = queue), do: {:error, nil, queue}
  def dequeue(%Queue{data: [x | xs]}), do: {:ok, x, %Queue{data: xs}}

  @spec peek(Queue.t()) :: {:ok, any(), Queue.t()} | {:error, nil, %Queue{}}
  def peek(%Queue{data: []} = queue), do: {:error, nil, queue}
  def peek(%Queue{data: [x | _]} = queue), do: {:ok, x, queue}

  @spec size(Queue.t()) :: non_neg_integer()
  def size(%Queue{data: xs}), do: Enum.count(xs)

  @spec empty?(Queue.t()) :: true | false
  def empty?(%Queue{data: []}), do: true
  def empty?(_), do: false

  @spec annotate(Queue.t()) :: annotation
  def annotate(%Queue{data: []}), do: %{order: nil, end: nil}

  def annotate(%Queue{data: [x | _] = data}),
    do: %{
      order:
        data
        |> Enum.join(" -> "),
      start: x,
      end: data |> Enum.reverse() |> hd()
    }
end
