defmodule MediumWeb.Schema do
  use Absinthe.Schema
  alias MediumWeb.Schema.Resolvers

  import_types(MediumWeb.Schema.Types)

  query do
    @desc "hello"
    field :hello, :string do
      resolve(fn _, _, _ -> {:ok, "Hello world"} end)
    end
  end

  mutation do
    @desc "register new user"
    field :register_user, :user_type do
      arg(:input, non_null(:register_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end
  end
end
