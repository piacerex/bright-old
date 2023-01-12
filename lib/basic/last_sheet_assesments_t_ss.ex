defmodule Basic.LastSheetAssesmentsTSs do
  @moduledoc """
  The LastSheetAssesmentsTSs context.
  """

  import Ecto.Query, warn: false
  alias Basic.Repo

  alias Basic.LastSheetAssesmentsTSs.LastSheetAssesmentsTS

  @doc """
  Returns the list of last_sheet_assesments_tss.

  ## Examples

      iex> list_last_sheet_assesments_tss()
      [%LastSheetAssesmentsTS{}, ...]

  """
  def list_last_sheet_assesments_tss do
    Repo.all(LastSheetAssesmentsTS)
  end

  @doc """
  Gets a single last_sheet_assesments_ts.

  Raises `Ecto.NoResultsError` if the Last sheet assesments ts does not exist.

  ## Examples

      iex> get_last_sheet_assesments_ts!(123)
      %LastSheetAssesmentsTS{}

      iex> get_last_sheet_assesments_ts!(456)
      ** (Ecto.NoResultsError)

  """
  def get_last_sheet_assesments_ts!(id), do: Repo.get!(LastSheetAssesmentsTS, id)

  @doc """
  Creates a last_sheet_assesments_ts.

  ## Examples

      iex> create_last_sheet_assesments_ts(%{field: value})
      {:ok, %LastSheetAssesmentsTS{}}

      iex> create_last_sheet_assesments_ts(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_last_sheet_assesments_ts(attrs \\ %{}) do
    %LastSheetAssesmentsTS{}
    |> LastSheetAssesmentsTS.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a last_sheet_assesments_ts.

  ## Examples

      iex> update_last_sheet_assesments_ts(last_sheet_assesments_ts, %{field: new_value})
      {:ok, %LastSheetAssesmentsTS{}}

      iex> update_last_sheet_assesments_ts(last_sheet_assesments_ts, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_last_sheet_assesments_ts(%LastSheetAssesmentsTS{} = last_sheet_assesments_ts, attrs) do
    last_sheet_assesments_ts
    |> LastSheetAssesmentsTS.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a last_sheet_assesments_ts.

  ## Examples

      iex> delete_last_sheet_assesments_ts(last_sheet_assesments_ts)
      {:ok, %LastSheetAssesmentsTS{}}

      iex> delete_last_sheet_assesments_ts(last_sheet_assesments_ts)
      {:error, %Ecto.Changeset{}}

  """
  def delete_last_sheet_assesments_ts(%LastSheetAssesmentsTS{} = last_sheet_assesments_ts) do
    Repo.delete(last_sheet_assesments_ts)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking last_sheet_assesments_ts changes.

  ## Examples

      iex> change_last_sheet_assesments_ts(last_sheet_assesments_ts)
      %Ecto.Changeset{data: %LastSheetAssesmentsTS{}}

  """
  def change_last_sheet_assesments_ts(%LastSheetAssesmentsTS{} = last_sheet_assesments_ts, attrs \\ %{}) do
    LastSheetAssesmentsTS.changeset(last_sheet_assesments_ts, attrs)
  end

  # ADD START
  def list_last_sheet_assesments_tss_per_sheet do
    query = from( last_sheet_assesments_tss in LastSheetAssesmentsTS,
                  distinct: [last_sheet_assesments_tss.sheet_id, last_sheet_assesments_tss.account_id],
                  order_by: [desc: last_sheet_assesments_tss.inserted_at]
                )
    Repo.all(query)
  end
  # ADD END
end
