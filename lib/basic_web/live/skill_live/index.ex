defmodule BasicWeb.SkillLive.Index do
  use BasicWeb, :live_view

  alias Basic.Skills
  alias Basic.Skills.Skill

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :skills, list_skills())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
#    |> assign(:page_title, "Edit Skill")
    |> assign(:page_title, "スキル編集")
    |> assign(:skill, Skills.get_skill!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
#    |> assign(:page_title, "New Skill")
    |> assign(:page_title, "新規スキル登録")
    |> assign(:skill, %Skill{})
  end

  defp apply_action(socket, :index, _params) do
    socket
#    |> assign(:page_title, "Listing Skills")
    |> assign(:page_title, "スキル一覧")
    |> assign(:skill, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    skill = Skills.get_skill!(id)
    {:ok, _} = Skills.delete_skill(skill)

    {:noreply, assign(socket, :skills, list_skills())}
  end

  defp list_skills do
    Skills.list_skills()
  end
end
