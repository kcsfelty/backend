# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ListingApp.Repo.insert!(%ListingApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ListingApp.Agents.Agent
alias ListingApp.Repo

%Agent{name: "Jim", email: "jim@homesptter.com", phone: "555-123-4321", fax: "555-999-0101"} |> Repo.insert!
%Agent{name: "Bob", email: "bob@homesptter.com", phone: "555-321-1234", fax: "555-111-9090"} |> Repo.insert!