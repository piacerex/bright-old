defmodule Basic.SkillsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Basic.Skills` context.
  """

  @doc """
  Generate a skill.
  """
  def skill_fixture(attrs \\ %{}) do
    {:ok, skill} =
      attrs
      |> Enum.into(%{
        exam_choices_id: 42,
        materials_id: 42,
        name: "some name"
      })
      |> Basic.Skills.create_skill()

    skill
  end

  @doc """
  Generate a skill.
  """
  def skill_fixture(attrs \\ %{}) do
    {:ok, skill} =
      attrs
      |> Enum.into(%{
        exam_choice_id: 42,
        material_id: 42,
        name: "some name"
      })
      |> Basic.Skills.create_skill()

    skill
  end
end
