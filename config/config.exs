# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ager,
  ecto_repos: [Ager.Repo]

# Configures the endpoint
config :ager, AgerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Fq3LuDuIG5twWBq7agJkhCMSwMIi6uBMbW2/mmbEKo6jvp1kQrGoubNTKziPOhzc",
  render_errors: [view: AgerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Ager.PubSub,
  live_view: [signing_salt: "0idg3mlL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
