defmodule Ager.Repo.Migrations.InitialDb do
  use Ecto.Migration

  def change do
    create table("person") do
      add :full_name, :string, null: false
      add :birthday, :date
      add :names, {:array, :string}, default: []
    end
    create unique_index("person", :full_name)
  end
end
