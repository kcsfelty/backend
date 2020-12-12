defmodule ListingApp.Repo do
  use Ecto.Repo,
    otp_app: :listingApp,
    adapter: Ecto.Adapters.Postgres
end
