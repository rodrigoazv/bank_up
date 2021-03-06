defmodule BankUpWeb.Router do
  use BankUpWeb, :router

  import Plug.BasicAuth

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug :basic_auth, Application.compile_env(:bank_up, :basic_auth)
  end

  scope "/api", BankUpWeb do
    pipe_through :api

    get "/", UserController, :index
    post "/users", UserController, :create
    post "/users/sign_in", UserController, :sign_in
  end

  scope "/api/auth", BankUpWeb do
    pipe_through [:api, :auth]

    post "/account/:id/deposit", AccountController, :deposit
    post "/account/:id/withdraw", AccountController, :withdraw
    post "/account/transaction", AccountController, :transaction
  end

  # Other scopes may use custom stacks.
  # scope "/api", BankUpWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BankUpWeb.Telemetry
    end
  end

end
