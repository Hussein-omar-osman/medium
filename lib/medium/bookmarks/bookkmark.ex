defmodule Medium.Bookmarks.Bookkmark do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "bookmarks" do

    field :user_id, :binary_id
    field :post_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(bookkmark, attrs) do
    bookkmark
    |> cast(attrs, [])
    |> validate_required([])
  end
end
