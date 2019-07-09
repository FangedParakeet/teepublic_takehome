# TeePublic Take Home Test

## Project Summary
Given a JSON file of product data, write a program that takes in a product type, and zero or more product options, and returns the remaining product option categories with the available options.

### Specification
- A command line program that takes in a product type and 0 or more product options. `./my_program product_type [option1 option2 option3]`
- Returns non-inputted product option categories with the unique options available.
- A product list `products.json` is included;  your app should load it or otherwise be able to handle a new product list (with the same specification) being swapped in.
- For the sake of simplicity, you can assume options will always be in the order specified in `products.json`.

### Example Input/Output
Example: Product type only.
```
> ./my_program tshirt
Gender: male, female
Color: red, blue, green
Size: small, medium, large, extra-large, 2x-large
```

Example:  No Female 2x-large size.
```
> ./my_program tshirt female
Color: red, blue, green
Size: small, medium, large, extra-large
```

```
> ./my_program sticker
Size: x-small, small, medium, large, x-large
Style: matte, glossy
```

```
> ./my_program sticker small
Style: matte
```


## Implementation Requirements
- Your application should included automated tests.
- You should write clean, concise, well-written code you'd be happy to submit to an open source project.
- Your code should reflect an object-oriented understanding of the problem domain.
- Your code should be easy to extend; we'll re-use it later in the interview process.

## Deliverables
- A GitHub repo or zip file (with git data) with source code of your program.
- Instructions on how to run view the output of your program (terminal, webpage, etc)
- Instructions running tests locally.

## Notes
- You may use any language or framework you'd like (including no framework at all).  The program should be command line executable (no webpages please).
- Google, StackOverflow away!  Use gems, npm, or other libraries like you would in the real world.  Bear in mind there is an important difference between inspiration/help and plagarism/theft! 
- While the problem can be solved in O(n) time, the ideal solution works in O(1) time.

## Appendix
### Product List Schema
```
[
  {
    "id": 1,
    "product_type": "tshirt",
    "options": {
      "gender": "male",
      "color": "red",
      "size": "small"
    }
  }
]
```
- You can assume the order of options in the product list is consistent.  (For example, the ordering of options in the first appearance of a product is the heirarchy of options, and will be the same for every other product of that type.)  This is also the expect input order for command line product options.
- Do not assume every option will be present on every product type.

#### Notes
- products.json: https://gist.github.com/JoeMcB/54cc11f643ccacf89e2d988eaf6bc0ab