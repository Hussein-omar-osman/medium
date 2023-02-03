defmodule Medium.LikesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medium.Likes` context.
  """

  @doc """
  Generate a like.
  """
  def like_fixture(attrs \\ %{}) do
    {:ok, like} =
      attrs
      |> Enum.into(%{

      })
      |> Medium.Likes.create_like()

    like
  end
end
