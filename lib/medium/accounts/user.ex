defmodule Medium.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :bio, :string
    field :email, :string
    field :image, :string, default: "https://res.cloudinary.com/husseincloud/image/upload/v1663768276/unknow_uuvewi.png"
    field :name, :string
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :image, :name, :bio])
    |> validate_required([:username, :email, :password, :image])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end
end
