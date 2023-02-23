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

    @desc "sign out user"
    field :sign_out, :boolean do
      middleware(Middleware.Authorize)
      resolve(&Resolvers.SessionResolver.sign_out/3)
    end

    @desc "get all my posts"
    field :my_posts, list_of(:post_type) do
      middleware(Middleware.Authorize)
      resolve(&Resolvers.PostResolver.my_posts/3)
    end

    @desc "get all posts"
    field :all_posts, list_of(:post_type) do
      # middleware(Middleware.Authorize)
      resolve(&Resolvers.PostResolver.all_posts/3)
    end

    @desc "get all user posts"
    field :user_posts, list_of(:post_type) do
      arg(:input, non_null(:id_input_type))
      middleware(Middleware.Authorize)
      resolve(&Resolvers.PostResolver.user_posts/3)
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

    @desc "update post"
    field :update_post, :post_type do
      arg(:input, non_null(:update_post_input_type))
      middleware(Middleware.Authorize)
      resolve(&Resolvers.PostResolver.update_post/3)
    end

    @desc "delete post"
    field :delete_post, :boolean do
      arg(:input, non_null(:id_input_type))
      middleware(Middleware.Authorize)
      resolve(&Resolvers.PostResolver.delete_post/3)
    end

    @desc "create comment"
    field :create_comment, :comment_type do
      arg(:input, non_null(:comment_input_type))
      middleware(Middleware.Authorize)
      resolve(&Resolvers.CommentResolver.create_comment/3)
    end

    @desc "update comment"
    field :update_comment, :comment_type do
      arg(:input, non_null(:update_comment_input_type))
      middleware(Middleware.Authorize)
      resolve(&Resolvers.CommentResolver.update_comment/3)
    end

  end

end
