defmodule Basic.OwnedSkillsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Basic.OwnedSkills` context.
  """

  @doc """
  Generate a owned_skill.
  """
  def owned_skill_fixture(attrs \\ %{}) do
    {:ok, owned_skill} =
      attrs
      |> Enum.into(%{
        account_id: 42,
        evidence_text: "some evidence_text",
        evidence_url: "some evidence_url",
        exam_count: 42,
        exam_limit: ~D[2022-11-06],
        exam_score: 42,
        learned_progress: 120.5,
        learning_limit: ~D[2022-11-06],
        level: 42,
        skill_id: 42
      })
      |> Basic.OwnedSkills.create_owned_skill()

    owned_skill
  end
end
