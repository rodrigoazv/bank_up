defmodule BankUp.User.Create do

  alias Ecto.Multi

  alias BankUp.{User, Repo}
  def call(params) do
    Multi.new()
    |> Multi.insert(:create_user, User.changeset(params))
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{create_user: user}} -> {:ok, user}
    end
  end
end
