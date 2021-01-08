defmodule Ager.Import do
  def import() do
    File.read!("results-birthday-service.json")
    |> Jason.decode!()
    |> Enum.map(fn x ->
      %Ager.Person{full_name: x["name"], birthday: Date.from_iso8601!(x["birthday"])}
    end)
    |> Enum.each(fn x -> Ager.Repo.insert!(x) end)
  end
end
