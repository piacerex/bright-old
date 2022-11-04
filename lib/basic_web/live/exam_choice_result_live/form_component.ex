defmodule BasicWeb.ExamChoiceResultLive.FormComponent do
  use BasicWeb, :live_component

  alias Basic.ExamChoiceResults

  @impl true
  def update(%{exam_choice_result: exam_choice_result} = assigns, socket) do
    changeset = ExamChoiceResults.change_exam_choice_result(exam_choice_result)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"exam_choice_result" => exam_choice_result_params}, socket) do
    changeset =
      socket.assigns.exam_choice_result
      |> ExamChoiceResults.change_exam_choice_result(exam_choice_result_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"exam_choice_result" => exam_choice_result_params}, socket) do
    save_exam_choice_result(socket, socket.assigns.action, exam_choice_result_params)
  end

  defp save_exam_choice_result(socket, :edit, exam_choice_result_params) do
    case ExamChoiceResults.update_exam_choice_result(socket.assigns.exam_choice_result, exam_choice_result_params) do
      {:ok, _exam_choice_result} ->
        {:noreply,
         socket
         |> put_flash(:info, "Exam choice result updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_exam_choice_result(socket, :new, exam_choice_result_params) do
    case ExamChoiceResults.create_exam_choice_result(exam_choice_result_params) do
      {:ok, _exam_choice_result} ->
        {:noreply,
         socket
         |> put_flash(:info, "Exam choice result created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
