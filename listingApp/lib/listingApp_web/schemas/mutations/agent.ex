defmodule ListingAppWeb.Schemas.Mutations.Agent do
  use Absinthe.Schema.Notation
  alias ListingAppWeb.Resolvers.AgentsResolver

  object :agent_mutations do
    @desc "Create a new agent"
    field :create_agent, :agent do
      arg :agent, non_null(:agent_input)
      resolve &AgentsResolver.create_agent/3
    end
  end
end