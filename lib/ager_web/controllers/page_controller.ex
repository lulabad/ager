defmodule AgerWeb.PageController do
  use AgerWeb, :controller
  require Ecto.Query
  alias Ager.Person

  def index(conn, params) do
    persons = search(params)
    render(conn, "index.html", persons: persons)
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
