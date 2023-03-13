defmodule Medium.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medium.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    user = Medium.AccountsFixtures.user_fixture()
    {:ok, post} =
      attrs
      |> Enum.into(%{
        user_id: user.id,
        content: "some content",
        thumbnail: "some thumbnail",
        title: "some title"
      })
      |> Medium.Posts.create_post()

    post
  end
end
