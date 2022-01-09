defmodule BankUp do
  alias BankUp.User.Create, as: UserCreate
  alias BankUp.User.Signin, as: UserSignin

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate sign_in(params), to: UserSignin, as: :call
end
