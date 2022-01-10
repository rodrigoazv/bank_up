defmodule BankUpWeb.AccountController do
  use BankUpWeb, :controller

  alias BankUp.Account
  alias BankUp.Account.Transaction.Response, as: TransactionResponse

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- BankUp.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- BankUp.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- BankUp.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
