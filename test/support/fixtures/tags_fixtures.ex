defmodule Medium.TagsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medium.Tags` context.
  """

  @doc """
  Generate a unique tag tag.
  """
  def unique_tag_tag, do: "some tag#{System.unique_integer([:positive])}"

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        tag: unique_tag_tag()
      })
      |> Medium.Tags.create_tag()

    tag
  end
end
