defmodule BasicWeb.ProjectAssignLive.Index do
  use BasicWeb, :live_view

  alias Basic.ProjectAssigns
  alias Basic.ProjectAssigns.ProjectAssign

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :project_assigns, list_project_assigns())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
#    |> assign(:page_title, "Edit Project assign")
    |> assign(:page_title, "プロジェクトアサイン編集")
    |> assign(:project_assign, ProjectAssigns.get_project_assign!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
#    |> assign(:page_title, "New Project assign")
    |> assign(:page_title, "プロジェクトアサイン新規作成")
    |> assign(:project_assign, %ProjectAssign{})
  end

  defp apply_action(socket, :index, _params) do
    socket
#    |> assign(:page_title, "Listing Project assigns")
    |> assign(:page_title, "プロジェクトアサイン一覧")
    |> assign(:project_assign, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    project_assign = ProjectAssigns.get_project_assign!(id)
    {:ok, _} = ProjectAssigns.delete_project_assign(project_assign)

    {:noreply, assign(socket, :project_assigns, list_project_assigns())}
  end

  defp list_project_assigns do
    ProjectAssigns.list_project_assigns()
  end
end
