defmodule ListingAppWeb.Schemas.Mutations.ListingTest do
  use ListingApp.DataCase

  @create_agent_mutation """
  mutation($name: String!, $email: String!, $phone: String, $fax: String ){
    createAgent(agent:{
      name:$name
      email:$email
      phone:$phone
      fax:$fax
    }){
      id
      name
      phone
      email
  }
  }
  """
  @create_agent_variables %{
    "name" => "some name",
    "email" => "some@email.com",
    "phone" => "555-123-1234",
    "fax" => "555-321-4321"
  }

  @create_listing_mutation """
  mutation($address: String!, $agentId: ID!, $city: String!, $mlsId: String!, $postal: String!, $price: String!, $state: String!){
    createListing(listing:{
      address: $address
      agentId: $agentId
      city: $city
      mlsId: $ mlsId
      postal: $postal
      price: $price
      state: $state
    }){
      address
      agent{
        id
        name
        email
      }
      id
      city
      mlsId
      postal
      price
      state
    }
  }
  """

  @find_listing_query """
  query($mlsId: String){
    findListing(where:{
      mlsId: $mlsId
    }){
      mlsId
    }
  }
  """

  @update_listing_mutation """
  mutation($oldMLS: String, $newMLS: String) {
    updateListing(where:{
      mlsId: $oldMLS
    }, set:{
      mlsId: $newMLS
    }){
      mlsId
    }
  }
  """

  @delete_listing_mutation """
  mutation($mlsId: String){
    deleteListing(where:{mlsId: $mlsId}){
      id
    }
  }
  """

  def agent_fixture() do
    {:ok, data} =
      Absinthe.run(@create_agent_mutation, ListingAppWeb.Schema, context: %{}, variables: @create_agent_variables)

    data.data["createAgent"]
  end

  describe "createListing" do
    test "creates a listing" do
      agent = agent_fixture()
      goodInput = %{
        "address" => "some address",
        "agentId" => agent["id"],
        "city" => "some city",
        "mlsId" => "12341234",
        "postal" => "11111",
        "price" => "133,713,370",
        "state" => "state"
      }
      goodOutput = %{
        "address" => goodInput["address"],
        "agentId" => agent["id"],
        "city" => goodInput["city"],
        "mlsId" => goodInput["mlsId"],
        "postal" => goodInput["postal"],
        "price" => goodInput["price"],
        "state" => goodInput["state"],
        "agent" => %{
          "email" => agent["email"],
          "id" => agent["id"],
          "name" => agent["name"]
        }
      }
      assert {:ok, %{data: %{"createListing" => goodOutput}}} = Absinthe.run(@create_listing_mutation, ListingAppWeb.Schema, context: %{}, variables: goodInput)

    end
  end
  describe "updateListing" do
    test "updates a listing by clause" do
      agent = agent_fixture()
      oldMLS = "40997562"
      newMLS = "93010178"
      goodInput = %{
        "address" => "some address",
        "agentId" => agent["id"],
        "city" => "some city",
        "mlsId" => oldMLS,
        "postal" => "11111",
        "price" => "133,713,370",
        "state" => "state"
      }
      findOldListing = %{
        "mlsId" => oldMLS,
      }
      updateInput = %{
        "oldMLS" => oldMLS,
        "newMLS" => newMLS
      }
      findNewListing = %{
        "mlsId" => newMLS,
      }
      listing = Absinthe.run(@create_listing_mutation, ListingAppWeb.Schema, context: %{}, variables: goodInput)
      assert {:ok, %{data: %{"findListing" => findOldListing}}} = Absinthe.run(@find_listing_query, ListingAppWeb.Schema, context: %{}, variables: findOldListing)
      assert {:ok, %{data: %{"findListing" => nil}}} = Absinthe.run(@find_listing_query, ListingAppWeb.Schema, context: %{}, variables: findNewListing)
      assert {:ok, %{data: %{"updateListing" => output}}} = Absinthe.run(@update_listing_mutation, ListingAppWeb.Schema, context: %{}, variables: updateInput)
      assert {:ok, %{data: %{"findListing" => nil}}} = Absinthe.run(@find_listing_query, ListingAppWeb.Schema, context: %{}, variables: findOldListing)
      assert {:ok, %{data: %{"findListing" => findNewListing}}} = Absinthe.run(@find_listing_query, ListingAppWeb.Schema, context: %{}, variables: findNewListing)
    end
  end
  describe "deleteListing" do
    test "deletes a listing by clause" do
      agent = agent_fixture()
      goodInput = %{
        "address" => "some address",
        "agentId" => agent["id"],
        "city" => "some city",
        "mlsId" => "12345678",
        "postal" => "11111",
        "price" => "133,713,370",
        "state" => "state"
      }
      findListing = %{
        "mlsId" => "12345678",
      }

      {:ok, listing} = Absinthe.run(@create_listing_mutation, ListingAppWeb.Schema, context: %{}, variables: goodInput)
      deleteOutput = %{"id" => listing.data["createListing"]["id"]}
      assert {:ok, %{data: %{"findListing" => findListing}}} = Absinthe.run(@find_listing_query, ListingAppWeb.Schema, context: %{}, variables: findListing)
      assert {:ok, %{data: %{"deleteListing" => deleteOutput}}} = Absinthe.run(@delete_listing_mutation, ListingAppWeb.Schema, context: %{}, variables: findListing)
      assert {:ok, %{data: %{"findListing" => nil}}} = Absinthe.run(@find_listing_query, ListingAppWeb.Schema, context: %{}, variables: findListing)
    end
  end
end
