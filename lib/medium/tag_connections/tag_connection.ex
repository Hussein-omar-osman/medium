defmodule Medium.TagConnections.TagConnection do
  use Ecto.Schema
  import Ecto.Changeset
  alias Medium.Tags.Tag
  alias Medium.Posts.Post

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tagconnections" do

    belongs_to :tag, Tag, type: :binary_id
    belongs_to :post, Post, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(tag_connection, attrs) do
    tag_connection
    |> cast(attrs, [:tag_id, :post_id])
    |> validate_required([:tag_id, :post_id])
    |> unique_constraint([:tag_id, :post_id])
  end
end
