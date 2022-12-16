defmodule Basic.LastSheetAssesmentsTSsTest do
  use Basic.DataCase

  alias Basic.LastSheetAssesmentsTSs

  describe "last_sheet_assesments_tss" do
    alias Basic.LastSheetAssesmentsTSs.LastSheetAssesmentsTS

    import Basic.LastSheetAssesmentsTSsFixtures

    @invalid_attrs %{account_id: nil, sheet_committed_rate: nil, sheet_evidence_rate: nil, sheet_experienced_rate: nil, sheet_id: nil, sheet_learned_rate: nil}

    test "list_last_sheet_assesments_tss/0 returns all last_sheet_assesments_tss" do
      last_sheet_assesments_ts = last_sheet_assesments_ts_fixture()
      assert LastSheetAssesmentsTSs.list_last_sheet_assesments_tss() == [last_sheet_assesments_ts]
    end

    test "get_last_sheet_assesments_ts!/1 returns the last_sheet_assesments_ts with given id" do
      last_sheet_assesments_ts = last_sheet_assesments_ts_fixture()
      assert LastSheetAssesmentsTSs.get_last_sheet_assesments_ts!(last_sheet_assesments_ts.id) == last_sheet_assesments_ts
    end

    test "create_last_sheet_assesments_ts/1 with valid data creates a last_sheet_assesments_ts" do
      valid_attrs = %{account_id: 42, sheet_committed_rate: 120.5, sheet_evidence_rate: 120.5, sheet_experienced_rate: 120.5, sheet_id: 42, sheet_learned_rate: 120.5}

      assert {:ok, %LastSheetAssesmentsTS{} = last_sheet_assesments_ts} = LastSheetAssesmentsTSs.create_last_sheet_assesments_ts(valid_attrs)
      assert last_sheet_assesments_ts.account_id == 42
      assert last_sheet_assesments_ts.sheet_committed_rate == 120.5
      assert last_sheet_assesments_ts.sheet_evidence_rate == 120.5
      assert last_sheet_assesments_ts.sheet_experienced_rate == 120.5
      assert last_sheet_assesments_ts.sheet_id == 42
      assert last_sheet_assesments_ts.sheet_learned_rate == 120.5
    end

    test "create_last_sheet_assesments_ts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LastSheetAssesmentsTSs.create_last_sheet_assesments_ts(@invalid_attrs)
    end

    test "update_last_sheet_assesments_ts/2 with valid data updates the last_sheet_assesments_ts" do
      last_sheet_assesments_ts = last_sheet_assesments_ts_fixture()
      update_attrs = %{account_id: 43, sheet_committed_rate: 456.7, sheet_evidence_rate: 456.7, sheet_experienced_rate: 456.7, sheet_id: 43, sheet_learned_rate: 456.7}

      assert {:ok, %LastSheetAssesmentsTS{} = last_sheet_assesments_ts} = LastSheetAssesmentsTSs.update_last_sheet_assesments_ts(last_sheet_assesments_ts, update_attrs)
      assert last_sheet_assesments_ts.account_id == 43
      assert last_sheet_assesments_ts.sheet_committed_rate == 456.7
      assert last_sheet_assesments_ts.sheet_evidence_rate == 456.7
      assert last_sheet_assesments_ts.sheet_experienced_rate == 456.7
      assert last_sheet_assesments_ts.sheet_id == 43
      assert last_sheet_assesments_ts.sheet_learned_rate == 456.7
    end

    test "update_last_sheet_assesments_ts/2 with invalid data returns error changeset" do
      last_sheet_assesments_ts = last_sheet_assesments_ts_fixture()
      assert {:error, %Ecto.Changeset{}} = LastSheetAssesmentsTSs.update_last_sheet_assesments_ts(last_sheet_assesments_ts, @invalid_attrs)
      assert last_sheet_assesments_ts == LastSheetAssesmentsTSs.get_last_sheet_assesments_ts!(last_sheet_assesments_ts.id)
    end

    test "delete_last_sheet_assesments_ts/1 deletes the last_sheet_assesments_ts" do
      last_sheet_assesments_ts = last_sheet_assesments_ts_fixture()
      assert {:ok, %LastSheetAssesmentsTS{}} = LastSheetAssesmentsTSs.delete_last_sheet_assesments_ts(last_sheet_assesments_ts)
      assert_raise Ecto.NoResultsError, fn -> LastSheetAssesmentsTSs.get_last_sheet_assesments_ts!(last_sheet_assesments_ts.id) end
    end

    test "change_last_sheet_assesments_ts/1 returns a last_sheet_assesments_ts changeset" do
      last_sheet_assesments_ts = last_sheet_assesments_ts_fixture()
      assert %Ecto.Changeset{} = LastSheetAssesmentsTSs.change_last_sheet_assesments_ts(last_sheet_assesments_ts)
    end
  end
end
