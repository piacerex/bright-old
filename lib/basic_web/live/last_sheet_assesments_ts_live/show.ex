defmodule BasicWeb.LastSheetAssesmentsTSLive.Show do
  use BasicWeb, :live_view

  alias Basic.LastSheetAssesmentsTSs

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:last_sheet_assesments_ts, LastSheetAssesmentsTSs.get_last_sheet_assesments_ts!(id))}
  end

#  defp page_title(:show), do: "Show Last sheet assesments ts"
#  defp page_title(:edit), do: "Edit Last sheet assesments ts"
  defp page_title(:show), do: "最終アセスメント集計の詳細"
  defp page_title(:edit), do: "最終アセスメント集計の編集"
end
