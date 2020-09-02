defmodule MementoWeb.PassageLive.Show do
  use MementoWeb, :live_view

  alias Memento.Library

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:passage, Library.get_passage!(id))}
  end

  defp page_title(:show), do: "Show Passage"
  defp page_title(:edit), do: "Edit Passage"
end
