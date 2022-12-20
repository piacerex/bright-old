defmodule BasicWeb.SheetSkillLive.Show do
  use BasicWeb, :live_view

  alias Basic.SheetSkills

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:sheet_skill, SheetSkills.get_sheet_skill!(id))}
  end

#  defp page_title(:show), do: "Show Sheet skill"
#  defp page_title(:edit), do: "Edit Sheet skill"
  defp page_title(:show), do: "シートスキル詳細"
  defp page_title(:edit), do: "シートスキル編集"
end
