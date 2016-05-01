defmodule SimpleScrum.Router do
  use SimpleScrum.Web, :router

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

  scope "/api", SimpleScrum do
    pipe_through :api

    scope "/v1" do
      post "/registration", RegistrationController, :create

      post "/sessions", SessionController, :create
      delete "/session", SessionController, :delete

      get "/current_user", CurrentUserController, :show

      resources "boards", BoardController, only: [:index, :create]
    end
  end

  scope "/", SimpleScrum do
    pipe_through :browser # Use the default browser stack

    get "*path", PageController, :index
  end
end
