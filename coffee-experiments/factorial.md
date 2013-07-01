Make the code executable:

```coffeescript
#!/usr/bin/env coffee
```
## factorial method

 * returns the factorial of x
 * recursive
 * multiplies val by each number from 2 to x 
  * don't need to multiply be 1, 1 is the multiplicative identity

```coffeescript
factorial = (x, val = 1) -> if x <= 1 then val else factorial x-1, val*x
```
## tests

    {ok, eq, arrayEq, log, test} = require 'testy'
    test 'should pass', -> eq factorial(2), 2
    test 'should pass', -> eq factorial(3), 6
    test 'should pass', -> eq factorial(4), 24
    test 'should pass', -> eq factorial(5), 120
    test.status()

