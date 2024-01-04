defmodule PhoenixJiraBoard.Router do
  use PhoenixJiraBoard.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/api", PhoenixJiraBoard do
    pipe_through :api

    scope "/v1" do
      post "/sessions", SessionController, :create
      get "/current_user", CurrentUserController, :show

      resources "boards", BoardController
    end
  end

  scope "/", PhoenixJiraBoard do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end
end
