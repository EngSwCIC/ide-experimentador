## How to run on development

### Install local packages

Assuming you have node/npm and rails on the right version:

On `/frontend`, run `npm install`. On backend, run `bundle install`. You may have to setup the database on backend as well, where you may choose commands from: `rails db:create`, `rails db:migrate`, `rails db:seed`, `rails db:setup`, `rails db:reset`.

### Run

Go to `/frontend` and `/backend` on separate terminals.

On backend, run

```bash
rails s
```

On frontend, run

```bash
npm run dev
```

Backend will be on `http://localhost:3000/`, and frontend on `http://localhost:5173/`.
