defmodule BasicWeb.LastAssesmentsTSLiveTest do
  use BasicWeb.ConnCase

  import Phoenix.LiveViewTest
  import Basic.LastAssesmentsTSsFixtures

  @create_attrs %{account_committed_rate: 120.5, account_evidence_rate: 120.5, account_experienced_rate: 120.5, account_id: 42, account_learned_rate: 120.5, ts_last_sheet_assesments_ids: "some ts_last_sheet_assesments_ids"}
  @update_attrs %{account_committed_rate: 456.7, account_evidence_rate: 456.7, account_experienced_rate: 456.7, account_id: 43, account_learned_rate: 456.7, ts_last_sheet_assesments_ids: "some updated ts_last_sheet_assesments_ids"}
  @invalid_attrs %{account_committed_rate: nil, account_evidence_rate: nil, account_experienced_rate: nil, account_id: nil, account_learned_rate: nil, ts_last_sheet_assesments_ids: nil}

  defp create_last_assesments_ts(_) do
    last_assesments_ts = last_assesments_ts_fixture()
    %{last_assesments_ts: last_assesments_ts}
  end

  describe "Index" do
    setup [:create_last_assesments_ts]

    test "lists all last_assesments_tss", %{conn: conn, last_assesments_ts: last_assesments_ts} do
      {:ok, _index_live, html} = live(conn, Routes.last_assesments_ts_index_path(conn, :index))

      assert html =~ "Listing Last assesments tss"
      assert html =~ last_assesments_ts.ts_last_sheet_assesments_ids
    end

    test "saves new last_assesments_ts", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.last_assesments_ts_index_path(conn, :index))

      assert index_live |> element("a", "New Last assesments ts") |> render_click() =~
               "New Last assesments ts"

      assert_patch(index_live, Routes.last_assesments_ts_index_path(conn, :new))

      assert index_live
             |> form("#last_assesments_ts-form", last_assesments_ts: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#last_assesments_ts-form", last_assesments_ts: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.last_assesments_ts_index_path(conn, :index))

      assert html =~ "Last assesments ts created successfully"
      assert html =~ "some ts_last_sheet_assesments_ids"
    end

    test "updates last_assesments_ts in listing", %{conn: conn, last_assesments_ts: last_assesments_ts} do
      {:ok, index_live, _html} = live(conn, Routes.last_assesments_ts_index_path(conn, :index))

      assert index_live |> element("#last_assesments_ts-#{last_assesments_ts.id} a", "Edit") |> render_click() =~
               "Edit Last assesments ts"

      assert_patch(index_live, Routes.last_assesments_ts_index_path(conn, :edit, last_assesments_ts))

      assert index_live
             |> form("#last_assesments_ts-form", last_assesments_ts: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#last_assesments_ts-form", last_assesments_ts: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.last_assesments_ts_index_path(conn, :index))

      assert html =~ "Last assesments ts updated successfully"
      assert html =~ "some updated ts_last_sheet_assesments_ids"
    end

    test "deletes last_assesments_ts in listing", %{conn: conn, last_assesments_ts: last_assesments_ts} do
      {:ok, index_live, _html} = live(conn, Routes.last_assesments_ts_index_path(conn, :index))

      assert index_live |> element("#last_assesments_ts-#{last_assesments_ts.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#last_assesments_ts-#{last_assesments_ts.id}")
    end
  end

  describe "Show" do
    setup [:create_last_assesments_ts]

    test "displays last_assesments_ts", %{conn: conn, last_assesments_ts: last_assesments_ts} do
      {:ok, _show_live, html} = live(conn, Routes.last_assesments_ts_show_path(conn, :show, last_assesments_ts))

      assert html =~ "Show Last assesments ts"
      assert html =~ last_assesments_ts.ts_last_sheet_assesments_ids
    end

    test "updates last_assesments_ts within modal", %{conn: conn, last_assesments_ts: last_assesments_ts} do
      {:ok, show_live, _html} = live(conn, Routes.last_assesments_ts_show_path(conn, :show, last_assesments_ts))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Last assesments ts"

      assert_patch(show_live, Routes.last_assesments_ts_show_path(conn, :edit, last_assesments_ts))

      assert show_live
             |> form("#last_assesments_ts-form", last_assesments_ts: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#last_assesments_ts-form", last_assesments_ts: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.last_assesments_ts_show_path(conn, :show, last_assesments_ts))

      assert html =~ "Last assesments ts updated successfully"
      assert html =~ "some updated ts_last_sheet_assesments_ids"
    end
  end
end
