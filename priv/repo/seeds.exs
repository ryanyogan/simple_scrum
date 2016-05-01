alias SimpleScrum.{Repo, User}

[
  %{
    first_name: "John",
    last_name: "Doe",
    email: "john@example.com",
    password: "12345678",
    password_confirmation: "12345678"
  },
]
|> Enum.map(&User.changeset(%User{}, &1))
|> Enum.each(&Repo.insert!(&1))
