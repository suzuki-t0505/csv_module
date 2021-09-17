defmodule CsvModule.Customeres do
  import Ecto.Query
  alias CsvModule.Customeres.Customer
  alias Csv.Repo


  def insert(data\\%{}) do
    Customer.changeset(%Customer{},data)
    |> Repo.insert()
  end
  def select_all(), do: from(Customer) |> Repo.all()

  def select_name(customer_name) do
    from(c in Customer, where: c.customer_name == ^customer_name)
    |> Repo.all()
  end

  def update(struct, params) do
    Customer.changeset(struct, params)
    |> Repo.update()
  end

  def delete(struct) do
    Repo.delete(struct)
  end
end
