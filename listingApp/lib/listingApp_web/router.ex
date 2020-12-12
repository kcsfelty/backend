defmodule ListingAppWeb.Router do
  use ListingAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: ListingAppWeb.Schema,
    interface: :simple,
    context: %{publish: ListingAppWeb.Endpoint}

  end

end
