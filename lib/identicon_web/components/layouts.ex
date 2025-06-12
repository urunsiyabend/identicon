defmodule IdenticonWeb.Layouts do
  use Phoenix.Component

  def root(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en" class="h-full bg-gray-50 dark:bg-slate-900">
    <body class="h-full">
      <%= @inner_content %>
    </body>
    </html>
    """
  end
end
