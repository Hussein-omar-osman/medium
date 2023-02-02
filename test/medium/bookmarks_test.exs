defmodule Medium.BookmarksTest do
  use Medium.DataCase

  alias Medium.Bookmarks

  describe "bookmarks" do
    alias Medium.Bookmarks.Bookkmark

    import Medium.BookmarksFixtures

    @invalid_attrs %{}

    test "list_bookmarks/0 returns all bookmarks" do
      bookkmark = bookkmark_fixture()
      assert Bookmarks.list_bookmarks() == [bookkmark]
    end

    test "get_bookkmark!/1 returns the bookkmark with given id" do
      bookkmark = bookkmark_fixture()
      assert Bookmarks.get_bookkmark!(bookkmark.id) == bookkmark
    end

    test "create_bookkmark/1 with valid data creates a bookkmark" do
      valid_attrs = %{}

      assert {:ok, %Bookkmark{} = bookkmark} = Bookmarks.create_bookkmark(valid_attrs)
    end

    test "create_bookkmark/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookmarks.create_bookkmark(@invalid_attrs)
    end

    test "update_bookkmark/2 with valid data updates the bookkmark" do
      bookkmark = bookkmark_fixture()
      update_attrs = %{}

      assert {:ok, %Bookkmark{} = bookkmark} = Bookmarks.update_bookkmark(bookkmark, update_attrs)
    end

    test "update_bookkmark/2 with invalid data returns error changeset" do
      bookkmark = bookkmark_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookmarks.update_bookkmark(bookkmark, @invalid_attrs)
      assert bookkmark == Bookmarks.get_bookkmark!(bookkmark.id)
    end

    test "delete_bookkmark/1 deletes the bookkmark" do
      bookkmark = bookkmark_fixture()
      assert {:ok, %Bookkmark{}} = Bookmarks.delete_bookkmark(bookkmark)
      assert_raise Ecto.NoResultsError, fn -> Bookmarks.get_bookkmark!(bookkmark.id) end
    end

    test "change_bookkmark/1 returns a bookkmark changeset" do
      bookkmark = bookkmark_fixture()
      assert %Ecto.Changeset{} = Bookmarks.change_bookkmark(bookkmark)
    end
  end
end
