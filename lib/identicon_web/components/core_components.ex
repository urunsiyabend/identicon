defmodule IdenticonWeb.CoreComponents do
  use Phoenix.Component
  import Phoenix.HTML.Form

  def button(assigns) do
    assigns = assign_new(assigns, :type, fn -> "button" end)
    ~H"""
    <button type={@type}
      class="rounded bg-blue-600 text-white px-4 py-2 hover:bg-blue-700 shadow">
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
