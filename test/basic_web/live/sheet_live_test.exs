defmodule BasicWeb.SheetLiveTest do
  use BasicWeb.ConnCase

  import Phoenix.LiveViewTest
  import Basic.SheetsFixtures

  @create_attrs %{level: 42, name: "some name"}
  @update_attrs %{level: 43, name: "some updated name"}
  @invalid_attrs %{level: nil, name: nil}

  defp create_sheet(_) do
    sheet = sheet_fixture()
    %{sheet: sheet}
  end

  describe "Index" do
    setup [:create_sheet]

    test "lists all sheets", %{conn: conn, sheet: sheet} do
      {:ok, _index_live, html} = live(conn, Routes.sheet_index_path(conn, :index))

      assert html =~ "Listing Sheets"
      assert html =~ sheet.name
    end

    test "saves new sheet", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.sheet_index_path(conn, :index))

      assert index_live |> element("a", "New Sheet") |> render_click() =~
               "New Sheet"

      assert_patch(index_live, Routes.sheet_index_path(conn, :new))

      assert index_live
             |> form("#sheet-form", sheet: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sheet-form", sheet: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sheet_index_path(conn, :index))

      assert html =~ "Sheet created successfully"
      assert html =~ "some name"
    end

    test "updates sheet in listing", %{conn: conn, sheet: sheet} do
      {:ok, index_live, _html} = live(conn, Routes.sheet_index_path(conn, :index))

      assert index_live |> element("#sheet-#{sheet.id} a", "Edit") |> render_click() =~
               "Edit Sheet"

      assert_patch(index_live, Routes.sheet_index_path(conn, :edit, sheet))

      assert index_live
             |> form("#sheet-form", sheet: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sheet-form", sheet: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sheet_index_path(conn, :index))

      assert html =~ "Sheet updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes sheet in listing", %{conn: conn, sheet: sheet} do
      {:ok, index_live, _html} = live(conn, Routes.sheet_index_path(conn, :index))

      assert index_live |> element("#sheet-#{sheet.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#sheet-#{sheet.id}")
    end
  end

  describe "Show" do
    setup [:create_sheet]

    test "displays sheet", %{conn: conn, sheet: sheet} do
      {:ok, _show_live, html} = live(conn, Routes.sheet_show_path(conn, :show, sheet))

      assert html =~ "Show Sheet"
      assert html =~ sheet.name
    end

    test "updates sheet within modal", %{conn: conn, sheet: sheet} do
      {:ok, show_live, _html} = live(conn, Routes.sheet_show_path(conn, :show, sheet))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Sheet"

      assert_patch(show_live, Routes.sheet_show_path(conn, :edit, sheet))

      assert show_live
             |> form("#sheet-form", sheet: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#sheet-form", sheet: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sheet_show_path(conn, :show, sheet))

      assert html =~ "Sheet updated successfully"
      assert html =~ "some updated name"
    end
  end
end
