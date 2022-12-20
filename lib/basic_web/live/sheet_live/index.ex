defmodule BasicWeb.SheetLive.Index do
  use BasicWeb, :live_view

  alias Basic.Sheets
  alias Basic.Sheets.Sheet

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :sheets, list_sheets())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
#    |> assign(:page_title, "Edit Sheet")
    |> assign(:page_title, "シート編集")
    |> assign(:sheet, Sheets.get_sheet!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
#    |> assign(:page_title, "New Sheet")
    |> assign(:page_title, "シート新規作成")
    |> assign(:sheet, %Sheet{})
  end

  defp apply_action(socket, :index, _params) do
    socket
#    |> assign(:page_title, "Listing Sheets")
    |> assign(:page_title, "シート一覧")
    |> assign(:sheet, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    sheet = Sheets.get_sheet!(id)
    {:ok, _} = Sheets.delete_sheet(sheet)

    {:noreply, assign(socket, :sheets, list_sheets())}
  end

  defp list_sheets do
    Sheets.list_sheets()
  end
end
