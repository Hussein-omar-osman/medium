defmodule MediumWeb.Resolvers.UserResolver do
  alias Medium.Accounts
  alias Medium.Accounts.User
  alias MediumWeb.Utils

  def register_user(_, %{input: input}, _) do
     case Accounts.create_user(input) do
      {:ok, %User{} = user} -> {:ok, user}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, Utils.format_changeset_error(changeset)}
     end
  end

  def get_users(_, _, %{context: context}) do
    IO.puts("------------------------------")
    IO.inspect(context)
    IO.puts("------------------------------")
    {:ok, Accounts.list_users()}
  end

end
