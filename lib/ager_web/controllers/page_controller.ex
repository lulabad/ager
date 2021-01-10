defmodule AgerWeb.PageController do
  use AgerWeb, :controller
  require Ecto.Query
  alias Ager.Person

  def index(conn, params) do
    persons = search(params)
    render(conn, "index.html", persons: persons)
  end

  def new(conn, _parmeters) do
    changeset = Person.changeset(%Person{}, %{})
    render(conn, changeset: changeset)
  end

  defp create_person(person_params) do
    %Person{}
    |> Person.changeset(person_params)
    |> Ager.Repo.insert()
  end

  def create(conn, %{"person" => person_params}) do
    case create_person(person_params) do
      {:ok, person} ->
        conn
        |> put_flash(:info, "person created")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => person_id}) do
    person = Ager.Repo.get(Person, person_id)
    Ager.Repo.delete!(person)

    conn
    |> put_flash(:info, "person deleted")
    |> redirect(to: Routes.page_path(conn, :index))
  end

  def search(params) do
    search_term = get_in(params, ["query"])

    case search_term do
      "" -> []
      nil -> []
      _ -> Person.search(search_term)
    end
  end
end
