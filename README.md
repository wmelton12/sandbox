This is a test repository to practice using git
===============================================

second header
-------------

_this should be in italic_

__this should be in bold__

block quote:

>As was once said
>this is true
>because I said so

- [ ] a task list item
- [ ] list syntax required
- [ ] normal **formatting**,
      @mentions, #1234 refs
- [ ] incomplete
- [x] completed

![GitHub Logo](/images/logo.png)
Format: ![Alt Text](url)

some code

	#!/usr/bin/env coffee
	nl = (x) -> print "" for num in [1...x]
	print = (x) -> console.log x
	class Book
		constructor: (@title, @author, @pubDate, @numPages) ->
		displayInfo: ->
			nl 2
			@printTitle()
			@printAuthor()
			@printPubDate()
			@printNumPages()
		printTitle: ->
			print "Title: " + @title
		printAuthor: -> 
			print "Author: " + @author
		printPubDate: ->
			print "Publication Date: " + @pubDate
		printNumPages: ->
			print "Num Pages: " + @numPages	
	
	class Journal extends Book
		constructor: (@author, @startDate, @numDates) ->
			super(@author+"'s journal", @author, @startDate, @numDates)
		printAuthor: ->
		printPubDate: ->
			print "First Entry: " + @pubDate
		printNumPages: ->
			print "Num entries: " + @numPages
		
	class Magazine extends Book
		constructor: (@magName, @society, @field, @numPages, @issue, @issueDate) ->
			super(@magName, @society, @issueDate, @numPages)
		displayInfo: ->
			super()
			@printIssueNum()
			@printField()
		printIssueNum: ->
			print "Issue number: " + @issue
		printField: ->
				print "Field: " + @field
		printPubDate: ->
			print "Issue Date: " + @issueDate

	class library
		constructor: ->
			@books = []
			@numBooks = 0
		addBook: (toAdd) ->
			@books[@numBooks] = toAdd
			@numBooks++
		getNumBooks: -> return @numBooks
		disp: ->
			book.displayInfo() for book in @books


