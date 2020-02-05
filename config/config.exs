# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :the_good_henry,
  ecto_repos: [TheGoodHenry.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :the_good_henry, TheGoodHenryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LkIDzA+ouKzXpeXfw8XF8keEnATRp79b6l2zwCMYGHxspGoYOCe+VstUdjBqCPUD",
  render_errors: [view: TheGoodHenryWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: TheGoodHenry.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
