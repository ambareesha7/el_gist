defmodule ElGist.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElGistWeb.Telemetry,
      # Start the Ecto repository
      ElGist.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElGist.PubSub},
      # Start Finch
      {Finch, name: ElGist.Finch},
      # Start the Endpoint (http/https)
      ElGistWeb.Endpoint
      # Start a worker by calling: ElGist.Worker.start_link(arg)
      # {ElGist.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElGist.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElGistWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
