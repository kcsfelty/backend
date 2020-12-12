defmodule ListingAppWeb.Types.Agent do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  def context(ctx) do
    source = Dataloader.Ecto.new(ListingApp.Repo)
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Listing, source)
      |> Dataloader.add_source(Agent, source)

    Map.put(ctx, :loader, loader)
  end

  def plugins() do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

  object :agent do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :phone,
    field(:listings, list_of(:listing), resolve: dataloader(Listing))
  end

  input_object :agent_input do
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :phone, :string
    field :fax, :string
  end
end