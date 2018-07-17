defmodule Algo.Basic.Stack do
  @moduledoc """
  An implementation of a Stack
  """
  alias __MODULE__

  @type t(a) :: %Stack{data: list(a)}
  @type t :: t(any())
  @typep annotation :: %{order: String.t() | nil, end: any()}

  defstruct data: []

  @spec new() :: Stack.t()
  def new, do: %Stack{}

  @spec new([a]) :: Stack.t(a) when a: any()
  def new(xs), do: %Stack{data: Enum.reverse(xs)}

  @spec push(Stack.t(), any()) :: Stack.t()
  def push(%Stack{data: xs}, x), do: %Stack{data: [x | xs]}

  @spec pop(Stack.t()) :: {:ok, any(), Stack.t()} | {:error, nil, %Stack{}}
  def pop(%Stack{data: []} = stack), do: {:error, nil, stack}
  def pop(%Stack{data: [x | xs]}), do: {:ok, x, %Stack{data: xs}}

  @spec peek(Stack.t()) :: {:ok, any(), Stack.t()} | {:error, nil, %Stack{}}
  def peek(%Stack{data: []} = stack), do: {:error, nil, stack}
  def peek(%Stack{data: [x | _]} = stack), do: {:ok, x, stack}

  @spec size(Stack.t()) :: non_neg_integer()
  def size(%Stack{data: xs}), do: Enum.count(xs)

  @spec empty?(Stack.t()) :: boolean()
  def empty?(%Stack{data: []}), do: true
  def empty?(_), do: false

  @spec annotate(Stack.t()) :: annotation
  def annotate(%Stack{data: []}), do: %{order: nil, end: nil}

  def annotate(%Stack{data: [x | _] = data}),
    do: %{
      order:
        data
        |> Enum.reverse()
        |> Enum.join(" -> "),
      end: x
    }
end
