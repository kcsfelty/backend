defmodule ListingAppWeb.Schemas.Mutations.Listing do
  use Absinthe.Schema.Notation
  alias ListingAppWeb.Resolvers.ListingsResolver

  object :listing_mutations do
    @desc "Create a new listing"
    field :create_listing, :listing do
      arg :listing, non_null(:listing_input)
      resolve &ListingsResolver.create_listing/3
    end

    @desc "Update a listing by clause"
    field :update_listing, :listing do
      arg :where, non_null(:listing_input)
      arg :set, non_null(:listing_input)
      resolve &ListingsResolver.update_listing/3
    end

    @desc "Delete a listing by clause"
    field :delete_listing, :listing do
      arg :where, non_null(:listing_input)
      resolve &ListingsResolver.delete_listing/3
    end
  end
end