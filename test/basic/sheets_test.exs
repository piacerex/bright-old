defmodule Basic.SheetsTest do
  use Basic.DataCase

  alias Basic.Sheets

  describe "sheets" do
    alias Basic.Sheets.Sheet

    import Basic.SheetsFixtures

    @invalid_attrs %{level: nil, name: nil}

    test "list_sheets/0 returns all sheets" do
      sheet = sheet_fixture()
      assert Sheets.list_sheets() == [sheet]
    end

    test "get_sheet!/1 returns the sheet with given id" do
      sheet = sheet_fixture()
      assert Sheets.get_sheet!(sheet.id) == sheet
    end

    test "create_sheet/1 with valid data creates a sheet" do
      valid_attrs = %{level: 42, name: "some name"}

      assert {:ok, %Sheet{} = sheet} = Sheets.create_sheet(valid_attrs)
      assert sheet.level == 42
      assert sheet.name == "some name"
    end

    test "create_sheet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sheets.create_sheet(@invalid_attrs)
    end

    test "update_sheet/2 with valid data updates the sheet" do
      sheet = sheet_fixture()
      update_attrs = %{level: 43, name: "some updated name"}

      assert {:ok, %Sheet{} = sheet} = Sheets.update_sheet(sheet, update_attrs)
      assert sheet.level == 43
      assert sheet.name == "some updated name"
    end

    test "update_sheet/2 with invalid data returns error changeset" do
      sheet = sheet_fixture()
      assert {:error, %Ecto.Changeset{}} = Sheets.update_sheet(sheet, @invalid_attrs)
      assert sheet == Sheets.get_sheet!(sheet.id)
    end

    test "delete_sheet/1 deletes the sheet" do
      sheet = sheet_fixture()
      assert {:ok, %Sheet{}} = Sheets.delete_sheet(sheet)
      assert_raise Ecto.NoResultsError, fn -> Sheets.get_sheet!(sheet.id) end
    end

    test "change_sheet/1 returns a sheet changeset" do
      sheet = sheet_fixture()
      assert %Ecto.Changeset{} = Sheets.change_sheet(sheet)
    end
  end
end
