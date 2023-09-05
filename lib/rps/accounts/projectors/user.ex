defmodule RPS.Accounts.Projectors.User do
  use Commanded.Projections.Ecto,
    name: "Accounts.Projectors.User",
    application: RPS.CommandedApplication,
    repo: RPS.Projections.Repo,
    consistency: :strong

  alias RPS.Accounts.Events.UserRegistered
  alias RPS.Accounts.Projections.User

  project(%UserRegistered{} = registered, fn multi ->
    Ecto.Multi.insert(multi, :user, %User{
      uuid: registered.user_uuid,
      username: registered.username,
      email: registered.email,
      hashed_password: registered.hashed_password,
      bio: nil,
      image: nil
    })
  end)
end
