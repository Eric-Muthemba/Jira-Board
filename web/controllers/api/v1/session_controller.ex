defmodule PhoenixJiraBoard.SessionController do
  use PhoenixJiraBoard.Web, :controller

  plug :scrub_params, "session" when action in [:create]

  def create(conn, %{"session" => session_params}) do
    case PhoenixJiraBoard.Session.authenticate(session_params) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :token)

        conn
        |> put_status(:created)
        |> render("show.json", jwt: jwt, user: user)

      :error ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

  def delete(conn, _) do
    jwt = Guardian.Plug.current_token(conn)
    claims = Guardian.Plug.claims(conn)

    Guardian.revoke!(jwt, claims)

    conn
    |> render "delete.json"
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(PhoenixJiraBoard.SessionView, "error.json", error: "Not Authenticated")
  end
end
