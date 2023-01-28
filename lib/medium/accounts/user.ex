defmodule Medium.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Medium.Posts.Post

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :bio, :string
    field :email, :string
    field :image, :string, default: "https://res.cloudinary.com/husseincloud/image/upload/v1663768276/unknow_uuvewi.png"
    field :name, :string
    field :password, :string
    field :username, :string

    has_many :posts, Post

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :image, :name, :bio])
    |> validate_required([:username, :email, :password, :image])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/,
      message: "email must have @ sign and no spaces"
    )
    |> validate_length(:email, min: 3, max: 100)
    |> validate_length(:username, min: 3, max: 100)
    |> validate_length(:password, min: 3, max: 30)
    |> update_change(:email, &String.downcase(&1))
    |> update_change(:username, &String.downcase(&1))
    |> hash_password()
  end

  defp hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, %{password: Bcrypt.hash_pwd_salt(password)})
  end

  defp hash_password(changeset), do: changeset
end
