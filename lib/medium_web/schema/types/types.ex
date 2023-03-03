defmodule MediumWeb.Schema.Types do

  use Absinthe.Schema.Notation

  import_types(MediumWeb.Schema.Types.UserType)
  import_types(MediumWeb.Schema.Types.SessionType)
  import_types(MediumWeb.Schema.Types.PostType)
  import_types(MediumWeb.Schema.Types.CommonType)
  import_types(MediumWeb.Schema.Types.CommentType)
  import_types(MediumWeb.Schema.Types.BookmarkType)

end
