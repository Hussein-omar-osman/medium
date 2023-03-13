defmodule Medium.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medium.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    user = Medium.AccountsFixtures.user_fixture()
    post = Medium.PostsFixtures.post_fixture()
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        user_id: user.id,
        post_id: post.id,
        content: "some content"
      })
      |> Medium.Comments.create_comment()

    comment
  end
end
