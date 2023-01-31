defmodule MediumWeb.Schema.Types.CommentType do
  use Absinthe.Schema.Notation

  object :comment_type do
    field :id, :id
    field :content, :string
    field :post_id, :id
    field :user_id, :id
  end

  input_object :comment_input_type do
    field :post_id, non_null(:id)
    field :content, non_null(:string)
  end

end
