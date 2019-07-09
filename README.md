# TeePublic Take Home Test Instructions

## How to run program

Navigate to the root directory and input the following command to install the required gems and run the program.
```
$ bundle install
$ ruby search.rb [PRODUCT_TYPE] [OPTION1 OPTION2 OPTION3 ...]
```

If you would like to test against your own JSON product list, simply add the JSON file to the root directory and replace the filename fed into the `Reader` object in `search.rb` with your own filename.


## How to run tests

Navigate to the root directory and input the following command to install the required gems and run the tests.
```
$ bundle install
$ rspec tests.rb
```