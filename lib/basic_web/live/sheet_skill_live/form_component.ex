defmodule BasicWeb.SheetSkillLive.FormComponent do
  use BasicWeb, :live_component

  alias Basic.SheetSkills

  @impl true
  def update(%{sheet_skill: sheet_skill} = assigns, socket) do
    changeset = SheetSkills.change_sheet_skill(sheet_skill)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"sheet_skill" => sheet_skill_params}, socket) do
    changeset =
      socket.assigns.sheet_skill
      |> SheetSkills.change_sheet_skill(sheet_skill_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"sheet_skill" => sheet_skill_params}, socket) do
    save_sheet_skill(socket, socket.assigns.action, sheet_skill_params)
  end

  defp save_sheet_skill(socket, :edit, sheet_skill_params) do
    case SheetSkills.update_sheet_skill(socket.assigns.sheet_skill, sheet_skill_params) do
      {:ok, _sheet_skill} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Sheet skill updated successfully")
         |> put_flash(:info, "編集できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_sheet_skill(socket, :new, sheet_skill_params) do
    case SheetSkills.create_sheet_skill(sheet_skill_params) do
      {:ok, _sheet_skill} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Sheet skill created successfully")
         |> put_flash(:info, "新規作成できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
