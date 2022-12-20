defmodule Basic.SheetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Basic.Sheets` context.
  """

  @doc """
  Generate a sheet.
  """
  def sheet_fixture(attrs \\ %{}) do
    {:ok, sheet} =
      attrs
      |> Enum.into(%{
        level: 42,
        name: "some name"
      })
      |> Basic.Sheets.create_sheet()

    sheet
  end
end
