defmodule BankUp.User.Signin do
  alias BankUp.{Repo, User}
  alias BankUp.Guardian
  def call(%{"nickname" => nickname, "password" => password}) do
    case nickname_password_auth(nickname, password) do
      {:ok, user} -> Guardian.encode_and_sign(user)
      {:error, reason} -> {:error, reason}
    end
  end

  defp nickname_password_auth(nickname, password) when is_binary(nickname) and is_binary(password) do
    with {:ok, user} <- get_by_nickname(nickname),
    do: verify_password(password, user)
  end

  defp get_by_nickname(nickname) when is_binary(nickname) do
    case Repo.get_by(User, nickname: nickname)do
      nil ->
        {:error, :user_not_found}
      user ->
        {:ok, user}
    end
  end

  defp verify_password(password, %User{} = user) when is_binary(password) do
    if Bcrypt.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      {:error, :invalid_password}
    end
  end

end
