defmodule BankUpWeb.UsersController do
  use BankUpWeb, :controller

  alias BankUpWeb.User
  def create(conn, params) do
    with {:ok, %User{} = user} <- BankUpWeb.create_user(params) do
            conn
            |> put_status(:created)
            |> render('jwt.json', %{user})
          end
  end
end
