defmodule BasicWeb.ExamChoiceLive.Index do
  use BasicWeb, :live_view

  alias Basic.ExamChoices
  alias Basic.ExamChoices.ExamChoice

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :exam_choices, list_exam_choices())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
#    |> assign(:page_title, "Edit Exam choice")
    |> assign(:page_title, "編集（４択問題）")
    |> assign(:exam_choice, ExamChoices.get_exam_choice!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
#    |> assign(:page_title, "New Exam choice")
    |> assign(:page_title, "新規作成（４択問題）")
    |> assign(:exam_choice, %ExamChoice{})
  end

  defp apply_action(socket, :index, _params) do
    socket
#    |> assign(:page_title, "Listing Exam choices")
    |> assign(:page_title, "一覧（４択問題）")
    |> assign(:exam_choice, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    exam_choice = ExamChoices.get_exam_choice!(id)
    {:ok, _} = ExamChoices.delete_exam_choice(exam_choice)

    {:noreply, assign(socket, :exam_choices, list_exam_choices())}
  end

  defp list_exam_choices do
    ExamChoices.list_exam_choices()
  end
end
