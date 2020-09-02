defmodule MementoWeb.EraserLive do
  use MementoWeb, :live_view
  alias Memento.Library
  alias Memento.Eraser

  def mount(%{"id" => id}, _session, socket) do
    passage = Library.get_passage!(id)

    {
      :ok,
      assign(
        socket,
        eraser: Eraser.new(passage)
      )
    }
  end

  def render(assigns) do
    ~L"""
    <h1>Memorize This:</h1>
    <pre><%= @eraser.text %></pre>
    <button phx-click="handle-erase">Erase</button>
    """
  end

  def handle_event("handle-erase", _meta, socket) do
    {:noreply, erase(socket)}
  end

  def erase(socket) do
    assign(
      socket,
      eraser: Eraser.erase(socket.assigns.eraser)
    )
  end
end
