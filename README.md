# Ruby on Rails blog
Blog app that allows a user to create posts, add comments to posts and also like a post.

## Built with
Ruby
Ruby on Rails

## Getting Started

To get a local copy up and running follow these simple example steps.

## Prerequisites
  - Ruby
  - Rails
  - PostgreSQL
  - rspec-rails

## Setup

- Make sure you have Ruby IRB installed on your computer
- Clone or download this repo on your machine
- Enter project directory
## Install

```sh
bundle install
```

### Database

```sh
# Create user
sudo -u postgres createuser blog -s

# Create the database
rake db:create

# Load the schema
rails db:schema:load

## Apply migration (only if you generate a new migration file)
rails db:migrate
```
### Run

```sh
rails s
```
## Author

👤 **Abdul Wuyep**

- GitHub: [@wuyepabdul](https://github.com/wuyepabdul)
- Twitter: [@AbdulWuyep](https://twitter.com/AbdulWuyep)
- LinkedIn: [Abdul Wuyep](https://www.linkedin.com/in/abdul-wuyep/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used