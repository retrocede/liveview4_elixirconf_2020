defmodule MementoWeb.LandingLive do
  use MementoWeb, :live_view

  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
        socket,
        passage_id: :it
      )
      |> load_passage
    }
  end

  def render(assigns) do
    ~L"""
    <h1>Welcome!</h1>

    <h2>
      <button phx-click="prev-click">Previous</button>
      <%= @passage.name %>
      <button phx-click="next-click">Next</button>
    </h2>
    """
  end

  defp load_passage(socket) do
    assign(socket, passage: passage(socket.assigns.passage_id))
  end

  defp passage(:it) do
    %{name: "IT crowd", text: "Did you try turning it off and on again?", steps: 3}
  end

  defp passage(:grail) do
    %{name: "Holy Grail", text: "'Tis but a flesh wound.", steps: 4}
  end

  defp previous_id(socket) do
    assign(socket, passage_id: :grail)
  end

  defp next_id(socket) do
    assign(socket, passage_id: :it)
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
end
