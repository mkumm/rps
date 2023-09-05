defmodule RPS.Accounts.Projections.User do
  use Ecto.Schema

  @primary_key {:uuid, :binary_id, autogenerate: false}

  schema "accounts_users" do
    field :username, :string
    field :email, :string
    field :hashed_password, :string
    field :bio, :string
    field :image, :string

    timestamps()
  end
end
