defmodule BasicWeb.ExamChoiceResultLive.Index do
  use BasicWeb, :live_view

  alias Basic.ExamChoiceResults
  alias Basic.ExamChoiceResults.ExamChoiceResult

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :exam_choice_results, list_exam_choice_results())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
#    |> assign(:page_title, "Edit Exam choice result")
    |> assign(:page_title, "試験結果編集")
    |> assign(:exam_choice_result, ExamChoiceResults.get_exam_choice_result!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
#    |> assign(:page_title, "New Exam choice result")
    |> assign(:page_title, "試験結果登録")
    |> assign(:exam_choice_result, %ExamChoiceResult{})
  end

  defp apply_action(socket, :index, _params) do
    socket
#    |> assign(:page_title, "Listing Exam choice results")
    |> assign(:page_title, "試験結果一覧")
    |> assign(:exam_choice_result, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    exam_choice_result = ExamChoiceResults.get_exam_choice_result!(id)
    {:ok, _} = ExamChoiceResults.delete_exam_choice_result(exam_choice_result)

    {:noreply, assign(socket, :exam_choice_results, list_exam_choice_results())}
  end

  defp list_exam_choice_results do
    ExamChoiceResults.list_exam_choice_results()
  end
end
