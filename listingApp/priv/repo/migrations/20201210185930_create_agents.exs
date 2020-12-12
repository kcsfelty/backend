defmodule ListingApp.Repo.Migrations.CreateAgents do
  use Ecto.Migration

  def change do
    create table(:agents, primary_key: false) do
      add :id, :uuid, primary_key: true, default: Ecto.UUID.generate()
      add :name, :string
      add :email, :string
      add :phone, :string
      add :fax, :string

      timestamps()
    end

  end
end
