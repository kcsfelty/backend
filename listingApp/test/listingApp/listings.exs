defmodule ListingApp.ListingsTest do
  use ListingApp.DataCase

  alias ListingApp.Listings

  describe "listings" do
    alias ListingApp.Listings.Listing

    @valid_attrs %{address: "some address", city: "some city", mlsID: "some mlsID", postal: "some postal", price: "some price", state: "some state"}
    @update_attrs %{address: "some updated address", city: "some updated city", mlsID: "some updated mlsID", postal: "some updated postal", price: "some updated price", state: "some updated state"}
    @invalid_attrs %{address: nil, city: nil, mlsID: nil, postal: nil, price: nil, state: nil}

    def listing_fixture(attrs \\ %{}) do
      {:ok, listing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Listings.create_listing()

      listing
    end

    test "list_listings/0 returns all listings" do
      listing = listing_fixture()
      assert Listings.list_listings() == [listing]
    end

    test "get_listing!/1 returns the listing with given id" do
      listing = listing_fixture()
      assert Listings.get_listing!(listing.id) == listing
    end

    test "create_listing/1 with valid data creates a listing" do
      assert {:ok, %Listing{} = listing} = Listings.create_listing(@valid_attrs)
      assert listing.address == "some address"
      assert listing.city == "some city"
      assert listing.mlsID == "some mlsID"
      assert listing.postal == "some postal"
      assert listing.price == "some price"
      assert listing.state == "some state"
    end

    test "create_listing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Listings.create_listing(@invalid_attrs)
    end

    test "update_listing/2 with valid data updates the listing" do
      listing = listing_fixture()
      assert {:ok, %Listing{} = listing} = Listings.update_listing(listing, @update_attrs)
      assert listing.address == "some updated address"
      assert listing.city == "some updated city"
      assert listing.mlsID == "some updated mlsID"
      assert listing.postal == "some updated postal"
      assert listing.price == "some updated price"
      assert listing.state == "some updated state"
    end

    test "update_listing/2 with invalid data returns error changeset" do
      listing = listing_fixture()
      assert {:error, %Ecto.Changeset{}} = Listings.update_listing(listing, @invalid_attrs)
      assert listing == Listings.get_listing!(listing.id)
    end

    test "delete_listing/1 deletes the listing" do
      listing = listing_fixture()
      assert {:ok, %Listing{}} = Listings.delete_listing(listing)
      assert_raise Ecto.NoResultsError, fn -> Listings.get_listing!(listing.id) end
    end

    test "change_listing/1 returns a listing changeset" do
      listing = listing_fixture()
      assert %Ecto.Changeset{} = Listings.change_listing(listing)
    end
  end
end
