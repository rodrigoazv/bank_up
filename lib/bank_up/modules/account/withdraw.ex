

defmodule BankUp.Account.Withdraw do
  alias BankUp.Account.Operations

  alias BankUp.{Repo}
  def call(params) do
    params
    |> Operations.call(:withdraw)
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{account_withdraw: account}} -> {:ok, account}
    end
  end
end
