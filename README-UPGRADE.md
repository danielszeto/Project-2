# BakR Rails modernization (draft)

This branch upgrades the **original 2016 Rails application** without replacing it with Next.js.

## Target runtime

- Ruby 3.3.8
- Rails 8.1.4.1 (November 2026 security release)
- PostgreSQL, Puma, Sprockets, and server-rendered HTML

## Install locally

1. Install Ruby 3.3.8, PostgreSQL, and Bundler.
2. Run `bundle install` and **commit the newly generated Gemfile.lock**.
3. Run `bin/rails db:prepare`.
4. Run `bin/rails server` and visit http://localhost:3000.
5. Run `bin/rails assets:precompile` and `bin/rails test`.

This branch is **not yet tested or production-ready**. The environment used for GitHub edits cannot fetch/install Ruby gems, so Rails was not booted or tested. Check old migrations and database creation, review Bootstrap 3 styling, validate login/logout, and test listing edits and access controls.

## Important

- The old Uploadcare JavaScript is no longer loaded. Profile pictures and product photos use external image URL inputs instead.
- The old Rails 4 lockfile has been removed and must be regenerated.
- The original `master` branch is unchanged.
- Production needs `DATABASE_URL`, `SECRET_KEY_BASE`, HTTPS, and precompiled static assets.
- Do not merge or deploy until setup and automated tests succeed.
