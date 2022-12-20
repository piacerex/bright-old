defmodule Basic.SheetSkillsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Basic.SheetSkills` context.
  """

  @doc """
  Generate a sheet_skill.
  """
  def sheet_skill_fixture(attrs \\ %{}) do
    {:ok, sheet_skill} =
      attrs
      |> Enum.into(%{
        sheet_id: 42,
        skill_id: 42
      })
      |> Basic.SheetSkills.create_sheet_skill()

    sheet_skill
  end
end
