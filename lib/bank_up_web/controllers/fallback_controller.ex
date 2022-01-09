defmodule BankUpWeb.FallbackController do
  use BankUpWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(BankUpWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
