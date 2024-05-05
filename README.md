Apple Coding Assessment
=======================

Weather app that returns a current forecast given a valid address.

Requirements:
- Must be done in Ruby on Rails
- Accept an address as input
- Retrieve forecast data for the given address. This should include, at minimum, the current temperature (Bonus points - Retrieve high/low and/or extended forecast)
- Display the requested forecast details to the user
- Cache the forecast details for 30 minutes for all subsequent requests by zip codes. Display indicator if result is pulled from cache.


## Table of Contents

- [Prerequisites](#prerequisites)
- [Check out the repository](#check-out-the-repository)
- [Enable Caching](#enable-caching)
- [Add API key to credentials](#add-api-key-to-credentials)
- [Install Gems](#install-gems)
- [Start the Rails server](#start-the-rails-server)


## Prerequisites

The following tools are required to be installed on the system.

- Github
- Ruby [3.2.1]

## Check out the repository

```bash
git clone git@github.com:organization/weather-app.git
cd weather-app
```

## Enable Caching

By default caching is disabled.
Run the following to toggle caching:

```bash
rails dev:cache
```

## Add API key to credentials

Use an access token obtained from [API Keys](https://home.openweathermap.org/api_keys) on the OpenWeather website after registration.

Open the credentials file for editing:
```bash
rails credentials:edit
```

Paste in the API key obtained above:
```ruby
# Open Weather API
openweather_api_key: [your-api-key]
```

## Install Gems

Run `bundle install`.

## Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
