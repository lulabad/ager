defmodule Ager.Repo do
  use Ecto.Repo,
    otp_app: :ager,
    adapter: Ecto.Adapters.Postgres
end
