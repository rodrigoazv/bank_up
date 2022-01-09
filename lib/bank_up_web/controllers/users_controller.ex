defmodule BankUpWeb.UserController do
  use BankUpWeb, :controller

  alias BankUp.User

  def create(conn, params) do
    with {:ok, %User{} = user} <- BankUp.create_user(params) do
      conn
        |> put_status(:created)
        |> render("create.json", %{user: user})
    end
  end

  def index(conn, _) do
    conn
      |> put_status(:created)
      |> render("jwt.json", %{message: "Ok!"})
  end
end
