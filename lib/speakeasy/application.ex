defmodule Speakeasy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SpeakeasyWeb.Telemetry,
      # Start the Ecto repository
      Speakeasy.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Speakeasy.PubSub},
      # Start Finch
      {Finch, name: Speakeasy.Finch},
      # Start the Endpoint (http/https)
      SpeakeasyWeb.Endpoint
      # Start a worker by calling: Speakeasy.Worker.start_link(arg)
      # {Speakeasy.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Speakeasy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SpeakeasyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
