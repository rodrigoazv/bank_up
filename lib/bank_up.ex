defmodule BankUpWeb do
  alias BankUpWeb.User.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
