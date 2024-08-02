# Jira Board

## Requirements
You need to have **Elixir v1.3** and **PostgreSQL** installed.

## Installation instructions
To start your Jira Board app:

  1. Install dependencies with `mix deps.get`
  2. Ensure webpack is installed. ie: `npm install -g webpack`
  3. Install npm packages with `npm install`
  4. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  5. Run seeds to create demo user with `mix run priv/repo/seeds.exs`
  6. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Testing
Integration tests with Hound and Selenium ChromeDriver
  1. Install **ChromeDriver** with `npm install -g chromedriver`
  2. Run **ChromeDriver** in a new terminal window with `chromedriver &`
  3. Run tests with `mix test`

If you don't want to run integration tests just run `mix test --exclude integration`.
