defmodule MediumWeb.Schema.Types.PostType do

  use Absinthe.Schema.Notation

  object :post_type do
    field :id, :id
    field :title, :string
    field :content, :string
    field :thumbnail, :string
    field :user, :user_type
  end

  input_object :post_input_type do
    field :title, non_null(:string)
    field :content, non_null(:string)
    field :thumbnail, :string
  end

  input_object :update_post_input_type do
    field :id, non_null(:id)
    field :title, :string
    field :content, :string
    field :thumbnail, :string
  end
end
