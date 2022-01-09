defmodule BankUpWeb.UserView do
  use BankUpWeb, :view

  alias BankUp.User

  def render("create.json", %{user: %User{id: id, firstName: firstName, nickname: nickname}}) do
    %{
      message: "User created",
      user: %{
        id: id,
        firstName: firstName,
        nickname: nickname
      }
    }
  end

  def render("jwt.json", %{message: message}) do
    %{message: message}
  end


end
