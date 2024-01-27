defmodule PhoenixJiraBoard.CardController do
  use PhoenixJiraBoard.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: PhoenixJiraBoard.SessionController

  alias PhoenixJiraBoard.{Repo, Card}

  def show(conn, %{"board_id" => board_id, "id" => card_id}) do
    current_user = Guardian.Plug.current_resource(conn)

    user_id = current_user.id
    card = Card
     |> Card.get_by_user_and_board(card_id, user_id, board_id)
     |> Repo.one!

    render(conn, "show.json", card: card)
  end
end
