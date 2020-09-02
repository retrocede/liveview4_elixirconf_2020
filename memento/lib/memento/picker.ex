defmodule Memento.Picker do
  alias Memento.Library

  defdelegate first, to: Library
  defdelegate next(id), to: Library
  defdelegate previous(id), to: Library
  defdelegate passage(id), to: Library, as: :get_passage!
end
