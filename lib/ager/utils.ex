defmodule Ager.Utils do
  def calculate_age(birthday) do
    now = Date.utc_today()
    birth_year = birthday.year
    age = now.year - birth_year

    case birthday.month > now.month do
      true -> age - 1
      _ -> age
    end
  end
end
