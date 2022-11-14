defmodule BasicWeb.OwnedSkillLive.Index do
  use BasicWeb, :live_view

  alias Basic.OwnedSkills
  alias Basic.OwnedSkills.OwnedSkill

  @impl true
  def mount(_params, _session, socket) do
#    {:ok, assign(socket, :owned_skills, list_owned_skills())}
    {:ok,
      socket
      |> assign(:owned_skills, list_owned_skills())
      |> assign(:owned_level, 0)
    }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
#    |> assign(:page_title, "Edit Owned skill")
    |> assign(:page_title, "保有スキル編集")
    |> assign(:owned_skill, OwnedSkills.get_owned_skill!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
#    |> assign(:page_title, "New Owned skill")
    |> assign(:page_title, "保有スキル新規登録")
    |> assign(:owned_skill, %OwnedSkill{})
  end

  defp apply_action(socket, :index, _params) do
    socket
#    |> assign(:page_title, "Listing Owned skills")
    |> assign(:page_title, "保有スキル一覧")
    |> assign(:owned_skill, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    owned_skill = OwnedSkills.get_owned_skill!(id)
    {:ok, _} = OwnedSkills.delete_owned_skill(owned_skill)

    {:noreply, assign(socket, :owned_skills, list_owned_skills())}
  end

  defp list_owned_skills do
    OwnedSkills.list_owned_skills()
  end
end
