defmodule BasicWeb.LastAssesmentsTSLive.Show do
  use BasicWeb, :live_view

  alias Basic.LastAssesmentsTSs

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:last_assesments_ts, LastAssesmentsTSs.get_last_assesments_ts!(id))}
  end

#  defp page_title(:show), do: "Show Last assesments ts"
#  defp page_title(:edit), do: "Edit Last assesments ts"
  defp page_title(:show), do: "最終アセスメント（アカウント）詳細"
  defp page_title(:edit), do: "最終アセスメント（アカウント）編集"
end
