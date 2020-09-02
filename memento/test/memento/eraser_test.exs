defmodule Memento.EraserTest do
  use ExUnit.Case

  alias Memento.Eraser

  @passage %{
    text: "quote ",
    steps: 3
  }

  describe "Eraser" do
    test "creates a plan" do
      assert %Eraser{
               text: _,
               plan: [[1, 2], [3, 4], [5, 6]]
             } = Eraser.new(@passage, &Function.identity/1)
    end

    test "erases characters by replacing with _" do
      assert %Eraser{
               text: "__ote ",
               plan: [[3, 4], [5, 6]]
             } = Eraser.new(@passage, &Function.identity/1) |> Eraser.erase()
    end

    test "ignores spaces" do
      assert %Eraser{
               text: "_____ ",
               plan: []
             } =
               Eraser.new(@passage, &Function.identity/1)
               |> Eraser.erase()
               |> Eraser.erase()
               |> Eraser.erase()
    end

    test "ignores punctuation" do
      assert %Eraser{
               text: "\n!.,;?",
               plan: []
             } =
               Eraser.new(%{@passage | text: "\n!.,;?"}, &Function.identity/1)
               |> Eraser.erase()
               |> Eraser.erase()
               |> Eraser.erase()
    end

  end
end
