defmodule Basic.LastAssesmentsTSsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Basic.LastAssesmentsTSs` context.
  """

  @doc """
  Generate a last_assesments_ts.
  """
  def last_assesments_ts_fixture(attrs \\ %{}) do
    {:ok, last_assesments_ts} =
      attrs
      |> Enum.into(%{
        account_committed_rate: 120.5,
        account_evidence_rate: 120.5,
        account_experienced_rate: 120.5,
        account_id: 42,
        account_learned_rate: 120.5,
        ts_last_sheet_assesments_ids: "some ts_last_sheet_assesments_ids"
      })
      |> Basic.LastAssesmentsTSs.create_last_assesments_ts()

    last_assesments_ts
  end
end
