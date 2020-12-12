defmodule ListingAppWeb.Resolvers.PhotosResolver do
  alias ListingApp.Photos

  def all_photos(_root, _args, _info) do
    {:ok, Photos.list_photos()}
  end

  def create_photo(_root, args, _info) do
    try do
      case Photos.create_photo(args.photo) do
        {:ok, photo} ->
          {:ok, photo}
        _error ->
          {:error, "Could not create photo"}
      end
    rescue
        Ecto.ConstraintError ->
          {:error, "Could not create photo: Listing does not exist"}
    end
  end
end