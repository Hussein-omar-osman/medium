defmodule Medium.Likes.Like do
  use Ecto.Schema
  import Ecto.Changeset
  alias Medium.Accounts.User
  alias Medium.Posts.Post

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "likes" do

    belongs_to :user, User, type: :binary_id
    belongs_to :post, Post, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(like, attrs) do
    like
    |> cast(attrs, [:post_id, :user_id])
    |> validate_required([:post_id, :user_id])
    |> unique_constraint([:post_id, :user_id])
  end
end
