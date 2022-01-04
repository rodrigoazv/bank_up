defmodule BankUp.Repo do
  use Ecto.Repo,
    otp_app: :bank_up,
    adapter: Ecto.Adapters.Postgres
end
