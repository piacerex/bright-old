defmodule Basic.ProjectAssignsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Basic.ProjectAssigns` context.
  """

  @doc """
  Generate a project_assign.
  """
  def project_assign_fixture(attrs \\ %{}) do
    {:ok, project_assign} =
      attrs
      |> Enum.into(%{
        account_id: 42,
        last_assesments_id_at_assigned: 42,
        project_id: 42,
        reward_level_id: 42
      })
      |> Basic.ProjectAssigns.create_project_assign()

    project_assign
  end
end
