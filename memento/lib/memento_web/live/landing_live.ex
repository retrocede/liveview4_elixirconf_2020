defmodule MementoWeb.LandingLive do
  use MementoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, passage: %{name: "IT crowd", text: "Did you try turning it off and on again?", steps: 3})}
  end
end