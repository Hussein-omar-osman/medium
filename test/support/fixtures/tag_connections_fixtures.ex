defmodule Medium.TagConnectionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medium.TagConnections` context.
  """

  @doc """
  Generate a tag_connection.
  """
  def tag_connection_fixture(attrs \\ %{}) do
    tag = Medium.TagsFixtures.tag_fixture()
    post = Medium.PostsFixtures.post_fixture()
    {:ok, tag_connection} =
      attrs
      |> Enum.into(%{
        tag_id: tag.id,
        post_id: post.id,
      })
      |> Medium.TagConnections.create_tag_connection()

    tag_connection
  end
end
