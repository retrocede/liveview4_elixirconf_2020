# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Memento.Repo.insert!(%Memento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Memento.Library.Passage

[
  %Passage{name: "IT crowd", text: "Did you try turning it off and on again?", steps: 1},
  %Passage{name: "Holy Grail", text: "'Tis but a flesh wound.", steps: 2},
  %Passage{name: "Lord of the Rings", text: "My precious", steps: 3},
  %Passage{name: "Die Hard", text: "Yippee ki ya", steps: 4},
  %Passage{name: "Game of Thrones", text: "Not Today", steps: 5},
  %Passage{name: "Harry Potter", text: "You're a wizard, Harry", steps: 6},
  %Passage{name: "Pirates of the Carribean", text: "Need more rum", steps: 7}
]
|> Enum.map(fn passage -> Memento.Repo.insert!(passage) end)
