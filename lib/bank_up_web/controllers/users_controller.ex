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

  def sign_in(conn, params) do
    with {:ok, token, _claims} <- BankUp.sign_in(params) do
      conn
        |> put_status(:created)
        |> render("jwt.json", %{token: token})
    end
    #put_resp_cookie(conn, "my-cookie", "%{user_id: user.id}", sign: true)
  end
  def index(conn, _) do
    conn
      |> put_status(:created)
      |> render("default.json", %{message: "Ok!"})
  end
end
