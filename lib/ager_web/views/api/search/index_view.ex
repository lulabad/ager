defmodule AgerWeb.Api.SearchView do
  use AgerWeb, :view

  def render("index.json", %{persons: persons}) do
    %{data: render_many(persons, AgerWeb.Api.SearchView, "person.json", as: :person)}
  end

  def render("person.json", %{person: person}) do
    %{full_name: person.full_name, age: person.age}
  end
end
