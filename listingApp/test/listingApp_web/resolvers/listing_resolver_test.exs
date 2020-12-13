defmodule ListingAppWeb.Resolvers.ListingsResolverTest do
  use ListingApp.DataCase
  alias ListingAppWeb.Resolvers.ListingsResolver
  alias ListingApp.Listings.Listing

  @valid_attrs %{
    address: "some address",
    city: "some city",
    mls_id: "12345678",
    postal: "some postal",
    price: "some price",
    state: "some state",
    agent_id: "356d2293-dc47-4ecf-86b0-e0adbe373880"
  }

  @update_attrs %{
    address: "some updated address",
    city: "some updated city",
    mls_id: "87654321",
    postal: "some updated postal",
    price: "some updated price",
    state: "some updated state"
  }

  @invalid_attrs %{
    address: nil,
    city: nil,
    mls_id: nil,
    postal: nil,
    price: nil,
    state: nil
  }

  @valid_agent %{

  }

  def listing_fixture(attrs \\ %{}) do
    {:ok, listing} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Listings.create_listing()

    listing
  end

  def agent_fixture(attrs \\ %{}) do
    {:ok, listing} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Listings.create_listing()

    listing
  end

  describe "create_listing/3" do
    test "creates a listing with the valid input parameters" do

    end
    test "creates nothing if given invalid parameters" do

    end
  end

  describe "all_listings/3" do
    test "returns all listings" do

    end
  end

  describe "find_listing/3" do
    test "finds a listing by clause" do

    end
    test "returns null for no matches" do

    end
  end

  describe "update_listing/3" do
    test "updates a listing by clause" do

    end
    test "returns null for no matches" do

    end
  end

  describe "delete_listing/3" do
    test "deletes a listing by clause" do

    end
    test "returns null for no matches" do

    end
  end
end
