defmodule Basic.LastAssesmentsTSs do
  @moduledoc """
  The LastAssesmentsTSs context.
  """

  import Ecto.Query, warn: false
  alias Basic.Repo

  alias Basic.LastAssesmentsTSs.LastAssesmentsTS

  @doc """
  Returns the list of last_assesments_tss.

  ## Examples

      iex> list_last_assesments_tss()
      [%LastAssesmentsTS{}, ...]

  """
  def list_last_assesments_tss do
    Repo.all(LastAssesmentsTS)
  end

  @doc """
  Gets a single last_assesments_ts.

  Raises `Ecto.NoResultsError` if the Last assesments ts does not exist.

  ## Examples

      iex> get_last_assesments_ts!(123)
      %LastAssesmentsTS{}

      iex> get_last_assesments_ts!(456)
      ** (Ecto.NoResultsError)

  """
  def get_last_assesments_ts!(id), do: Repo.get!(LastAssesmentsTS, id)

  @doc """
  Creates a last_assesments_ts.

  ## Examples

      iex> create_last_assesments_ts(%{field: value})
      {:ok, %LastAssesmentsTS{}}

      iex> create_last_assesments_ts(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_last_assesments_ts(attrs \\ %{}) do
    %LastAssesmentsTS{}
    |> LastAssesmentsTS.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a last_assesments_ts.

  ## Examples

      iex> update_last_assesments_ts(last_assesments_ts, %{field: new_value})
      {:ok, %LastAssesmentsTS{}}

      iex> update_last_assesments_ts(last_assesments_ts, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_last_assesments_ts(%LastAssesmentsTS{} = last_assesments_ts, attrs) do
    last_assesments_ts
    |> LastAssesmentsTS.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a last_assesments_ts.

  ## Examples

      iex> delete_last_assesments_ts(last_assesments_ts)
      {:ok, %LastAssesmentsTS{}}

      iex> delete_last_assesments_ts(last_assesments_ts)
      {:error, %Ecto.Changeset{}}

  """
  def delete_last_assesments_ts(%LastAssesmentsTS{} = last_assesments_ts) do
    Repo.delete(last_assesments_ts)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking last_assesments_ts changes.

  ## Examples

      iex> change_last_assesments_ts(last_assesments_ts)
      %Ecto.Changeset{data: %LastAssesmentsTS{}}

  """
  def change_last_assesments_ts(%LastAssesmentsTS{} = last_assesments_ts, attrs \\ %{}) do
    LastAssesmentsTS.changeset(last_assesments_ts, attrs)
  end

# ADD START
  def list_last_assesments_tss_per_account do
# データのあるアカウントIDを取得
#    Enum.uniq(Enum.map(0..length(list)-1, fn(n) -> Enum.at(list, n).account_id end))
#    [1, 2] account_id
# inserted_at降順、リスト先頭のデータのみ取得
#    query = from last_assesments_tss in LastAssesmentsTS,
#            order_by: [desc: last_assesments_tss.inserted_at]
#            limit: 1,
#            where: last_assesments_tss.account_id == ^account_id
    list = Repo.all(LastAssesmentsTS)
    account_ids = Enum.uniq(Enum.map(0..length(list)-1, fn(n) -> Enum.at(list, n).account_id end))

    Enum.map(0..length(account_ids)-1, fn(n) ->
                                          query = from( last_assesments_tss in LastAssesmentsTS,
                                                        order_by: [desc: last_assesments_tss.inserted_at],
                                                        limit: 1,
                                                        where: last_assesments_tss.account_id == ^Enum.at(account_ids, n))
                                          List.first(Repo.all(query))
    end)
  end
# ADD END
end
