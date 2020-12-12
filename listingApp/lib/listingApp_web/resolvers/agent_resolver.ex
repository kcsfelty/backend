defmodule ListingAppWeb.Resolvers.AgentsResolver do
  alias ListingApp.Agents
  require Logger
  def all_agents(_root, _args, _info) do
    {:ok, Agents.list_agents()}
  end

  def get_agent(_root, args, _info) do
    try do
      agent = Agents.get_agent!(args.id)
      {:ok, agent}
    rescue
      Ecto.NoResultsError ->
        {:ok, nil}
    end
  end

  def create_agent(_root, args, _info) do
    case Agents.create_agent(args.agent) do
      {:ok, agent} ->
        {:ok, agent}
      _error ->
        {:error, "Could not create agent"}
    end
  end

end