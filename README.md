# SELECTRA DEMO

## Background:
Create a Ruby on Rails App to manage open and close times for different locations. The app should have:
1. Users CRUD
2. Locations CRUD with open and close time for each day of the week
3. User login
4. API RestFull to check if a location is open or close

## Requirements:
```
Ruby 2.4.0
Rails 5.0.3
```

## Bundle:
```
  bundle install
```

## DB
```
  rake db:create db:migrate
```

## RUN
```
  rails s
```

## TEST
```
  rspec
```

## API's
Every request must have .json extension
```
1. Location Status ( Return close or open )
show GET /api/location_status/id.json
```
