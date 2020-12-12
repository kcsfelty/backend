defmodule ListingAppWeb.Schemas.Queries.Agent do
  use Absinthe.Schema.Notation
  alias ListingAppWeb.Resolvers.AgentsResolver

  object :agent_queries do
    @desc "Get all agents"
    field :all_agents, non_null(list_of(non_null(:agent))) do
      resolve(&AgentsResolver.all_agents/3)
    end

    @desc "Get agent by id"
    field :get_agent, :agent do
      arg :id, non_null(:id)
      resolve &AgentsResolver.get_agent/3
    end
  end
end