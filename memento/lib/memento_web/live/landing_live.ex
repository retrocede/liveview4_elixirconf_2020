defmodule MementoWeb.LandingLive do
  use MementoWeb, :live_view
  alias Memento.Picker
  alias Memento.Eraser

  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
        socket,
        passage_id: Picker.first()
      )
      |> load_passage
    }
  end

  def render(assigns) do
    ~L"""
    <h1>Memento</h1>

    <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
      <button phx-click="prev-click">Previous</button>
      <h2><%= @passage.name %></h2>
      <button phx-click="next-click">Next</button>
    </div>

    <div style="display: flex; justify-content: space-around; align-items: center; width: 100%;">
      <p style="font-size: 18; font-weight: 600;">
        "<%= @passage.text %>"
      </p>
    </div>

    <div style="display: flex; justify-content: space-around; align-items: center; width: 100%;">
      <button phx-click="erase-click">Erase</button>
    </div>

    """
  end

  defp load_passage(socket) do
    passage = Picker.passage(socket.assigns.passage_id)
    plan = Eraser.new(passage)

    assign(socket,
      passage: %{
        name: passage.name,
        text: plan.text,
        steps: passage.steps,
        plan: plan.plan
      }
    )
  end

  defp erase_passage(socket) do
    erased =
      socket.assigns.passage
      |> Eraser.erase()

    assign(socket, passage: %{socket.assigns.passage | text: erased.text, plan: erased.plan})
  end

  defp previous_id(socket) do
    assign(socket, passage_id: Picker.previous(socket.assigns.passage_id))
  end

  defp next_id(socket) do
    assign(socket, passage_id: Picker.next(socket.assigns.passage_id))
  end

  def handle_event("prev-click", _meta, socket) do
    {
      :noreply,
      socket
      |> previous_id
      |> load_passage
    }
  end

  def handle_event("next-click", _meta, socket) do
    {
      :noreply,
      socket
      |> next_id
      |> load_passage
    }
  end

  def handle_event("erase-click", _meta, socket) do
    {
      :noreply,
      socket |> erase_passage
    }
  end
end
