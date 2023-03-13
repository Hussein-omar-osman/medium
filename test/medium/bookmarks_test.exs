defmodule Medium.BookmarksTest do
  use Medium.DataCase

  alias Medium.Bookmarks

  describe "bookmarks" do
    alias Medium.Bookmarks.Bookmark

    import Medium.BookmarksFixtures

    @invalid_attrs %{}

    test "list_bookmarks/0 returns all bookmarks" do
      user = Medium.AccountsFixtures.user_fixture()
      bookmark = bookmark_fixture()
      assert Bookmarks.list_bookmarks(user.id) == []
    end

    test "get_bookmark!/1 returns the bookmark with given id" do
      bookmark = bookmark_fixture()
      assert Bookmarks.get_bookmark!(bookmark.id) == bookmark
    end

    test "create_bookmark/1 with valid data creates a bookmark" do
      user = Medium.AccountsFixtures.user_fixture()
      post = Medium.PostsFixtures.post_fixture()
      valid_attrs = %{user_id: user.id, post_id: post.id}

      assert {:ok, %Bookmark{} = bookmark} = Bookmarks.create_bookmark(valid_attrs)
      assert bookmark.user_id == user.id
      assert bookmark.post_id == post.id
    end

    test "create_bookmark/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookmarks.create_bookmark(@invalid_attrs)
    end

    # test "update_bookmark/2 with valid data updates the bookmark" do
    #   bookmark = bookmark_fixture()
    #   update_attrs = %{}

    #   assert {:ok, %Bookmark{} = bookmark} = Bookmarks.update_bookmark(bookmark, update_attrs)
    # end

    # test "update_bookmark/2 with invalid data returns error changeset" do
    #   bookmark = bookmark_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Bookmarks.update_bookmark(bookmark, @invalid_attrs)
    #   assert bookmark == Bookmarks.get_bookmark!(bookmark.id)
    # end

    # test "delete_bookmark/1 deletes the bookmark" do
    #   bookmark = bookmark_fixture()
    #   assert {:ok, %Bookmark{}} = Bookmarks.delete_bookmark(bookmark)
    #   assert_raise Ecto.NoResultsError, fn -> Bookmarks.get_bookmark!(bookmark.id) end
    # end

    test "change_bookmark/1 returns a bookmark changeset" do
      bookmark = bookmark_fixture()
      assert %Ecto.Changeset{} = Bookmarks.change_bookmark(bookmark)
    end
  end
end
