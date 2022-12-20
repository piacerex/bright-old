defmodule BasicWeb.SheetLive.FormComponent do
  use BasicWeb, :live_component

  alias Basic.Sheets

  @impl true
  def update(%{sheet: sheet} = assigns, socket) do
    changeset = Sheets.change_sheet(sheet)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"sheet" => sheet_params}, socket) do
    changeset =
      socket.assigns.sheet
      |> Sheets.change_sheet(sheet_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"sheet" => sheet_params}, socket) do
    save_sheet(socket, socket.assigns.action, sheet_params)
  end

  defp save_sheet(socket, :edit, sheet_params) do
    case Sheets.update_sheet(socket.assigns.sheet, sheet_params) do
      {:ok, _sheet} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Sheet updated successfully")
         |> put_flash(:info, "編集できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_sheet(socket, :new, sheet_params) do
    case Sheets.create_sheet(sheet_params) do
      {:ok, _sheet} ->
        {:noreply,
         socket
#         |> put_flash(:info, "Sheet created successfully")
         |> put_flash(:info, "新規作成できました")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
