defmodule MediumWeb.Schema.Resolvers.SessionResolver do

  alias Medium.{Auth, Guardian}

  def login_user(_, %{input: input}, _) do

    with {:ok, user} <- Auth.authenticate(input),
         {:ok, token, _} <- Guardian.encode_and_sign(user) do
          {:ok, %{token: token, user: user}}

    end
  end
end
