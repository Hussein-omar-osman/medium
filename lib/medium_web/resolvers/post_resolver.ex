defmodule MediumWeb.Resolvers.PostResolver do
  alias Medium.Posts
  alias Medium.Posts.Post
  alias MediumWeb.Utils


  def create_post(_, %{input: input}, %{context: %{current_user: current_user}}) do

    final = Map.merge(input, %{user_id: current_user.id})
    case Posts.create_post(final) do
      {:ok, %Post{} = post} -> {:ok, post}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, Utils.format_changeset_error(changeset)}
     end

  end

end
