# FindMyPersonal

[![ELIXIR CI](https://github.com/gissandrogama/find_my_personal/actions/workflows/elixir_ci.yml/badge.svg)](https://github.com/gissandrogama/find_my_personal/actions/workflows/elixir_ci.yml)

[![CD GCP](https://github.com/gissandrogama/find_my_personal/actions/workflows/cd_gcp.yml/badge.svg)](https://github.com/gissandrogama/find_my_personal/actions/workflows/cd_gcp.yml)

[![codecov](https://codecov.io/gh/gissandrogama/find_my_personal/branch/main/graph/badge.svg?token=F7IFFEbNIm)](https://codecov.io/gh/gissandrogama/find_my_personal)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To start your Phoenix server container-prod:

* configure a `.env` with:
  * DATABASE_URL, is url your database;
  * SECRET_KEY_BASE, to generate with comad `mix phx.gen.server`;
  * OPITIONAL: POOL_SIZE and PORT;

* Run comads:
  * `docker build -t IMAGE_NAME:TAG`, for generate an image;
  * `docker run --env-file .env -p 8082:4000 IMAGE_NAME:TAG`, to run the image you generated, with command above;

Now you can visit [`localhost:8082`](http://localhost:8082) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
