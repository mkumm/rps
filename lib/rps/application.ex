defmodule RPS.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RPSWeb.Telemetry,
      # Start the Ecto repository
      RPS.Repo,
      RPS.CommandedApplication,
      RPS.Accounts.Supervisor,
      # Start the PubSub system
      {Phoenix.PubSub, name: RPS.PubSub},
      # Start Finch
      {Finch, name: RPS.Finch},
      # Start the Endpoint (http/https)
      RPSWeb.Endpoint
      # Start a worker by calling: RPS.Worker.start_link(arg)
      # {RPS.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RPS.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RPSWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
