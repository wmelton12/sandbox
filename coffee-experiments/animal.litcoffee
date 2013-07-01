#Animal
I created this to try using classes and inheritance in coffeescript.  It is called animal.litcoffee because the example the guide used was animals, but I used books instead.
This allows it to be executed

	#!/usr/bin/env coffee
	
##Helper methods
I wrote these because I was tired of typing console.log or print ""

	print = (x) -> console.log x
	nl = (x) -> print "" for num in [1...x]
	
##Book
the base class for the rest of the function.  Accepts a string title, a string author, a string pubDate, and an int numPages in its constructor.  displayInfo prints itself.  It calls methods to print each attribute so that each attribute could be overridden in a child class.


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

			
##Journal
This class extends the book class, and represents a personal journal or diary.  Instead of a title, it uses the name's journal, and has numDates instead of numPages and startDate instead of pubDate.  Uses super's constructor, overrides several of the methods.
*printAuthor
 *useless, does nothing
*printPubDate
 *prints "First Entry: " + @pubDate instead of "Publication date", since the latter would be irrelevant
*numPages
 *prints numDates instead	
 
	class Journal extends Book
		constructor: (@author, @startDate, @numDates) ->
			super(@author+"'s journal", @author, @startDate, @numDates)
		printAuthor: ->
		printPubDate: ->
			print "First Entry: " + @pubDate
		printNumPages: ->
			print "Num entries: " + @numPages
			
##another class which extends book.
Practice calling super.		

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
			
##holds an array of books	

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

##tests

	nl 2
	a = new Book "a","a","7/01/2023",6
	a.displayInfo()
	
	nl 2
	
	b = new Journal "a","7/01/13",5 
	b.displayInfo()
	
	nl 2
	
	c = new Magazine "Science","Society of scientists","science",10, 55, "7/01/13"
	c.displayInfo()
	
	nl 2
	
	l = new library
	l.addBook(a)
	l.addBook(b)
	print "num books in l: " + l.getNumBooks()
	l.disp()