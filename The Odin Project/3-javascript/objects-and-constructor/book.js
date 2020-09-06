function Book(title, author, pages, haveRead) {
  this.title = title;
  this.author = author;
  this.pages = pages;
  this.haveRead = haveRead;

  this.info = function () {
    const { title, author, pages } = this;
    const readContent = this.haveRead ? "have been read" : "not read yet";
    return `${title} by ${author}, ${pages} pages, ${readContent}.`;
  };
}

book = new Book("The Hobbit", "J.R.R", 295, false);

console.log(book.info());
