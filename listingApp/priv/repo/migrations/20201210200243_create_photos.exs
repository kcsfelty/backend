defmodule ListingApp.Repo.Migrations.CreatePhotos do
  use Ecto.Migration

  def change do
    create table(:photos, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :url, :string
      add :listing_id, references(:listings, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:photos, [:listing_id])
  end
end
