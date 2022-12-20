defmodule BasicWeb.SheetSkillLive.Index do
  use BasicWeb, :live_view

  alias Basic.SheetSkills
  alias Basic.SheetSkills.SheetSkill

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :sheet_skills, list_sheet_skills())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
#    |> assign(:page_title, "Edit Sheet skill")
    |> assign(:page_title, "シートスキル編集")
    |> assign(:sheet_skill, SheetSkills.get_sheet_skill!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
#    |> assign(:page_title, "New Sheet skill")
    |> assign(:page_title, "シートスキル新規作成")
    |> assign(:sheet_skill, %SheetSkill{})
  end

  defp apply_action(socket, :index, _params) do
    socket
#    |> assign(:page_title, "Listing Sheet skills")
    |> assign(:page_title, "シートスキル一覧")
    |> assign(:sheet_skill, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    sheet_skill = SheetSkills.get_sheet_skill!(id)
    {:ok, _} = SheetSkills.delete_sheet_skill(sheet_skill)

    {:noreply, assign(socket, :sheet_skills, list_sheet_skills())}
  end

  defp list_sheet_skills do
    SheetSkills.list_sheet_skills()
  end
end
