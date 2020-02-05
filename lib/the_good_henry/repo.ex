defmodule TheGoodHenry.Repo do
  use Ecto.Repo,
    otp_app: :the_good_henry,
    adapter: Ecto.Adapters.Postgres
end
