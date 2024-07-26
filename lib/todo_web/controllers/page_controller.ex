defmodule TodoWeb.PageController do
  use TodoWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    #user = conn.assigns.current_user
    render(conn, :home, layout: false)
  end
end
