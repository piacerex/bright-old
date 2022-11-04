defmodule BasicWeb.SkillLive.FormComponent do
  use BasicWeb, :live_component

  alias Basic.Skills

  @impl true
  def update(%{skill: skill} = assigns, socket) do
    changeset = Skills.change_skill(skill)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"skill" => skill_params}, socket) do
    changeset =
      socket.assigns.skill
      |> Skills.change_skill(skill_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"skill" => skill_params}, socket) do
    save_skill(socket, socket.assigns.action, skill_params)
  end

  defp save_skill(socket, :edit, skill_params) do
    case Skills.update_skill(socket.assigns.skill, skill_params) do
      {:ok, _skill} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Skill updated successfully")
         |> put_flash(:info, "編集できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_skill(socket, :new, skill_params) do
    case Skills.create_skill(skill_params) do
      {:ok, _skill} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Skill created successfully")
         |> put_flash(:info, "新規スキルを登録しました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
