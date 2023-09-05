defmodule RPS.Accounts.Commands.RegisterUser do
  defstruct [
    :user_uuid,
    :username,
    :email,
    :password,
    :hashed_password
  ]

  alias __MODULE__

  def new(user) do
    %RegisterUser{
      user_uuid: user.user_uuid,
      username: user.user_name,
      email: user.email,
      password: user.password,
      hashed_password: user.password
    }
  end
end
