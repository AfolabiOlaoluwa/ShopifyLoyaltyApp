# README
 
##### Ruby Version 

* `ruby 2.6.2p47 (2019-03-13 revision 67232) [x86_64-darwin18]`

##### Rails Version 

* `Rails 6.0.0`

##### Configuration

I will advise you use `Chruby` to configure your environment with `Ruby and Rails Versions` I used for this solution before moving forward with the steps below. You can follow `https://medium.com/@hpux/using-chruby-as-the-default-ruby-version-manager-c11346e3cc` for that. When you are done, then you can proceed with the following steps:
1. Clone the repo.
2. Run `EDITOR=vim rails credentials:edit`. This creates `credentials.yml.enc` and `master.key` file for you inside `/config`. For more hint see https://gist.github.com/db0sch/19c321cbc727917bc0e12849a7565af9.
3. Run `bundle install` from the root of the application.

##### Adding .env file

1. Create or edit `.env.example` to be `.env` and add the necessary credentials from Shopify.

##### Running Tests

From the root of the application just run `rspec`.

##### SOME ERRORS TO NOTE

1. DELETING EARNING RULES

    Deleting Earning Rules on Localhost links to show page and that is because of incompatibility with Rails 6. 
    I have raise issues on ShopifyApp Gem as to what causes it being that I couldn't add 
    ```
    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    ```
    to Webpack and my UJS wont work well on development environment. And this is why I couldn't add Bootstrap to Webpack and I used CDN instead 
    **However, It works well on production**. You can checkout more information on the issue here https://github.com/Shopify/shopify_app/issues/817


### Note

1. To have access to Sidekiq on production use https://fera-loyalty.herokuapp.com/sidekiq. 
2. To have access to Sidekiq on production use http://localhost:3000/sidekiq
3. I have added http://localhost:3000/ to the App and when you run that app locally, it will install in your store and you can have access to it in your shopify admin.
