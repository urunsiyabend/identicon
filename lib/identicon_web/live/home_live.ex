defmodule IdenticonWeb.HomeLive do
  use IdenticonWeb, :live_view
  alias Phoenix.LiveView.JS

  def mount(params, _session, socket) do
    username = params["u"]
    {:ok, assign_svg(socket, username)}
  end

  def handle_event("generate", %{"username" => username}, socket) do
    {:noreply,
      socket
      |> assign_svg(username)
      |> push_patch(to: "/?u=#{username}")}
  end

  defp assign_svg(socket, nil), do: assign(socket, username: nil, svg: nil)
  defp assign_svg(socket, ""), do: assign(socket, username: nil, svg: nil)
  defp assign_svg(socket, username) do
    assign(socket, username: username, svg: Identicon.image_svg(username))
  end

  def render(assigns) do
    ~H"""
    <div class="min-h-screen flex flex-col items-center justify-center p-4">
      <.form for={:identicon} phx-submit="generate" class="space-x-2 flex">
        <input type="text" name="username" value={@username || ""} class="border rounded p-2" placeholder="username" />
        <.button>Generate</.button>
      </.form>

      <%= if @svg do %>
        <div class="mt-6 flex flex-col items-center space-y-4">
          <img src={"/identicon/#{@username}"} class="w-64 h-64" />
          <.button>
            <a href={"/identicon/#{@username}?download=1"}>Download SVG</a>
          </.button>
        </div>
      <% end %>
    </div>
    """
  end
end
