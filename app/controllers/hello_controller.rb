class HelloController < ApplicationController

  def new
    @hello = Hello.new
    
  end

  def index

    begin
      if [:hello] and not [:hello].empty?
            term = params[:hello][:search]
      end
    rescue
      term = []
    end    

    require 'rexml/document'

    ####initializes bookTitles
    file1 = File.new("public/books/books.xml")
    doc1 = REXML::Document.new(file1)
    bookIndex = doc1.root
    bookTitles = Hash.new
    authors = Hash.new
    isbns = Hash.new
    count = 0

    bookIndex.each_element('book') do |books|
      bookTitles[count] = books.attributes['name']
      authors[bookTitles[count]] = books.attributes['author']
      isbns[bookTitles[count]] = books.attributes['isbn']
      count += 1
    end

    books = Hash.new
    count = 0
    bookTitles.sort

    bookTitles.each_value do |bookTitle|
      
      if term == bookTitle 
           @results = '<li id="chain"><a href="/books/' + bookTitle.delete(' ') + '">' + bookTitle + '</li></a>'

      elsif term == authors[bookTitle] 
           @results = '<li id="chain"><a href="/books/' + bookTitle.delete(' ') + '">' + bookTitle + '</li></a>'

      elsif term == isbns[bookTitle]
           @results = '<li id="chain"><a href="/books/' + bookTitle.delete(' ') + '">' + bookTitle + '</li></a>'

      else
	   
      end
       
     end

     if @results
           render :action => 'show'
     end

  end
  
  def save
    
  end

  def show

  end

end
