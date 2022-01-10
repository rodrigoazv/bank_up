defmodule BankUp do
  alias BankUp.User.Create, as: UserCreate
  alias BankUp.User.Signin, as: UserSignin

  alias BankUp.Account.{Deposit, Withdraw, Transaction}

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate sign_in(params), to: UserSignin, as: :call
  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
