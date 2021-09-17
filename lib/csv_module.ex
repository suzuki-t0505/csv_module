defmodule CsvModule do
  alias CsvModule.Customeres
  def read_csv(csv_file) do
    File.read!(csv_file)
  end

  def processing_csv(data) do
    [field_name | value] = String.split(data, "\r\n")

    field =
    String.split(field_name, ",")
    |> Enum.map(fn name ->
      case name do
        "取引先番号" -> :customer_number
        "取引先名称" -> :customer_name
        "与信スコア" -> :credit_score
        "都道府県" -> :prefectures
      end
    end)

    Enum.map(value, &String.split(&1, ","))
    |> Enum.map(&Enum.into(Enum.zip(field, &1), %{}))
    |> Enum.map(&Map.update(&1, :credit_score, 0, fn number -> String.to_integer(number) end))
  end

  def main(csv_file) do
    read_csv(csv_file) |> processing_csv() |> Enum.each(&Customeres.insert(&1))
  end

  def file_export() do
    datas =
    Customeres.select_all()
    |> Enum.map(& "\r\n#{&1.customer_number},#{&1.customer_name},#{&1.credit_score},#{&1.prefectures}")

    data =
    ["取引先番号,取引先名称,与信スコア,都道府県"] ++ datas
    |> Enum.join()

    File.open!("取引先データ.csv",[:write])
    |> IO.binwrite(data)
  end
end
