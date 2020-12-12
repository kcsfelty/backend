defmodule ListingApp.Photos.Photo do
  use Ecto.Schema
  import Ecto.Changeset
  alias ListingApp.{Listings.Listing}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_fields ~w(url listing_id)a
  @type t :: %__MODULE__{
    id: integer,
    url: string,
    listing: Listing.t()
  }

  schema "photos" do
    field :url, :string
    belongs_to :listing, Listing
    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = photo, attrs \\ %{}) do
    photo
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
