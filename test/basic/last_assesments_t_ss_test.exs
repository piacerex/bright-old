defmodule Basic.LastAssesmentsTSsTest do
  use Basic.DataCase

  alias Basic.LastAssesmentsTSs

  describe "last_assesments_tss" do
    alias Basic.LastAssesmentsTSs.LastAssesmentsTS

    import Basic.LastAssesmentsTSsFixtures

    @invalid_attrs %{account_committed_rate: nil, account_evidence_rate: nil, account_experienced_rate: nil, account_id: nil, account_learned_rate: nil, ts_last_sheet_assesments_ids: nil}

    test "list_last_assesments_tss/0 returns all last_assesments_tss" do
      last_assesments_ts = last_assesments_ts_fixture()
      assert LastAssesmentsTSs.list_last_assesments_tss() == [last_assesments_ts]
    end

    test "get_last_assesments_ts!/1 returns the last_assesments_ts with given id" do
      last_assesments_ts = last_assesments_ts_fixture()
      assert LastAssesmentsTSs.get_last_assesments_ts!(last_assesments_ts.id) == last_assesments_ts
    end

    test "create_last_assesments_ts/1 with valid data creates a last_assesments_ts" do
      valid_attrs = %{account_committed_rate: 120.5, account_evidence_rate: 120.5, account_experienced_rate: 120.5, account_id: 42, account_learned_rate: 120.5, ts_last_sheet_assesments_ids: "some ts_last_sheet_assesments_ids"}

      assert {:ok, %LastAssesmentsTS{} = last_assesments_ts} = LastAssesmentsTSs.create_last_assesments_ts(valid_attrs)
      assert last_assesments_ts.account_committed_rate == 120.5
      assert last_assesments_ts.account_evidence_rate == 120.5
      assert last_assesments_ts.account_experienced_rate == 120.5
      assert last_assesments_ts.account_id == 42
      assert last_assesments_ts.account_learned_rate == 120.5
      assert last_assesments_ts.ts_last_sheet_assesments_ids == "some ts_last_sheet_assesments_ids"
    end

    test "create_last_assesments_ts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LastAssesmentsTSs.create_last_assesments_ts(@invalid_attrs)
    end

    test "update_last_assesments_ts/2 with valid data updates the last_assesments_ts" do
      last_assesments_ts = last_assesments_ts_fixture()
      update_attrs = %{account_committed_rate: 456.7, account_evidence_rate: 456.7, account_experienced_rate: 456.7, account_id: 43, account_learned_rate: 456.7, ts_last_sheet_assesments_ids: "some updated ts_last_sheet_assesments_ids"}

      assert {:ok, %LastAssesmentsTS{} = last_assesments_ts} = LastAssesmentsTSs.update_last_assesments_ts(last_assesments_ts, update_attrs)
      assert last_assesments_ts.account_committed_rate == 456.7
      assert last_assesments_ts.account_evidence_rate == 456.7
      assert last_assesments_ts.account_experienced_rate == 456.7
      assert last_assesments_ts.account_id == 43
      assert last_assesments_ts.account_learned_rate == 456.7
      assert last_assesments_ts.ts_last_sheet_assesments_ids == "some updated ts_last_sheet_assesments_ids"
    end

    test "update_last_assesments_ts/2 with invalid data returns error changeset" do
      last_assesments_ts = last_assesments_ts_fixture()
      assert {:error, %Ecto.Changeset{}} = LastAssesmentsTSs.update_last_assesments_ts(last_assesments_ts, @invalid_attrs)
      assert last_assesments_ts == LastAssesmentsTSs.get_last_assesments_ts!(last_assesments_ts.id)
    end

    test "delete_last_assesments_ts/1 deletes the last_assesments_ts" do
      last_assesments_ts = last_assesments_ts_fixture()
      assert {:ok, %LastAssesmentsTS{}} = LastAssesmentsTSs.delete_last_assesments_ts(last_assesments_ts)
      assert_raise Ecto.NoResultsError, fn -> LastAssesmentsTSs.get_last_assesments_ts!(last_assesments_ts.id) end
    end

    test "change_last_assesments_ts/1 returns a last_assesments_ts changeset" do
      last_assesments_ts = last_assesments_ts_fixture()
      assert %Ecto.Changeset{} = LastAssesmentsTSs.change_last_assesments_ts(last_assesments_ts)
    end
  end
end
