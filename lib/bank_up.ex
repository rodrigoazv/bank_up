defmodule BankUp do
  alias BankUp.User.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
