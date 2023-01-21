defmodule Medium.Auth do

  alias Medium.Accounts

  def authenticate(%{email: email, password: password}) do
    email = String.downcase(email)
    user = Accounts.get_user_by_email(email)

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
