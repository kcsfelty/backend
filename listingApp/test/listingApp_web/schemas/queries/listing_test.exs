defmodule ListingAppWeb.Schemas.Queries.ListingTest do
  use ListingApp.DataCase, async: true

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
  query($id: ID, $mlsId: String){
    findListing_by_id: findListing(where:{
      id: $id
    }){
      id
      mlsId
    }
    findListing_by_mls_id: findListing(where:{
      mlsId: $mlsId
    }){
      id
      mlsId
    }
  }
  """

  def agent_fixture() do
    {:ok, data} =
      Absinthe.run(@create_agent_mutation, ListingAppWeb.Schema, context: %{}, variables: @create_agent_variables)

    data.data["createAgent"]
  end

  describe "findListing" do
    test "gets a specific listing" do
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
      {:ok, newListing} = Absinthe.run(@create_listing_mutation, ListingAppWeb.Schema, context: %{}, variables: goodInput)
      findInput = %{
        "id" => newListing.data["createListing"]["id"],
        "mlsId" => newListing.data["createListing"]["mlsId"]
      }

      {:ok, %{data: findOutput}} = Absinthe.run(@find_listing_query, ListingAppWeb.Schema, context: %{}, variables: findInput)

      assert findInput = findOutput["findListing_by_id"]
      assert findInput = findOutput["findListing_by_mls_id"]

    end
  end
end
