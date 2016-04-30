defmodule SimpleScrum.PageController do
  use SimpleScrum.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
