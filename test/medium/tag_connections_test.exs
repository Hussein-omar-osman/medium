defmodule Medium.TagConnectionsTest do
  use Medium.DataCase

  alias Medium.TagConnections

  describe "tagconnections" do
    alias Medium.TagConnections.TagConnection

    import Medium.TagConnectionsFixtures

    @invalid_attrs %{}

    test "list_tagconnections/0 returns all tagconnections" do
      tag_connection = tag_connection_fixture()
      assert TagConnections.list_tagconnections() == [tag_connection]
    end

    test "get_tag_connection!/1 returns the tag_connection with given id" do
      tag_connection = tag_connection_fixture()
      assert TagConnections.get_tag_connection!(tag_connection.id) == tag_connection
    end

    test "create_tag_connection/1 with valid data creates a tag_connection" do
      valid_attrs = %{}

      assert {:ok, %TagConnection{} = tag_connection} = TagConnections.create_tag_connection(valid_attrs)
    end

    test "create_tag_connection/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TagConnections.create_tag_connection(@invalid_attrs)
    end

    test "update_tag_connection/2 with valid data updates the tag_connection" do
      tag_connection = tag_connection_fixture()
      update_attrs = %{}

      assert {:ok, %TagConnection{} = tag_connection} = TagConnections.update_tag_connection(tag_connection, update_attrs)
    end

    test "update_tag_connection/2 with invalid data returns error changeset" do
      tag_connection = tag_connection_fixture()
      assert {:error, %Ecto.Changeset{}} = TagConnections.update_tag_connection(tag_connection, @invalid_attrs)
      assert tag_connection == TagConnections.get_tag_connection!(tag_connection.id)
    end

    test "delete_tag_connection/1 deletes the tag_connection" do
      tag_connection = tag_connection_fixture()
      assert {:ok, %TagConnection{}} = TagConnections.delete_tag_connection(tag_connection)
      assert_raise Ecto.NoResultsError, fn -> TagConnections.get_tag_connection!(tag_connection.id) end
    end

    test "change_tag_connection/1 returns a tag_connection changeset" do
      tag_connection = tag_connection_fixture()
      assert %Ecto.Changeset{} = TagConnections.change_tag_connection(tag_connection)
    end
  end
end
