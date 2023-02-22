defmodule Medium.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Medium.Accounts.User
  alias Medium.Comments.Comment
  alias Medium.TagConnections.TagConnection

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "posts" do
    field :content, :string
    field :thumbnail, :string
    field :title, :string
    belongs_to :user, User, type: :binary_id
    has_many :comments, Comment
    has_many :tagconnection, TagConnection

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :thumbnail, :user_id])
    |> validate_required([:title, :content, :user_id])
    |> validate_length(:title, min: 5, max: 150)
  end
end
