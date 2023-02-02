defmodule Medium.Bookmarks do
  @moduledoc """
  The Bookmarks context.
  """

  import Ecto.Query, warn: false
  alias Medium.Repo

  alias Medium.Bookmarks.Bookkmark

  @doc """
  Returns the list of bookmarks.

  ## Examples

      iex> list_bookmarks()
      [%Bookkmark{}, ...]

  """
  def list_bookmarks do
    Repo.all(Bookkmark)
  end

  @doc """
  Gets a single bookkmark.

  Raises `Ecto.NoResultsError` if the Bookkmark does not exist.

  ## Examples

      iex> get_bookkmark!(123)
      %Bookkmark{}

      iex> get_bookkmark!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bookkmark!(id), do: Repo.get!(Bookkmark, id)

  @doc """
  Creates a bookkmark.

  ## Examples

      iex> create_bookkmark(%{field: value})
      {:ok, %Bookkmark{}}

      iex> create_bookkmark(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bookkmark(attrs \\ %{}) do
    %Bookkmark{}
    |> Bookkmark.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bookkmark.

  ## Examples

      iex> update_bookkmark(bookkmark, %{field: new_value})
      {:ok, %Bookkmark{}}

      iex> update_bookkmark(bookkmark, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bookkmark(%Bookkmark{} = bookkmark, attrs) do
    bookkmark
    |> Bookkmark.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bookkmark.

  ## Examples

      iex> delete_bookkmark(bookkmark)
      {:ok, %Bookkmark{}}

      iex> delete_bookkmark(bookkmark)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bookkmark(%Bookkmark{} = bookkmark) do
    Repo.delete(bookkmark)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bookkmark changes.

  ## Examples

      iex> change_bookkmark(bookkmark)
      %Ecto.Changeset{data: %Bookkmark{}}

  """
  def change_bookkmark(%Bookkmark{} = bookkmark, attrs \\ %{}) do
    Bookkmark.changeset(bookkmark, attrs)
  end
end
