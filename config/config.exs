# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :simple_scrum, SimpleScrum.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "0cBAMcpNxvP51BmywJkFBuFT11OlM1HPv8Z6Bz70ynvJzDkNRHewTExzahtIiprZ",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: SimpleScrum.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "SimpleScrum",
  ttl: { 3, :days },
  verify_issuer: true,
  secret_key: "dfsdfsdf838234r3203243240sdasdasd",
  serializer: SimpleScrum.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
