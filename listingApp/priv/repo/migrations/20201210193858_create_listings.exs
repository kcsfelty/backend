defmodule ListingApp.Repo.Migrations.CreateListings do
  use Ecto.Migration

  def change do
    create table(:listings, primary_key: false) do
      add :id, :uuid, primary_key: true, default: Ecto.UUID.generate()
      add :mls_id, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :postal, :string
      add :price, :string
      add :agent_id, references(:agents, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create unique_index(:listings, [:mls_id])
    create index(:listings, [:agent_id])
  end
end
