defmodule BasicWeb.ExamChoiceLive.FormComponent do
  use BasicWeb, :live_component

  alias Basic.ExamChoices

  @impl true
  def update(%{exam_choice: exam_choice} = assigns, socket) do
    changeset = ExamChoices.change_exam_choice(exam_choice)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"exam_choice" => exam_choice_params}, socket) do
    changeset =
      socket.assigns.exam_choice
      |> ExamChoices.change_exam_choice(exam_choice_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"exam_choice" => exam_choice_params}, socket) do
    save_exam_choice(socket, socket.assigns.action, exam_choice_params)
  end

  defp save_exam_choice(socket, :edit, exam_choice_params) do
    case ExamChoices.update_exam_choice(socket.assigns.exam_choice, exam_choice_params) do
      {:ok, _exam_choice} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Exam choice updated successfully")
         |> put_flash(:info, "編集できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_exam_choice(socket, :new, exam_choice_params) do
    case ExamChoices.create_exam_choice(exam_choice_params) do
      {:ok, _exam_choice} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Exam choice created successfully")
         |> put_flash(:info, "新規問題を登録しました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
