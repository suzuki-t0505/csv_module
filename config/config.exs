import Config

config :csv_module, Csv.Repo,
  database: "csv_module_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :csv_module, ecto_repos: [Csv.Repo]
