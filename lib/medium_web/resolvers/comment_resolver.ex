defmodule MediumWeb.Resolvers.CommentResolver do
  alias Medium.{Comments, Accounts}
  alias Medium.Comments.Comment
  alias MediumWeb.Utils


  def create_comment(_, %{input: input}, %{context: %{current_user: current_user}}) do

    final = Map.merge(input, %{user_id: current_user.id})
    case Comments.create_comment(final) do
      {:ok, %Comment{} = comment} -> {:ok, comment}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, Utils.format_changeset_error(changeset)}
     end

  end

  def update_comment(_, %{input: input}, %{context: %{current_user: current_user}}) do

    with {:ok, comment}  <- Comments.get_comment(input.id),
         {:ok, _} <- verfy_user(current_user.id, comment.user_id),
         {:ok, %Comment{} = res} <- Comments.update_comment(comment, Map.delete(input, :id)) do
          {:ok, res}
      else
        {:error, :not_found} -> {:error, "Comment not found"}
        {:error, :not_allowed} -> {:error, "You are not allowed to update this comment"}
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
