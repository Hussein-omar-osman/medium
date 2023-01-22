defmodule MediumWeb.Schema do
  use Absinthe.Schema
  alias MediumWeb.Schema.Resolvers

  import_types(MediumWeb.Schema.Types)

  query do
    @desc "hello"
    field :hello, :string do
      resolve(fn _, _, _ -> {:ok, "Hello world"} end)
    end

    @desc "get all users"
    field :get_users, list_of(:user_type) do
      resolve(&Resolvers.UserResolver.get_users/3)
    end
  end

  mutation do
    @desc "register new user"
    field :register_user, :user_type do
      arg(:input, non_null(:register_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "login user"
    field :login_user, :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&Resolvers.SessionResolv.login_user/3)
    end
  end
end
