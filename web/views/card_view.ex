defmodule PhoenixJiraBoard.CardView do
  use PhoenixJiraBoard.Web, :view

  def render("show.json", %{card: card}) do
    card
  end
end
