defmodule Medium.PostsTest do
  use Medium.DataCase

  alias Medium.{Posts, Accounts}

  describe "posts" do
    alias Medium.Posts.Post

    import Medium.PostsFixtures
    alias Medium.AccountsFixtures

    @invalid_attrs %{content: nil, thumbnail: nil, title: nil}

    test "list_posts/1 returns all posts" do
      post = post_fixture()
      assert Posts.list_posts(post.user_id) == [post]
    end

    test "list_posts_without_id/0 returns all posts" do
      post = post_fixture()
      assert Posts.list_posts_without_id() == [post]
    end

    test "get_post/1 returns the post with given id" do
      post = post_fixture()
      assert Posts.get_post(post.id) == {:ok, post}
    end

    test "create_post/1 with valid data creates a post" do
      user = AccountsFixtures.user_fixture()
      valid_attrs = %{content: "some content", thumbnail: "some thumbnail", title: "some title", user_id: user.id}

      assert {:ok, %Post{} = post} = Posts.create_post(valid_attrs)
      assert post.content == "some content"
      assert post.thumbnail == "some thumbnail"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      # user = AccountsFixtures.user_fixture()

      post = post_fixture()
      update_attrs = %{content: "some updated content", thumbnail: "some updated thumbnail", title: "some updated title"}

      assert {:ok, %Post{} = post} = Posts.update_post(post, update_attrs)
      assert post.content == "some updated content"
      assert post.thumbnail == "some updated thumbnail"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post, @invalid_attrs)
      assert {:ok, post} == Posts.get_post(post.id)
    end

    # test "delete_post/1 deletes the post" do
    #   post = post_fixture()
    #   assert {:ok, %Post{}} = Posts.delete_post(post)
    #   assert_raise Ecto.NoResultsError, fn -> Posts.get_post(post.id) end
    # end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end
end
