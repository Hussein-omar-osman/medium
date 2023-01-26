defmodule MediumWeb.Resolvers.PostResolver do
  alias Medium.{Posts, Accounts}
  alias Medium.Posts.Post
  alias MediumWeb.Utils


  def create_post(_, %{input: input}, %{context: %{current_user: current_user}}) do

    final = Map.merge(input, %{user_id: current_user.id})
    case Posts.create_post(final) do
      {:ok, %Post{} = post} -> {:ok, post}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, Utils.format_changeset_error(changeset)}
     end

  end

  def my_posts(_, _, %{context: %{current_user: current_user}}) do
    {:ok, Posts.list_posts(current_user.id)}
  end


  def user_posts(_, %{input: %{id: id}}, _) do
    {:ok, Posts.list_posts(id)}
  end

  def update_post(_, %{input: input}, %{context: %{current_user: current_user}}) do
    with  {:ok, post}  <- Posts.get_post(input.id),
          {:ok, _} <- verfy_user(current_user.id, post.user_id),
          {:ok, %Post{} = post_result} <- Posts.update_post(post, Map.delete(input, :id)) do

          {:ok, post_result}
       else
        {:error, :not_found} -> {:error, "Post not found"}
        {:error, :not_allowed} -> {:error, "You are not allowed to update this post"}
        {:error, %Ecto.Changeset{} = changeset} -> {:error, Utils.format_changeset_error(changeset)}
    end
  end


  def delete_post(_, %{input: input}, %{context: %{current_user: current_user}}) do
    with  {:ok, post}  <- Posts.get_post(input.id),
          {:ok, _} <- verfy_user(current_user.id, post.user_id),
          {:ok, %Post{}} <- Posts.delete_post(post) do

          {:ok, true}
       else
        {:error, :not_found} -> {:error, "Post not found"}
        {:error, :not_allowed} -> {:error, "You are not allowed to delete this post"}
        {:error, %Ecto.Changeset{} = changeset} -> {:error, Utils.format_changeset_error(changeset)}
    end
  end

  defp verfy_user(current_user_id, owner_user_id) do
    case Accounts.get_user(current_user_id)  do
      n when n.id == owner_user_id  -> {:ok, n}
      n when n.id != owner_user_id  -> {:error, :not_allowed}
    end
  end

end
