defmodule BankUp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table :users do
      add :firstName, :string
      add :lastName, :string
      add :cpf, :string
      add :password_hash, :string
      add :nickname, :string

      timestamps()
    end

    create unique_index(:users, [:cpf])
    create unique_index(:users, [:nickname])
  end
end
