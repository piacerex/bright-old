defmodule BasicWeb.LastAssesmentsTSLive.Index do
  use BasicWeb, :live_view

  alias Basic.LastAssesmentsTSs
  alias Basic.LastAssesmentsTSs.LastAssesmentsTS

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :last_assesments_tss, list_last_assesments_tss())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
#    |> assign(:page_title, "Edit Last assesments ts")
    |> assign(:page_title, "最終アセスメント編集")
    |> assign(:last_assesments_ts, LastAssesmentsTSs.get_last_assesments_ts!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
#    |> assign(:page_title, "New Last assesments ts")
    |> assign(:page_title, "最終アセスメント新規作成")
    |> assign(:last_assesments_ts, %LastAssesmentsTS{})
  end

  defp apply_action(socket, :index, _params) do
    socket
#    |> assign(:page_title, "Listing Last assesments tss")
    |> assign(:page_title, "最終アセスメント一覧")
    |> assign(:last_assesments_ts, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    last_assesments_ts = LastAssesmentsTSs.get_last_assesments_ts!(id)
    {:ok, _} = LastAssesmentsTSs.delete_last_assesments_ts(last_assesments_ts)

    {:noreply, assign(socket, :last_assesments_tss, list_last_assesments_tss())}
  end

  defp list_last_assesments_tss do
    LastAssesmentsTSs.list_last_assesments_tss()
  end
end
