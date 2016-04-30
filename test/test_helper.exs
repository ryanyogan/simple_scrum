ExUnit.start

Mix.Task.run "ecto.create", ~w(-r SimpleScrum.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r SimpleScrum.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(SimpleScrum.Repo)

