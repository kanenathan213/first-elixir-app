defmodule FirstElixir.Router do
  use FirstElixir.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FirstElixir do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/", RootController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", FirstElixir do
  #   pipe_through :api
  # end
end
