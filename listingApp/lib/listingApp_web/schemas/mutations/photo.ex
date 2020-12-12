defmodule ListingAppWeb.Schemas.Mutations.Photo do
  use Absinthe.Schema.Notation
  alias ListingAppWeb.Resolvers.PhotosResolver

  object :photo_mutations do
    @desc "Create a new photo"
    field :create_photo, :photo do
      arg :photo, non_null(:photo_input)
      resolve &PhotosResolver.create_photo/3
    end
  end
end