defmodule BasicWeb.LastAssesmentsTSLive.FormComponent do
  use BasicWeb, :live_component

  alias Basic.LastAssesmentsTSs

  @impl true
  def update(%{last_assesments_ts: last_assesments_ts} = assigns, socket) do
    changeset = LastAssesmentsTSs.change_last_assesments_ts(last_assesments_ts)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"last_assesments_ts" => last_assesments_ts_params}, socket) do
    changeset =
      socket.assigns.last_assesments_ts
      |> LastAssesmentsTSs.change_last_assesments_ts(last_assesments_ts_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"last_assesments_ts" => last_assesments_ts_params}, socket) do
    save_last_assesments_ts(socket, socket.assigns.action, last_assesments_ts_params)
  end

  defp save_last_assesments_ts(socket, :edit, last_assesments_ts_params) do
#    case LastAssesmentsTSs.update_last_assesments_ts(socket.assigns.last_assesments_ts, last_assesments_ts_params) do
    case LastAssesmentsTSs.create_last_assesments_ts(last_assesments_ts_params) do
    {:ok, _last_assesments_ts} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Last assesments ts updated successfully")
         |> put_flash(:info, "編集できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_last_assesments_ts(socket, :new, last_assesments_ts_params) do
    case LastAssesmentsTSs.create_last_assesments_ts(last_assesments_ts_params) do
      {:ok, _last_assesments_ts} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Last assesments ts created successfully")
         |> put_flash(:info, "新規作成できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
