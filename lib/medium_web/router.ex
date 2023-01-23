defmodule MediumWeb.Router do
  use MediumWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug MediumWeb.Plugs.Context
  end

  scope "/api" do
    pipe_through :api
    forward "/graphql", Absinthe.Plug.GraphiQL, schema: MediumWeb.Schema, interface: :playground
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
