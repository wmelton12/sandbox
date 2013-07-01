    #!/usr/bin/env coffee
# Bubble Sort
Common O(n-squared) in place sorting algorithm.  It passes over the array multiple times.   if it finds a value that is less than the value before it, it switches the values.

    bubbleSort = (unsortedList) ->
        temp = null;
        for i in [0 ... unsortedList.length]
            for j in [1 ... unsortedList.length - i]
                if(unsortedList[j] < unsortedList[j-1])
                    temp = unsortedList[j]
                    unsortedList[j] = unsortedList[j-1]
                    unsortedList[j-1] = temp

## tests
                
    {ok, eq, arrayEq, log, test} = require 'testy'

    list = [1,3,2,4,6,5]

    sortedList = [1,2,3,4,5,6]

    bubbleSort list

    test 'should pass', -> arrayEq list, sortedList
    test.status()
