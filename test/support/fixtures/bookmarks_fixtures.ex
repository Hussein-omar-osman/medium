defmodule Medium.BookmarksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medium.Bookmarks` context.
  """

  @doc """
  Generate a bookmark.
  """
  def bookmark_fixture(attrs \\ %{}) do
    {:ok, bookmark} =
      attrs
      |> Enum.into(%{

      })
      |> Medium.Bookmarks.create_bookmark()

    bookmark
  end
end
