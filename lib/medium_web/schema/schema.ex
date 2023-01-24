defmodule MediumWeb.Schema do
  use Absinthe.Schema
  alias MediumWeb.Resolvers
  alias MediumWeb.Middleware


  import_types(MediumWeb.Schema.Types)

  query do
    @desc "hello"
    field :hello, :string do
      resolve(fn _, _, _ -> {:ok, "Hello world"} end)
    end

    @desc "get all users"
    field :get_users, list_of(:user_type) do
      middleware(Middleware.Authorize)
      resolve(&Resolvers.UserResolver.get_users/3)
    end
  end

  mutation do
    @desc "register new user"
    field :register_user, :user_type do
      arg(:input, non_null(:register_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "login user with email"
    field :login_with_email, :session_type do
      arg(:input, non_null(:session_input_email_type))
      resolve(&Resolvers.SessionResolver.login_user_email/3)
    end

    @desc "login user with username"
    field :login_with_username, :session_type do
      arg(:input, non_null(:session_input_username_type))
      resolve(&Resolvers.SessionResolver.login_user_username/3)
    end

    @desc "create post"
    field :create_post, :post_type do
      arg(:input, non_null(:post_input_type))
      middleware(Middleware.Authorize)
      resolve(&Resolvers.PostResolver.create_post/3)
    end
  end
end
