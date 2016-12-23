# Yes, Chef!


## Overview

*Yes, Chef!* allows customers to order from a Personal Chef's menu to simplify their meal planning.

Deployed site can be found [here](https://yes-chef.herokuapp.com/) on Heroku.

Visit the landing page and sign up as a chef or customer.

### Chefs

Chefs can create **menus** and **menu items** from which customers can order from.  Every menu has an order deadline by which orders must be submitted, then a completion date by which the food will be ready for delivery or pick up.

### Customers

Customers select a chef on sign up and place orders through their chef's menu.  Customers can also see their order history and review their past orders.

## Installation

A seed file is available with dummy information.

To deploy this app you will need to set up Amazon S3 credentials.

  - Run `figaro install`
  - Store your keys in `application.yml`
    - `S3_BUCKET_NAME` is the name of your bucket
    - `AWS_REGION` is the name of your bucket's region
    - `AWS_ACCESS_KEY_ID` is your access key
    - `AWS_SECRET_ACCESS_KEY` is your secret access key

To deploy on Heroku:

  - Run `figaro heroku:set -e production` to push your keys up to Heroku

## Credits

[Alexa Anderson](https://github.com/PopularDemand)

[Catherine Kwak](https://github.com/khopsickle)

[Christian Carey](https://github.com/ChristianCarey)

[Jonathan Popenuck](https://github.com/popenuj)

[Sampson Crowley](https://github.com/SampsonCrowley)
