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
 	remove = (list, ind) ->
 		for num in [ind + 1 ... list.length]
 			list[num - 1] = list[num]
 			list.pop
 		
 	add = (list, ind, toAdd) ->
 		for num in [ind ... list.length]
 			list[ind + 1] = list[ind]
 		list[ind] = toAdd
 	                                 
    insertionSort = (unsortedList) ->
    	div = 0
    	toInsert = null
    	ind = 0
    	while div < (unsortedList.length - 1)
    		toInsert = unsortedList[div+1]
    		ind = 0
    		while(toInsert > unsortedList[ind])
    			ind++
    		remove unsortedList, div+1
    		add unsortedList, ind, toInsert
    		div++
    		
    		
    

## tests

    {ok, eq, arrayEq, log, test} = require 'testy'

    list = [1,3,2,4,6,5]
    sortedList = [1,2,3,4,5,6]
    
    insertionSort list
	console.log list
	
    test 'should pass', -> arrayEq list, sortedList
    test.status()

