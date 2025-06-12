defmodule IdenticonWeb.Layouts do
  use Phoenix.Component
  import Phoenix.Controller, only: [get_csrf_token: 0]

  def root(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en" class="h-full bg-gray-50 dark:bg-slate-900">
    <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <meta name="csrf-token" content={get_csrf_token()} />
      <link phx-track-static rel="stylesheet" href="/assets/app.css" />
      <script defer phx-track-static type="text/javascript" src="/assets/app.js"></script>
    </head>
    <body class="h-full">
      <%= @inner_content %>
    </body>
    </html>
    """
  end
end
