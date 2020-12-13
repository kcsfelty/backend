defmodule ListingApp.Listings.Listing do
  use Ecto.Schema
  import Ecto.Changeset
  alias ListingApp.{Agents.Agent, Photos.Photo}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_fields ~w(address city mls_id postal price state agent_id)a
  @type t :: %__MODULE__{
    id: integer,
    address: string,
    city: string,
    mls_id: string,
    postal: string,
    price: string,
    state: string,
    agent_id: string,
    agent: Agent.t(),
    photos: [Photo.t()]
  }

  schema "listings" do
    field :address, :string
    field :city, :string
    field :mls_id, :string
    field :postal, :string
    field :price, :string
    field :state, :string
    belongs_to :agent, Agent
    has_many :photos, Photo
    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = listing, attrs \\ %{}) do
    listing
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:mls_id)
  end
end
