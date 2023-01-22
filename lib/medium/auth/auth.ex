defmodule Medium.Auth do

  alias Medium.Accounts

  def authenticate_with_email(%{email: email, password: password}) do
    user = String.downcase(email) |> Accounts.get_user_by_email()

    case check_password(user, password) do
      true -> {:ok, user}
      _ -> {:error, "Incorrect credentials"}
    end

  end

  def authenticate_with_username(%{username: username, password: password}) do
    user = String.downcase(username) |> Accounts.get_user_by_username()

    case check_password(user, password) do
      true -> {:ok, user}
      _ -> {:error, "Incorrect credentials"}
    end

  end

  defp check_password(user, password) do
    case user do
      nil -> Bcrypt.no_user_verify()
      _ -> Bcrypt.verify_pass(password, user.password)
    end

  end
end
