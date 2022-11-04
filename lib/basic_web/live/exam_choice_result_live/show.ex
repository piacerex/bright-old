defmodule BasicWeb.ExamChoiceResultLive.Show do
  use BasicWeb, :live_view

  alias Basic.ExamChoiceResults

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:exam_choice_result, ExamChoiceResults.get_exam_choice_result!(id))}
  end

#  defp page_title(:show), do: "Show Exam choice result"
#  defp page_title(:edit), do: "Edit Exam choice result"
  defp page_title(:show), do: "試験結果詳細"
  defp page_title(:edit), do: "試験結果編集"
end
