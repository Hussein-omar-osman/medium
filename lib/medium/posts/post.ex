defmodule Medium.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Medium.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "posts" do
    field :content, :string
    field :thumbnail, :string
    field :title, :string
    # field :user_id, :binary_id
    belongs_to :user, User

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
