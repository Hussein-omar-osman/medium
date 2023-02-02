defmodule Medium.BookmarksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medium.Bookmarks` context.
  """

  @doc """
  Generate a bookkmark.
  """
  def bookkmark_fixture(attrs \\ %{}) do
    {:ok, bookkmark} =
      attrs
      |> Enum.into(%{

      })
      |> Medium.Bookmarks.create_bookkmark()

    bookkmark
  end
end
