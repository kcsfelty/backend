defmodule ListingAppWeb.Types.Listing do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  def context(ctx) do
    source = Dataloader.Ecto.new(ListingApp.Repo)
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Agent, source)
      |> Dataloader.add_source(Photo, source)

    Map.put(ctx, :loader, loader)
  end

  def plugins() do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

  object :listing do
    field :id, non_null(:id)
    field :mls_id, non_null(:string)
    field :agent_id, non_null(:id)
    field :price, non_null(:string)
    field :address, non_null(:string)
    field :city, non_null(:string)
    field :state, non_null(:string)
    field :postal, non_null(:string)
    field :agent, non_null(:agent), resolve: dataloader(Agent)
    field :photos, list_of(:photo), resolve: dataloader(Photo)
  end

  input_object :listing_input do
    field :id, :id
    field :mls_id, :string
    field :agent_id, :id
    field :price, :string
    field :address, :string
    field :city, :string
    field :state, :string
    field :postal, :string
  end
end