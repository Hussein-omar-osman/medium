defmodule MediumWeb.Resolvers.BookmarkResolver do
  alias Medium.Bookmarks
  alias Medium.Bookmarks.Bookmark

  def bookmarks(_, _, %{context: %{current_user: current_user}}) do
    {:ok, Bookmarks.list_bookmarks(current_user.id)}
  end

  # def alter_bookmark(_, %{input: %{id: id}}, %{context: %{current_user: current_user}}) do
  #   # case Bookmarks.check_bookmark_exists(id, current_user.id) do
  #   #   %Bookmark{} = z -> Bookmarks.create_bookmark(%{user_id: current_user.id, post_id: id})
  #   #   nil -> Bookmarks.delete_bookmark(z)
  #   # end
  #   case Bookmarks.check_bookmark_exists(id, current_user.id) do
  #     x -> Bookmarks.create_bookmark(%{user_id: current_user.id, post_id: id})
  #     nil -> Bookmarks.delete_bookmark(x)

  #   end
  #   {:ok, true}
  # end

  def alter_bookmark(_, %{input: %{id: id}}, %{context: %{current_user: current_user}}) do
    case Bookmarks.check_bookmark_exists(id, current_user.id) do
      bookmark -> Bookmarks.delete_bookmark(bookmark)
      nil -> Bookmarks.create_bookmark(%{user_id: current_user.id, post_id: id})

    end
    {:ok, true}
  end

end
