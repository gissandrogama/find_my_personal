defmodule FindMyPersonal.Teachers.Utils do
  @moduledoc """
  This module has functions that handle specific data
  """

  @type date :: Date

  @spec date_convert_br(date) :: String.t()
  def date_convert_br(date) do
    "#{date.day}/#{date.month}/#{date.year}"
  end

  @spec date_convert_br(date) :: integer
  def get_age(date) do
    today = Date.utc_today()
    age = today.year - date.year
    month = today.month - date.month

    case month < 0 || (month == 0 && today.day <= date.day) do
      true -> age - 1
      false -> age
    end
  end
end
