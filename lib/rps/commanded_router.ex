defmodule RPS.CommandedRouter do
  use Commanded.Commands.Router

  alias RPS.Accounts.Aggregates.User
  alias RPS.Accounts.Commands.RegisterUser

  dispatch([RegisterUser], to: User, identity: :user_uuid)
end
