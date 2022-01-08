defmodule BankUpWeb.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset
  alias BankUpWeb.Account

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:firstName, :lastName, :cpf, :password, :nickname]

  schema "user" do
    field :firstName, :string
    field :lastName, :string
    field :cpf, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :nickname, :string
    has_one :account, Account

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
