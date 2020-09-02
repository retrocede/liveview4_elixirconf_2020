defmodule Memento.Picker do
  alias Memento.Library

  def first() do
    Library.first()
  end

  def next(id) do
    Library.next(id)
  end

  def previous(id) do
    Library.previous(id)
  end

  def passage(id) do
    Library.get_passage!(id)
  end
end
