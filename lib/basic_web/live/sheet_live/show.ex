defmodule BasicWeb.SheetLive.Show do
  use BasicWeb, :live_view

  alias Basic.Sheets

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:sheet, Sheets.get_sheet!(id))}
  end

#  defp page_title(:show), do: "Show Sheet"
#  defp page_title(:edit), do: "Edit Sheet"
  defp page_title(:show), do: "シート詳細"
  defp page_title(:edit), do: "シート編集"
end
