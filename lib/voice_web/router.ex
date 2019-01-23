defmodule VoiceWeb.Router do
  use VoiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug VoiceWeb.Context
  end

  scope "/api", VoiceWeb do
    pipe_through :api

    forward("/graphql", Absinthe.Plug, schema: VoiceWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: VoiceWeb.Schema)
    end
  end
end
