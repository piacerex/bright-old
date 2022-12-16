defmodule BasicWeb.LastSheetAssesmentsTSLiveTest do
  use BasicWeb.ConnCase

  import Phoenix.LiveViewTest
  import Basic.LastSheetAssesmentsTSsFixtures

  @create_attrs %{account_id: 42, sheet_committed_rate: 120.5, sheet_evidence_rate: 120.5, sheet_experienced_rate: 120.5, sheet_id: 42, sheet_learned_rate: 120.5}
  @update_attrs %{account_id: 43, sheet_committed_rate: 456.7, sheet_evidence_rate: 456.7, sheet_experienced_rate: 456.7, sheet_id: 43, sheet_learned_rate: 456.7}
  @invalid_attrs %{account_id: nil, sheet_committed_rate: nil, sheet_evidence_rate: nil, sheet_experienced_rate: nil, sheet_id: nil, sheet_learned_rate: nil}

  defp create_last_sheet_assesments_ts(_) do
    last_sheet_assesments_ts = last_sheet_assesments_ts_fixture()
    %{last_sheet_assesments_ts: last_sheet_assesments_ts}
  end

  describe "Index" do
    setup [:create_last_sheet_assesments_ts]

    test "lists all last_sheet_assesments_tss", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.last_sheet_assesments_ts_index_path(conn, :index))

      assert html =~ "Listing Last sheet assesments tss"
    end

    test "saves new last_sheet_assesments_ts", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.last_sheet_assesments_ts_index_path(conn, :index))

      assert index_live |> element("a", "New Last sheet assesments ts") |> render_click() =~
               "New Last sheet assesments ts"

      assert_patch(index_live, Routes.last_sheet_assesments_ts_index_path(conn, :new))

      assert index_live
             |> form("#last_sheet_assesments_ts-form", last_sheet_assesments_ts: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#last_sheet_assesments_ts-form", last_sheet_assesments_ts: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.last_sheet_assesments_ts_index_path(conn, :index))

      assert html =~ "Last sheet assesments ts created successfully"
    end

    test "updates last_sheet_assesments_ts in listing", %{conn: conn, last_sheet_assesments_ts: last_sheet_assesments_ts} do
      {:ok, index_live, _html} = live(conn, Routes.last_sheet_assesments_ts_index_path(conn, :index))

      assert index_live |> element("#last_sheet_assesments_ts-#{last_sheet_assesments_ts.id} a", "Edit") |> render_click() =~
               "Edit Last sheet assesments ts"

      assert_patch(index_live, Routes.last_sheet_assesments_ts_index_path(conn, :edit, last_sheet_assesments_ts))

      assert index_live
             |> form("#last_sheet_assesments_ts-form", last_sheet_assesments_ts: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#last_sheet_assesments_ts-form", last_sheet_assesments_ts: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.last_sheet_assesments_ts_index_path(conn, :index))

      assert html =~ "Last sheet assesments ts updated successfully"
    end

    test "deletes last_sheet_assesments_ts in listing", %{conn: conn, last_sheet_assesments_ts: last_sheet_assesments_ts} do
      {:ok, index_live, _html} = live(conn, Routes.last_sheet_assesments_ts_index_path(conn, :index))

      assert index_live |> element("#last_sheet_assesments_ts-#{last_sheet_assesments_ts.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#last_sheet_assesments_ts-#{last_sheet_assesments_ts.id}")
    end
  end

  describe "Show" do
    setup [:create_last_sheet_assesments_ts]

    test "displays last_sheet_assesments_ts", %{conn: conn, last_sheet_assesments_ts: last_sheet_assesments_ts} do
      {:ok, _show_live, html} = live(conn, Routes.last_sheet_assesments_ts_show_path(conn, :show, last_sheet_assesments_ts))

      assert html =~ "Show Last sheet assesments ts"
    end

    test "updates last_sheet_assesments_ts within modal", %{conn: conn, last_sheet_assesments_ts: last_sheet_assesments_ts} do
      {:ok, show_live, _html} = live(conn, Routes.last_sheet_assesments_ts_show_path(conn, :show, last_sheet_assesments_ts))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Last sheet assesments ts"

      assert_patch(show_live, Routes.last_sheet_assesments_ts_show_path(conn, :edit, last_sheet_assesments_ts))

      assert show_live
             |> form("#last_sheet_assesments_ts-form", last_sheet_assesments_ts: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#last_sheet_assesments_ts-form", last_sheet_assesments_ts: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.last_sheet_assesments_ts_show_path(conn, :show, last_sheet_assesments_ts))

      assert html =~ "Last sheet assesments ts updated successfully"
    end
  end
end
