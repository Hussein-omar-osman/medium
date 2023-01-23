defmodule MediumWeb.Middleware.Authorize do
  @behaviour Absinthe.Middleware

  def call(resolution, _) do
    case resolution.context do
      %{current_user: _} -> resolution
      _ -> resolution |> Absinthe.Resolution.put_result({:error, "invalid token"})
    end

  end
end
