defmodule FindMyPersonal.Teachers.UtilsTest do
  use ExUnit.Case

  alias FindMyPersonal.Teachers.Utils

  describe "date_convert_br/1" do
    test "should convert a date to br format" do
      assert Utils.date_convert_br(~D[2022-02-08]) == "8/2/2022"
    end
  end

  describe "get_age/1" do
    test "when the date is greater than or equal to the birthday" do
      today = Date.utc_today()
      assert Utils.get_age(today) == -1
    end

    test "when the date is less than the birthday" do
      today = Date.utc_today()
      assert Utils.get_age(Date.add(today, -20)) == 0
    end
  end
end
