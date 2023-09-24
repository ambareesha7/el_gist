defmodule ElGist.Repo do
  use Ecto.Repo,
    otp_app: :el_gist,
    adapter: Ecto.Adapters.Postgres
end
