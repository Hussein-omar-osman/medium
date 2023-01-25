defmodule MediumWeb.Schema.Types.CommonType do

  use Absinthe.Schema.Notation

  input_object :id_input_type do
    field :id, non_null(:id)
  end
end
