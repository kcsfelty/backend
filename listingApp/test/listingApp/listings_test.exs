defmodule ListingApp.ListingsTest do
  use ListingApp.DataCase

  alias ListingApp.Listings

  describe "listings" do
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

    def listing_fixture(attrs \\ %{}) do
      {:ok, listing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Listings.create_listing()

      listing
    end


      test "create_listing/1 with valid data creates a listing" do
        assert {:ok, %Listing{} = listing} = Listings.create_listing(@valid_attrs)
        assert listing.address == "some address"
        assert listing.city == "some city"
        assert listing.mls_id == "12345678"
        assert listing.postal == "some postal"
        assert listing.price == "some price"
        assert listing.state == "some state"
      end
      test "create_listing/1 with invalid data returns error changeset" do
        assert {:error, %Ecto.Changeset{}} = Listings.create_listing(@invalid_attrs)
      end

      test "find_listing/1 returns the listings matching the clause" do
        listing = listing_fixture()
        assert Listings.find_listing(%{id: listing.id}) == listing
      end



      test "update_listing/2 with valid data updates the listing" do
        listing = listing_fixture()
        assert {:ok, %Listing{} = listing} = Listings.update_listing(%{mls_id: "12345678"}, @update_attrs)
        assert listing.address == "some updated address"
        assert listing.city == "some updated city"
        assert listing.mls_id == "87654321"
        assert listing.postal == "some updated postal"
        assert listing.price == "some updated price"
        assert listing.state == "some updated state"
      end
      test "update_listing/2 with invalid data returns error changeset" do
        listing = listing_fixture()
        assert {:error, %Ecto.Changeset{}} = Listings.update_listing(%{mls_id: "12345678"}, @invalid_attrs)
        assert listing == Listings.get_listing!(listing.id)
      end



      test "delete_listing/1 deletes the listing" do
        listing = listing_fixture()
        assert {:ok, %Listing{}} = Listings.delete_listing(%{mls_id: "12345678"})
      end

  end
end
