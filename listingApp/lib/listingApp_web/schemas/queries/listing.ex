defmodule ListingAppWeb.Schemas.Queries.Listing do
  use Absinthe.Schema.Notation
  alias ListingAppWeb.Resolvers.ListingsResolver

  object :listing_queries do
    @desc "Get all listings"
    field :all_listings, non_null(list_of(non_null(:listing))) do
      resolve &ListingsResolver.all_listings/3
    end

    @desc "Find listing by clause"
    field :find_listing, :listing do
      arg :where, non_null(:listing_input)
      resolve &ListingsResolver.find_listing/3
    end
  end
end