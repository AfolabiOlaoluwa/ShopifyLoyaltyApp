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
4. Adding .env file: Create or edit `.env.example` to be `.env` and add the necessary credentials from Shopify.
5. If you want your app to install through LOCAL environment, I suggest you install `ngrok` on your system and then add your forwarding url to your .env file, 
   in `PAID_ORDER_WEBHOOK_URL='put_your_forwarding_ngrok_url_here/webhooks/orders_paid'`, then you can create an app in https://partners.shopify.com/ 
   and whitelist your auth callback URL with the forwarding ngrok url e.g. `https://fe84b16e.ngrok.io/auth/shopify/callback`.
   You can whitelist localhost url as well for it to work with your localhost e.g. `http://localhost:3000/auth/shopify/callback`
6. Run `rails server` to start the app. 
7. Then go to your browser and open the app locally using your forwarding ngrok url e.g. `https://fe84b16e.ngrok.io` or you use `localhost:3000`. Then app will lead you to adding the app to your shopify store.
   ALSO, Kindly note I have leveraged on using SHOPIFY NAVIGATION links for my links and I didnt create one on the app directly.
   
##### To use already hosted Prod Environment App

1. If you like to install the app on your store from PRODUCTION environment, hop over to https://fera-loyalty.herokuapp.com and follow through installing the app in your shop.

##### Running Tests

From the root of the application just run `rspec`.

# SOME ERRORS TO NOTE

1. DELETING EARNING RULES

    Deleting Earning Rules on Localhost links to show page and that is because of incompatibility with Rails 6. 
    I have raise issues on ShopifyApp Gem as to what causes it being that I couldn't add 
    ```
    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    ```
    to Webpack and my UJS wont work well on development environment. And this is why I couldn't add Bootstrap to Webpack and I used CDN instead 
    **However, It works well on production**. You can checkout more information on the issue here https://github.com/Shopify/shopify_app/issues/817
    
    
2. After installing, and you get a page that says below, just ignore and go to your shop admin and use the app as embedded app. I believe its error error from Shopify which is not supposed to render on test shop.
    ```
    Only one step left!
    To finish setting up your new web address, go to your domain settings, click "Connect existing domain", and enter: myshopify.com
    ```

### Note

1. To have access to Sidekiq on production, use https://fera-loyalty.herokuapp.com/sidekiq. I didnt lock it specifically to admin. So It is accessible.
2. To have access to Sidekiq on development environment, use http://localhost:3000/sidekiq or https://your_ngrok_url_here/sidekiq.