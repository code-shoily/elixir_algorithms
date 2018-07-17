defmodule Algo.Basic.LinkedList do
  alias __MODULE__

  @type t(a) :: %LinkedList{data: a, next: nil | t(a)}
  @type t() :: t(any())
  defstruct data: nil, next: nil

  defguard is_empty(lst) when lst == %LinkedList{data: nil, next: nil}

  @spec new() :: LinkedList.t()
  def new(), do: %LinkedList{}

  @spec one(any()) :: LinkedList.t()
  def one(data), do: %LinkedList{data: data, next: nil}

  @spec insert_first(LinkedList.t(), any()) :: LinkedList.t()
  def insert_first(lst, new_data) when is_empty(lst), do: LinkedList.one(new_data)
  def insert_first(lst, new_data), do: %LinkedList{data: new_data, next: lst}

  @spec insert_last(LinkedList.t(), any()) :: LinkedList.t()
  def insert_last(lst, new_data) when is_empty(lst), do: LinkedList.one(new_data)

  def insert_last(%LinkedList{data: data, next: nil}, new_data),
    do: %LinkedList{data: data, next: LinkedList.one(new_data)}

  def insert_last(%LinkedList{data: data, next: next}, new_data),
    do: %LinkedList{data: data, next: insert_last(next, new_data)}

  @spec contains?(LinkedList.t(), any()) :: boolean()
  def contains?(%LinkedList{data: data, next: nil}, needle) when needle != data, do: false
  def contains?(%LinkedList{data: data, next: _}, needle) when needle == data, do: true
  def contains?(%LinkedList{data: _, next: xs}, needle), do: contains?(xs, needle)

  @spec traverse(LinkedList.t()) :: List.t()
  def traverse(lst) when is_empty(lst), do: []
  def traverse(%LinkedList{data: data, next: nil}), do: [data]
  def traverse(%LinkedList{data: data, next: next}), do: [data | traverse(next)]

  @spec at(LinkedList.t(), non_neg_integer()) :: nil | any()
  def at(_lst, _n), do: raise("NOT_IMPLEMENTED")

  @spec insert_at(LinkedList.t(), non_neg_integer()) :: nil | LinkedList.t()
  def insert_at(_lst, _n), do: raise("NOT_IMPLEMENTED")

  @spec size(LinkedList.t()) :: non_neg_integer()
  def size(_lst), do: raise("NOT_IMPLEMENTED")
end
