defmodule ListingAppWeb.Types.Photo do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  def context(ctx) do
    source = Dataloader.Ecto.new(ListingApp.Repo)
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Listing, source)
      |> Dataloader.add_source(Photo, source)

    Map.put(ctx, :loader, loader)
  end

  def plugins() do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

  object :photo do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :listing_id, non_null(:id)
    field :listing, non_null(:listing) do
      resolve dataloader(Listing)
    end
  end

  input_object :photo_input do
    field :url, :string
    field :listing_id, :id
  end
end