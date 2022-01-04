defmodule BankUpWeb.PageController do
  use BankUpWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
