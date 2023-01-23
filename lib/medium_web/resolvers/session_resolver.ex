defmodule MediumWeb.Resolvers.SessionResolver do

  alias Medium.{Auth, Guardian}

  def login_user_email(_, %{input: input}, _) do

    with {:ok, user} <- Auth.authenticate_with_email(input),
         {:ok, token, _} <- Guardian.encode_and_sign(user) do
          {:ok, %{token: token, user: user}}

    end
  end

  def login_user_username(_, %{input: input}, _) do

    with {:ok, user} <- Auth.authenticate_with_username(input),
         {:ok, token, _} <- Guardian.encode_and_sign(user) do
          {:ok, %{token: token, user: user}}

    end
  end
end
