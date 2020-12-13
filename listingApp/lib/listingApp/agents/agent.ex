defmodule ListingApp.Agents.Agent do
  use Ecto.Schema
  import Ecto.Changeset
  alias ListingApp.{Listings.Listing}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_fields ~w(name email)a
  @type t :: %__MODULE__{
    id: integer,
    email: string,
    phone: string,
    fax: string,
    name: string,
    listings: [Listing.t()]
  }

  schema "agents" do
    field :email, :string
    field :name, :string
    field :phone, :string
    field :fax, :string
    has_many :listings, Listing
    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = agent, attrs \\ %{}) do
    agent
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_format(attrs, :name, ~r/\D+/)
    |> validate_format(attrs, :email, ~r/@/)
    |> validate_format(attrs, :phone, ~r/\d{3}-\d{3}-\d{4}/)
    |> validate_format(attrs, :fax, ~r/\d{3}-\d{3}-\d{4}/)
  end
end
