defmodule PhoenixJiraBoard.CurrentUserController do
  use PhoenixJiraBoard.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: PhoenixJiraBoard.SessionController

  def show(conn, %{"jwt" => jwt}) do
    case Guardian.decode_and_verify(jwt) do
      { :ok, _claims } ->
        user = Guardian.Plug.current_resource(conn)

        conn
        |> put_status(:ok)
        |> render("show.json", user: user)

      { :error, _reason } ->
        conn
        |> put_status(:not_found)
        |> render(PhoenixJiraBoard.SessionView, "error.json", error: "Not Found")
    end
  end
end
