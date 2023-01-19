defmodule MediumWeb.Schema do
  use Absinthe.Schema

  query do
    @desc "hello"
    field :hello, :string do
      resolve(fn _, _, _ -> {:ok, "Hello world"} end)
    end
  end
end
