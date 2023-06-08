defmodule Speakeasy.Repo do
  use Ecto.Repo,
    otp_app: :speakeasy,
    adapter: Ecto.Adapters.Postgres
end
