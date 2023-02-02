defmodule Medium.Repo.Migrations.CreateBookmarks do
  use Ecto.Migration

  def change do
    create table(:bookmarks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)
      add :post_id, references(:posts, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create unique_index(:bookmarks, [:post_id, :user_id])

  end
end
