Make the code executable:
    
    #!/usr/bin/env coffee

## factorial method
 * returns the factorial of x
 * recursive
 * multiplies val by each number from 2 to x 
  *don't need to multiply be 1, 1 is the multiplicative identity

    factorial = (x, val = 1) -> if x == 1 then val else factorial x-1, val*x
        
    console.log factorial 3