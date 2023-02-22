defmodule Medium.Tags.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Medium.TagConnections.TagConnection

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tags" do
    field :tag, :string
    has_many :tagconnection, TagConnection

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:tag])
    |> validate_required([:tag])
    |> unique_constraint(:tag)
    |> validate_length(:tag, min: 2, max: 100)
    |> update_change(:tag, &String.downcase(&1))
  end
end
