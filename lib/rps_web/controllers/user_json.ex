defmodule RPSWeb.UserJSON do
  alias RPS.Accounts.User

  @doc """
  Renders a list of user.
  """
  def index(%{user: user}) do
    %{data: for(user <- user, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      hashed_password: user.hashed_password,
      bio: user.bio,
      image: user.image
    }
  end
end
