defmodule Medium.Bookmarks.Bookkmark do
  use Ecto.Schema
  import Ecto.Changeset
  alias Medium.Accounts.User
  alias Medium.Posts.Post

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "bookmarks" do

    belongs_to :user, User, type: :binary_id
    belongs_to :post, Post, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(bookkmark, attrs) do
    bookkmark
    |> cast(attrs, [:user_id, :post_id])
    |> validate_required([:user_id, :post_id])
    |> unique_constraint([:user_id, :post_id])
  end
end
