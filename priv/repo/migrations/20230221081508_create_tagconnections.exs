defmodule Medium.Repo.Migrations.CreateTagconnections do
  use Ecto.Migration

  def change do
    create table(:tagconnections, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :tag_id, references(:tags, on_delete: :delete_all, type: :binary_id)
      add :post_id, references(:posts, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create unique_index(:tagconnections, [:post_id, :tag_id])
  end
end
