defmodule Medium.LikesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medium.Likes` context.
  """

  @doc """
  Generate a like.
  """
  def like_fixture(attrs \\ %{}) do
    user = Medium.AccountsFixtures.user_fixture()
    post = Medium.PostsFixtures.post_fixture()
    {:ok, like} =
      attrs
      |> Enum.into(%{
        user_id: user.id,
        post_id: post.id,
      })
      |> Medium.Likes.create_like()

    like
  end
end
