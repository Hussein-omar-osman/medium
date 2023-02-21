defmodule Medium.TagConnectionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medium.TagConnections` context.
  """

  @doc """
  Generate a tag_connection.
  """
  def tag_connection_fixture(attrs \\ %{}) do
    {:ok, tag_connection} =
      attrs
      |> Enum.into(%{

      })
      |> Medium.TagConnections.create_tag_connection()

    tag_connection
  end
end
