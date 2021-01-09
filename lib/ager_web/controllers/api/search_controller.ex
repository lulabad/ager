defmodule AgerWeb.Api.SearchController do
  use AgerWeb, :controller

  def index(conn, params) do
    persons = AgerWeb.PageController.search(params)
    render(conn, "index.json", persons: persons)
  end
end
