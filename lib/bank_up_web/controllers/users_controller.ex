defmodule BankUpWeb.UsersController do
  use BankUpWeb, :controller

  alias BankUp.User
  def create(conn, params) do
    with {:ok, %User{} = user} <- BankUp.create_user(params) do
            conn
            |> put_status(:created)
            |> render('jwt.json', %{message: "User created"})
          end
  end
end
