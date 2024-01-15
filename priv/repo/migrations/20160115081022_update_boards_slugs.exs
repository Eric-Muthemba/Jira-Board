defmodule PhoenixJiraBoard.Repo.Migrations.UpdateBoardsSlugs do
  use Ecto.Migration

  alias PhoenixJiraBoard.{Repo, Board}

  def change do
    Repo.all(Board)
    |> Enum.each(fn board ->
      slug = board.name
        |> String.downcase()
        |> String.replace(~r/[^\w-]+/, "-")

      Board.changeset(board, %{slug: slug})
      |> Repo.update()
    end)
  end
end
