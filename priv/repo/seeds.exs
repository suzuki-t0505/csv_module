alias CsvModule.Person

[
  %Person{name: "Emily", age: 18},
  %Person{name: "Bob", age: 10},
  %Person{name: "Nick", age: 18},
  %Person{name: "Alia", age: 22},
  %Person{name: "Jim", age: 25},
]
|> Enum.each(& Csv.Repo.insert(&1))
