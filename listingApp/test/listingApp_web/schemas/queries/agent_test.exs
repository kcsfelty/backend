defmodule ListingAppWeb.Schemas.Queries.AgentTest do
  use ListingApp.DataCase, async: true

  describe "allAgents" do

    @all_agents """
      query {
        allAgents {
          id
          name
          email
          phone
          fax
        }
      }
    """

    test "returns all agents" do

    end
  end

  describe "getAgent" do
    test "gets a specific agent" do

    end
    test "returns null for no matches" do

    end
  end
end
