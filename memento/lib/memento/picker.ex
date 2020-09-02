defmodule Memento.Picker do
  @picker_ids [:it, :grail, :rings, :die_hard, :got, :potter, :pirates]

  def first() do
    Enum.at(@picker_ids, 0)
  end

  def next(id) do
    # id = :rings
    @picker_ids
    # [:rings, :die_hard, ...]
    |> Enum.drop_while(fn x -> x != id end)
    # [:die_hard, ...]
    |> Enum.drop(1)
    |> List.first()
    |> Kernel.||(:it)
  end

  def previous(id) do
    # id = :rings
    @picker_ids
    |> Enum.take_while(fn x -> x != id end)
    |> List.last()
    |> Kernel.||(:pirates)
  end

  def passage(:it) do
    %{name: "IT crowd", text: "Did you try turning it off and on again?", steps: 1}
  end

  def passage(:grail) do
    %{name: "Holy Grail", text: "'Tis but a flesh wound.", steps: 2}
  end

  def passage(:rings) do
    %{name: "Lord of the Rings", text: "My precious", steps: 3}
  end

  def passage(:die_hard) do
    %{name: "Die Hard", text: "Yippee ki ya", steps: 4}
  end

  def passage(:got) do
    %{name: "Game of Thrones", text: "Not Today", steps: 5}
  end

  def passage(:potter) do
    %{name: "Harry Potter", text: "You're a wizard, Harry", steps: 6}
  end

  def passage(:pirates) do
    %{name: "Pirates of the Carribean", text: "Need more rum", steps: 7}
  end
end
