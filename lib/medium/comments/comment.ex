defmodule Medium.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Medium.Accounts.User
  alias Medium.Posts.Post


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comments" do
    field :content, :string
    belongs_to :user, User, type: :binary_id
    belongs_to :post, Post, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :user_id, :post_id])
    |> validate_required([:content, :user_id, :post_id])
    |> validate_length(:content, min: 1)
  end
end
