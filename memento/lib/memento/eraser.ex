defmodule Memento.Eraser do
  defstruct [:plan, :text]

  @ignored_characters [" ", "?", "!", "\n", ".", ",", ";"]

  def new(%{text: text, steps: steps}, shuffle \\ &Enum.shuffle/1) do
    %__MODULE__{
      text: text,
      plan: make_plan(text, steps, shuffle)
    }
  end

  def erase(%{text: text, plan: [step | plan]}) do
    %__MODULE__{
      text: erase_characters(text, step),
      plan: plan
    }
  end

  def erase(%__MODULE__{plan: []} = state), do: state

  defp erase_characters(text, indicies) do
    String.graphemes(text)
    |> Enum.with_index(1)
    |> Enum.map(&replace_char(&1, indicies))
    |> Enum.join()
  end

  defp replace_char({char, _}, _) when char in @ignored_characters do
    char
  end

  defp replace_char({char, index}, indicies) do
    if index in indicies do
      "_"
    else
      char
    end
  end

  defp make_plan(text, steps, shuffle) do
    len = String.length(text)
    1..len |> shuffle.() |> Enum.chunk_every(ceil(len / steps))
  end
end
