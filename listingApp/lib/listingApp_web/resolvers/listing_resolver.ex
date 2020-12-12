defmodule ListingAppWeb.Resolvers.ListingsResolver do
  alias ListingApp.Listings
  require Logger
  def all_listings(_root, _args, _info) do
    {:ok, Listings.list_listings()}
  end

  def create_listing(_root, args, _info) do
    case Listings.create_listing(args.listing) do
      {:ok, listing} ->
        {:ok, listing}
      _error ->
        {:error, "Error while creating listing"}
    end
  end

  def find_listing(_root, args, _info) do
    Listings.find_listing(args.where)
    {:ok, Listings.find_listing(args.where)}
  end

  def update_listing(_root, args, _info) do
    case Listings.update_listing(args.where, args.set) do
      {:ok, struct}       -> {:ok, struct}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def delete_listing(_root, args, _info) do
    case Listings.delete_listing(args.where) do
    {:ok, struct}       -> {:ok, struct}
    {:error, changeset} -> {:error, changeset}
    end
  end
end