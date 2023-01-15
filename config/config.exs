# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :medium,
  ecto_repos: [Medium.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :medium, MediumWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: MediumWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Medium.PubSub,
  live_view: [signing_salt: "qzTGCxcO"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :medium, Medium.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Guadian configuration details
config :medium, Medium.Guardian,
  issuer: "medium",
  secret_key: "qxMKMXnSH6KZMwWEnoFSgIgymtLK5ECttKEObaF6tH10iMm9288pxq5NUTZBGC8c"

config :guardian, Guardian.DB,
  repo: Medium.Repo,
  schema_name: "guardian_tokens",
  sweep_interval: 60 # default: 60 minutes

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
