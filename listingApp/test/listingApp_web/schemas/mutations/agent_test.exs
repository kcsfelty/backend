defmodule ListingAppWeb.Schemas.Mutations.AgentTest do
  use ListingApp.DataCase

  describe "createAgent" do
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

    test "creates an agent" do

      variables = %{
        "name" => "some name",
        "email" => "some@email.com",
        "phone" => "555-123-1234",
        "fax" => "555-321-4321"
      }
      assert {:ok, %{data: %{"createAgent" => variables}}} = Absinthe.run(@create_agent_mutation, ListingAppWeb.Schema, context: %{}, variables: variables)
    end
  end
end
