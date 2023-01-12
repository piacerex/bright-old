defmodule BasicWeb.LastSheetAssesmentsTSLive.Index do
  use BasicWeb, :live_view

  alias Basic.LastSheetAssesmentsTSs
  alias Basic.LastSheetAssesmentsTSs.LastSheetAssesmentsTS

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :last_sheet_assesments_tss, list_last_sheet_assesments_tss())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
#    |> assign(:page_title, "Edit Last sheet assesments ts")
    |> assign(:page_title, "最終アセスメント集計の編集")
    |> assign(:last_sheet_assesments_ts, LastSheetAssesmentsTSs.get_last_sheet_assesments_ts!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
#    |> assign(:page_title, "New Last sheet assesments ts")
    |> assign(:page_title, "最終アセスメント集計の新規作成")
    |> assign(:last_sheet_assesments_ts, %LastSheetAssesmentsTS{})
  end

  defp apply_action(socket, :index, _params) do
    socket
#    |> assign(:page_title, "Listing Last sheet assesments tss")
    |> assign(:page_title, "最終アセスメント集計一覧")
    |> assign(:last_sheet_assesments_ts, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    last_sheet_assesments_ts = LastSheetAssesmentsTSs.get_last_sheet_assesments_ts!(id)
    {:ok, _} = LastSheetAssesmentsTSs.delete_last_sheet_assesments_ts(last_sheet_assesments_ts)

    {:noreply, assign(socket, :last_sheet_assesments_tss, list_last_sheet_assesments_tss())}
  end

  defp list_last_sheet_assesments_tss do
#    LastSheetAssesmentsTSs.list_last_sheet_assesments_tss()
    LastSheetAssesmentsTSs.list_last_sheet_assesments_tss_per_sheet()
  end
end
