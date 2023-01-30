defmodule MediumWeb.Resolvers.CommentResolver do
  alias Medium.Comments
  alias Medium.Comments.Comment
  alias MediumWeb.Utils


  def create_comment(_, %{input: input}, %{context: %{current_user: current_user}}) do

    final = Map.merge(input, %{user_id: current_user.id})
    case Comments.create_comment(final) do
      {:ok, %Comment{} = comment} -> {:ok, comment}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, Utils.format_changeset_error(changeset)}
     end


  end
end
