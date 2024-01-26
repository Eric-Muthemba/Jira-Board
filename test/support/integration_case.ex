defmodule PhoenixJiraBoard.IntegrationCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Hound.Helpers

      import Ecto, only: [build_assoc: 2]
      import Ecto.Model
      import Ecto.Query, only: [from: 2]
      import PhoenixJiraBoard.Router.Helpers
      import PhoenixJiraBoard.Factory
      import PhoenixJiraBoard.Retryer

      alias PhoenixJiraBoard.Repo

      # The default endpoint for testing
      @endpoint PhoenixJiraBoard.Endpoint

      hound_session
    end
  end

  setup tags do
    unless tags[:async] do
      Ecto.Adapters.SQL.restart_test_transaction(PhoenixJiraBoard.Repo, [])
    end

    :ok
  end
end
