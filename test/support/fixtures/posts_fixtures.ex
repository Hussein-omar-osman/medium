defmodule Medium.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medium.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        thumbnail: "some thumbnail",
        title: "some title"
      })
      |> Medium.Posts.create_post()

    post
  end
end
