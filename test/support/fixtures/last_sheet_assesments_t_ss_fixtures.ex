defmodule Basic.LastSheetAssesmentsTSsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Basic.LastSheetAssesmentsTSs` context.
  """

  @doc """
  Generate a last_sheet_assesments_ts.
  """
  def last_sheet_assesments_ts_fixture(attrs \\ %{}) do
    {:ok, last_sheet_assesments_ts} =
      attrs
      |> Enum.into(%{
        account_id: 42,
        sheet_committed_rate: 120.5,
        sheet_evidence_rate: 120.5,
        sheet_experienced_rate: 120.5,
        sheet_id: 42,
        sheet_learned_rate: 120.5
      })
      |> Basic.LastSheetAssesmentsTSs.create_last_sheet_assesments_ts()

    last_sheet_assesments_ts
  end
end
