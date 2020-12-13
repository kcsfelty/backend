defmodule ListingAppWeb.Schema do
  use Absinthe.Schema
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]


  def context(ctx) do
    source = Dataloader.Ecto.new(ListingApp.Repo)
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Listing, source)
      |> Dataloader.add_source(Agent, source)
      |> Dataloader.add_source(Photos, source)

    Map.put(ctx, :loader, loader)
  end

  def plugins() do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

  import_types(ListingAppWeb.Types.Agent)
  import_types(ListingAppWeb.Types.Listing)
  import_types(ListingAppWeb.Types.Photo)

  #import_types(ListingAppWeb.Types.{
  #  Agent,
  #  Listing,
  #  Photo
  #})

  #import_types(ListingAppWeb.Schemas.Queries.{
  #  Agent,
  #  Listing,
  #  Photo
  #})

  import_types(ListingAppWeb.Schemas.Queries.Agent)
  import_types(ListingAppWeb.Schemas.Queries.Listing)
  import_types(ListingAppWeb.Schemas.Queries.Photo)

  query do
     import_fields :agent_queries
     import_fields :listing_queries
     import_fields :photo_queries
  end

  import_types(ListingAppWeb.Schemas.Mutations.Agent)
  import_types(ListingAppWeb.Schemas.Mutations.Listing)
  import_types(ListingAppWeb.Schemas.Mutations.Photo)

   #import_types(ListingAppWeb.Schemas.Mutations.{
   #  Agent,
   #  Listing,
   #  Photo
   #})

   mutation do
     import_fields :agent_mutations
     import_fields :listing_mutations
     import_fields :photo_mutations
   end
end