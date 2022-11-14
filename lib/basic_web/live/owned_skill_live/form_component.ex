defmodule BasicWeb.OwnedSkillLive.FormComponent do
  use BasicWeb, :live_component

  alias Basic.OwnedSkills

  @impl true
  def update(%{owned_skill: owned_skill} = assigns, socket) do
    changeset = OwnedSkills.change_owned_skill(owned_skill)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:owned_level, owned_skill.level)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"owned_skill" => owned_skill_params}, socket) do
    changeset =
      socket.assigns.owned_skill
      |> OwnedSkills.change_owned_skill(owned_skill_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"owned_skill" => owned_skill_params}, socket) do
    save_owned_skill(socket, socket.assigns.action, owned_skill_params)
  end

  defp save_owned_skill(socket, :edit, owned_skill_params) do
    case OwnedSkills.update_owned_skill(socket.assigns.owned_skill, owned_skill_params) do
      {:ok, _owned_skill} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Owned skill updated successfully")
         |> put_flash(:info, "編集できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_owned_skill(socket, :new, owned_skill_params) do
    case OwnedSkills.create_owned_skill(owned_skill_params) do
      {:ok, _owned_skill} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Owned skill created successfully")
         |> put_flash(:info, "新規登録できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
