defmodule MediumWeb.Schema.Types.SessionType do
  use Absinthe.Schema.Notation

  object :session_type do
    field(:token, :string)
    field(:user, :user_type)
  end

  input_object :session_input_email_type do
    field(:email, non_null(:string))
    field(:password, non_null(:string))
  end

  input_object :session_input_username_type do
    field(:username, non_null(:string))
    field(:password, non_null(:string))
  end

end
