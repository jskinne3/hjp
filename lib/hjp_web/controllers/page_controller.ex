defmodule HjpWeb.PageController do
  use HjpWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
