defmodule BasicWeb.ExamChoiceLive.Show do
  use BasicWeb, :live_view

  alias Basic.ExamChoices

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:exam_choice, ExamChoices.get_exam_choice!(id))}
  end

#  defp page_title(:show), do: "Show Exam choice"
#  defp page_title(:edit), do: "Edit Exam choice"
  defp page_title(:show), do: "詳細（４択問題）"
  defp page_title(:edit), do: "編集（４択問題）"
end
