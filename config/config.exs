# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hjp,
  ecto_repos: [Hjp.Repo]

# Configures the endpoint
config :hjp, HjpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TZNq/fovFJZwRJbwb0Bovcxw2C/zQOPdRd2WlNOWO1C7mFFGKGGfLw5CeRe6RjDW",
  render_errors: [view: HjpWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hjp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
