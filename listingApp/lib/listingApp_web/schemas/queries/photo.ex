defmodule ListingAppWeb.Schemas.Queries.Photo do
  use Absinthe.Schema.Notation
  alias ListingAppWeb.Resolvers.PhotosResolver

  object :photo_queries do
    @desc "Get all photos"
    field :all_photos, non_null(list_of(non_null(:photo))) do
      resolve(&PhotosResolver.all_photos/3)
    end
  end
end