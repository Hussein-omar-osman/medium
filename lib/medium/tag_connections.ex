defmodule Medium.TagConnections do
  @moduledoc """
  The TagConnections context.
  """

  import Ecto.Query, warn: false
  alias Medium.Repo

  alias Medium.TagConnections.TagConnection

  @doc """
  Returns the list of tagconnections.

  ## Examples

      iex> list_tagconnections()
      [%TagConnection{}, ...]

  """
  def list_tagconnections do
    Repo.all(TagConnection)
  end

  @doc """
  Gets a single tag_connection.

  Raises `Ecto.NoResultsError` if the Tag connection does not exist.

  ## Examples

      iex> get_tag_connection!(123)
      %TagConnection{}

      iex> get_tag_connection!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag_connection!(id), do: Repo.get!(TagConnection, id)

  @doc """
  Creates a tag_connection.

  ## Examples

      iex> create_tag_connection(%{field: value})
      {:ok, %TagConnection{}}

      iex> create_tag_connection(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag_connection(attrs \\ %{}) do
    %TagConnection{}
    |> TagConnection.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tag_connection.

  ## Examples

      iex> update_tag_connection(tag_connection, %{field: new_value})
      {:ok, %TagConnection{}}

      iex> update_tag_connection(tag_connection, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag_connection(%TagConnection{} = tag_connection, attrs) do
    tag_connection
    |> TagConnection.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tag_connection.

  ## Examples

      iex> delete_tag_connection(tag_connection)
      {:ok, %TagConnection{}}

      iex> delete_tag_connection(tag_connection)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag_connection(%TagConnection{} = tag_connection) do
    Repo.delete(tag_connection)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag_connection changes.

  ## Examples

      iex> change_tag_connection(tag_connection)
      %Ecto.Changeset{data: %TagConnection{}}

  """
  def change_tag_connection(%TagConnection{} = tag_connection, attrs \\ %{}) do
    TagConnection.changeset(tag_connection, attrs)
  end
end
