# ListingApp

Submission for the Real Estate Listing API

To run:
  * Clone repo
  * Navigate to project base and run `docker-compose up`
  * Navigate into the listingApp base (`cd listingApp`) 
  * Get dependencies `mix deps.get`
  * Then build the schema `mix ecto.setup`
  * Then run the included unit tests with `mix test`
  * To test HTTP requests, launch the server with `iex -S mix phx.server`

About the code:

After reading about your tech stack via the prompt, I used this as an opportunity to try/learn Elixir.
I also used Absinthe, which helped me get off the ground while starting off as I was dealing with a lot of unknown-unknowns.
By using Absinthe to generate some context files (Listing, Agent, Photo) I was able to get my bearings,
but went on to re-write (and restructure) just about everything. Existing generated code can be found in 
ListingApp.Listings, ListingApp.Agents, and ListingApp.Photos. Overall, although all deliverables are present, 
I feel that there are a lot of avenues for improvement in the code that exist due to a lack of experience in Elixir
(for example, had I known earlier about how setup_all passes a context into the
tests, the queries and mutations test files for listing would've been much cleaner), also Elixir's pipe feature is pretty sweet! 