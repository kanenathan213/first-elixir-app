defmodule FirstElixir.PageController do
  use FirstElixir.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
