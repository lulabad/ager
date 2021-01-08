defmodule Ager.Person do
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  use Ecto.Schema

  schema "person" do
    field :full_name, :string
    field :birthday, :date
    field :age, :integer, virtual: true
  end

  def changeset(person, params) do
    person
    |> cast(params, [:full_name, :birthday])
    |> validate_required(:full_name)
  end

  def search(search_term) do
    wildcard_search = "%#{search_term}%"

    query =
      from p in Ager.Person,
        where: ilike(p.full_name, ^wildcard_search),
        order_by: p.full_name

    Ager.Repo.all(query)
    |> Enum.map(fn x -> Map.put(x, :age, Ager.Utils.calculate_age(x.birthday)) end)
  end
end
