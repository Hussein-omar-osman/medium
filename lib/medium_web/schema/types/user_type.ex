defmodule MediumWeb.Schema.Types.UserType do

  use Absinthe.Schema.Notation

  object :user_type do
    field :id, :id
    field :name, :string
    field :email, :string
    field :username, :string
    field :bio, :string
    field :image, :string
    field :inserted_at, :string
  end

  input_object :register_input_type do
    field :username, non_null(:string)
    field :email, non_null(:string)
    field :password, non_null(:string)
    field :name, :string
    field :image, :string
    field :bio, :string
  end

end
