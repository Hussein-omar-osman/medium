defmodule MediumWeb.Schema.Types.BookmarkType do
  use Absinthe.Schema.Notation

  input_object :bookmark_input_type do
    field :post_id, non_null(:id)
  end

end
