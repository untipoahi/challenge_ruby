# HeyURL! Code Challenge

This repository has been created as a code challenge for candidates with
FullStack Labs.

## Challenge
See [CHALLENGE.md](./CHALLENGE.md)

## Getting Started

1. Clone repository

2. Install Ruby version

```sh
$ rvm install 2.6.5
```

3. Install PostgreSQL >9.4

```sh
$ brew install postgresql
```

4. Run setup
```sh
$ bin/setup
```

## Considerations

1. Check routes defined in `config/routes.rb`
1. Check controller actions in `app/controllers/urls_controller.rb`
1. Check views in `app/views/urls/`
1. Google Charts is already added to display charts, you can use any library
1. Use the `browser` gem already installed to extract information about each
   click tracked
