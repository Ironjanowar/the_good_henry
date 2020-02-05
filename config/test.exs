use Mix.Config

# Configure your database
config :the_good_henry, TheGoodHenry.Repo,
  username: "henry",
  password: "henry",
  database: "the_good_henry_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :the_good_henry, TheGoodHenryWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
