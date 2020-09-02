defmodule Memento.Library.Passage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "passages" do
    field :name, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(passage, attrs) do
    passage
    |> cast(attrs, [:name, :text])
    |> validate_required([:name, :text])
  end
end
