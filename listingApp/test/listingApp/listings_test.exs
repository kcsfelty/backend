defmodule ListingApp.ListingsTest do
  use ListingApp.DataCase

  alias ListingApp.Listings

  describe "agents" do
    alias ListingApp.Listings.Agent

    @valid_attrs %{email: "some email", name: "some name"}
    @update_attrs %{email: "some updated email", name: "some updated name"}
    @invalid_attrs %{email: nil, name: nil}

    def agent_fixture(attrs \\ %{}) do
      {:ok, agent} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Listings.create_agent()

      agent
    end

    test "list_agents/0 returns all agents" do
      agent = agent_fixture()
      assert Listings.list_agents() == [agent]
    end

    test "get_agent!/1 returns the agent with given id" do
      agent = agent_fixture()
      assert Listings.get_agent!(agent.id) == agent
    end

    test "create_agent/1 with valid data creates a agent" do
      assert {:ok, %Agent{} = agent} = Listings.create_agent(@valid_attrs)
      assert agent.email == "some email"
      assert agent.name == "some name"
    end

    test "create_agent/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Listings.create_agent(@invalid_attrs)
    end

    test "update_agent/2 with valid data updates the agent" do
      agent = agent_fixture()
      assert {:ok, %Agent{} = agent} = Listings.update_agent(agent, @update_attrs)
      assert agent.email == "some updated email"
      assert agent.name == "some updated name"
    end

    test "update_agent/2 with invalid data returns error changeset" do
      agent = agent_fixture()
      assert {:error, %Ecto.Changeset{}} = Listings.update_agent(agent, @invalid_attrs)
      assert agent == Listings.get_agent!(agent.id)
    end

    test "delete_agent/1 deletes the agent" do
      agent = agent_fixture()
      assert {:ok, %Agent{}} = Listings.delete_agent(agent)
      assert_raise Ecto.NoResultsError, fn -> Listings.get_agent!(agent.id) end
    end

    test "change_agent/1 returns a agent changeset" do
      agent = agent_fixture()
      assert %Ecto.Changeset{} = Listings.change_agent(agent)
    end
  end

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

  describe "photos" do
    alias ListingApp.Listings.Photo

    @valid_attrs %{url: "some url"}
    @update_attrs %{url: "some updated url"}
    @invalid_attrs %{url: nil}

    def photo_fixture(attrs \\ %{}) do
      {:ok, photo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Listings.create_photo()

      photo
    end

    test "list_photos/0 returns all photos" do
      photo = photo_fixture()
      assert Listings.list_photos() == [photo]
    end

    test "get_photo!/1 returns the photo with given id" do
      photo = photo_fixture()
      assert Listings.get_photo!(photo.id) == photo
    end

    test "create_photo/1 with valid data creates a photo" do
      assert {:ok, %Photo{} = photo} = Listings.create_photo(@valid_attrs)
      assert photo.url == "some url"
    end

    test "create_photo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Listings.create_photo(@invalid_attrs)
    end

    test "update_photo/2 with valid data updates the photo" do
      photo = photo_fixture()
      assert {:ok, %Photo{} = photo} = Listings.update_photo(photo, @update_attrs)
      assert photo.url == "some updated url"
    end

    test "update_photo/2 with invalid data returns error changeset" do
      photo = photo_fixture()
      assert {:error, %Ecto.Changeset{}} = Listings.update_photo(photo, @invalid_attrs)
      assert photo == Listings.get_photo!(photo.id)
    end

    test "delete_photo/1 deletes the photo" do
      photo = photo_fixture()
      assert {:ok, %Photo{}} = Listings.delete_photo(photo)
      assert_raise Ecto.NoResultsError, fn -> Listings.get_photo!(photo.id) end
    end

    test "change_photo/1 returns a photo changeset" do
      photo = photo_fixture()
      assert %Ecto.Changeset{} = Listings.change_photo(photo)
    end
  end
end
