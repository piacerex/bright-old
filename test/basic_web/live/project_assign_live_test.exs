defmodule BasicWeb.ProjectAssignLiveTest do
  use BasicWeb.ConnCase

  import Phoenix.LiveViewTest
  import Basic.ProjectAssignsFixtures

  @create_attrs %{account_id: 42, last_assesments_id_at_assigned: 42, project_id: 42, reward_level_id: 42}
  @update_attrs %{account_id: 43, last_assesments_id_at_assigned: 43, project_id: 43, reward_level_id: 43}
  @invalid_attrs %{account_id: nil, last_assesments_id_at_assigned: nil, project_id: nil, reward_level_id: nil}

  defp create_project_assign(_) do
    project_assign = project_assign_fixture()
    %{project_assign: project_assign}
  end

  describe "Index" do
    setup [:create_project_assign]

    test "lists all project_assigns", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.project_assign_index_path(conn, :index))

      assert html =~ "Listing Project assigns"
    end

    test "saves new project_assign", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.project_assign_index_path(conn, :index))

      assert index_live |> element("a", "New Project assign") |> render_click() =~
               "New Project assign"

      assert_patch(index_live, Routes.project_assign_index_path(conn, :new))

      assert index_live
             |> form("#project_assign-form", project_assign: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#project_assign-form", project_assign: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.project_assign_index_path(conn, :index))

      assert html =~ "Project assign created successfully"
    end

    test "updates project_assign in listing", %{conn: conn, project_assign: project_assign} do
      {:ok, index_live, _html} = live(conn, Routes.project_assign_index_path(conn, :index))

      assert index_live |> element("#project_assign-#{project_assign.id} a", "Edit") |> render_click() =~
               "Edit Project assign"

      assert_patch(index_live, Routes.project_assign_index_path(conn, :edit, project_assign))

      assert index_live
             |> form("#project_assign-form", project_assign: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#project_assign-form", project_assign: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.project_assign_index_path(conn, :index))

      assert html =~ "Project assign updated successfully"
    end

    test "deletes project_assign in listing", %{conn: conn, project_assign: project_assign} do
      {:ok, index_live, _html} = live(conn, Routes.project_assign_index_path(conn, :index))

      assert index_live |> element("#project_assign-#{project_assign.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#project_assign-#{project_assign.id}")
    end
  end

  describe "Show" do
    setup [:create_project_assign]

    test "displays project_assign", %{conn: conn, project_assign: project_assign} do
      {:ok, _show_live, html} = live(conn, Routes.project_assign_show_path(conn, :show, project_assign))

      assert html =~ "Show Project assign"
    end

    test "updates project_assign within modal", %{conn: conn, project_assign: project_assign} do
      {:ok, show_live, _html} = live(conn, Routes.project_assign_show_path(conn, :show, project_assign))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Project assign"

      assert_patch(show_live, Routes.project_assign_show_path(conn, :edit, project_assign))

      assert show_live
             |> form("#project_assign-form", project_assign: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#project_assign-form", project_assign: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.project_assign_show_path(conn, :show, project_assign))

      assert html =~ "Project assign updated successfully"
    end
  end
end
