defmodule MediumWeb.Resolvers.SessionResolver do

  alias Medium.{Auth, Guardian}

  def login_user_email(_, %{input: input}, _) do

    with {:ok, user} <- Auth.authenticate_with_email(input),
         {:ok, token} <- Guardian.generate_tokens(user) do
          {:ok, %{token: token, user: user}}

    end
  end

  def login_user_username(_, %{input: input}, _) do

    with {:ok, user} <- Auth.authenticate_with_username(input),
         {:ok, token} <- Guardian.generate_tokens(user) do
          {:ok, %{token: token, user: user}}

    end
  end

  def sign_out(_, _, %{context: context}) do
    Guardian.revoke(context.token)
    {:ok, true}
  end
end
