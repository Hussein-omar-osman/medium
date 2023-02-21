defmodule Medium.TagConnections.TagConnection do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tagconnections" do

    field :tag_id, :binary_id
    field :post_id, :binary_id

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
