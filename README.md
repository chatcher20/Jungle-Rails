# Jungle

Jungle is an e-commerce application built with Rails 4.2 that allows user to filter products by category, add products to a shopping cart and checkout via stripe.


## Final Product Screenshots

![Home Page](https://github.com/chatcher20/jungle-rails/blob/master/public/readmepics/Homepage.png?raw=true)

![My Cart](https://github.com/chatcher20/jungle-rails/blob/master/public/readmepics/My%20Cart.png?raw=true)

![Admin Products](https://github.com/chatcher20/jungle-rails/blob/master/public/readmepics/Admin_all_prods.png?raw=true)





## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
