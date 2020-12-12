defmodule ListingApp.ListingsTest do
  use ListingApp.DataCase

  alias ListingApp.Agents

  describe "agents" do
    alias ListingApp.Agents.Agent

    @valid_attrs %{email: "some email", name: "some name", phone: "111-111-1111", fax: "222-222-2222"}
    @update_attrs %{email: "some updated email", name: "some updated name", phone: "999-999-9999", fax: "888-888-8888"}
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
end
