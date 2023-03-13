defmodule Medium.BookmarksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medium.Bookmarks` context.
  """

  @doc """
  Generate a bookmark.
  """
  def bookmark_fixture(attrs \\ %{}) do
    user = Medium.AccountsFixtures.user_fixture()
    post = Medium.PostsFixtures.post_fixture()
    {:ok, bookmark} =
      attrs
      |> Enum.into(%{
        user_id: user.id,
        post_id: post.id,
      })
      |> Medium.Bookmarks.create_bookmark()

    bookmark
  end
end
