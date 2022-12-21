defmodule BasicWeb.ProjectAssignLive.FormComponent do
  use BasicWeb, :live_component

  alias Basic.ProjectAssigns

  @impl true
  def update(%{project_assign: project_assign} = assigns, socket) do
    changeset = ProjectAssigns.change_project_assign(project_assign)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"project_assign" => project_assign_params}, socket) do
    changeset =
      socket.assigns.project_assign
      |> ProjectAssigns.change_project_assign(project_assign_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"project_assign" => project_assign_params}, socket) do
    save_project_assign(socket, socket.assigns.action, project_assign_params)
  end

  defp save_project_assign(socket, :edit, project_assign_params) do
    case ProjectAssigns.update_project_assign(socket.assigns.project_assign, project_assign_params) do
      {:ok, _project_assign} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Project assign updated successfully")
         |> put_flash(:info, "編集できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_project_assign(socket, :new, project_assign_params) do
    case ProjectAssigns.create_project_assign(project_assign_params) do
      {:ok, _project_assign} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Project assign created successfully")
         |> put_flash(:info, "新規作成できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
