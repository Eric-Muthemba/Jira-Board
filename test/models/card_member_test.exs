defmodule PhoenixJiraBoard.CardMemberTest do
  use PhoenixJiraBoard.ModelCase

  alias PhoenixJiraBoard.CardMember

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = CardMember.changeset(%CardMember{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = CardMember.changeset(%CardMember{}, @invalid_attrs)
    refute changeset.valid?
  end
end
