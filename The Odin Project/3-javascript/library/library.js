let myLibrary = [
  {
    id: 1,
    title: "Lorem Ipsum",
    author: "Ipsum",
    pages: 200,
    read: false
  },
  {
    id: 2,
    title: "Lorem Ipsum",
    author: "Ipsum",
    pages: 200,
    read: false
  },
  {
    id: 3,
    title: "Lorem Ipsum",
    author: "Ipsum",
    pages: 200,
    read: false
  },
  {
    id: 4,
    title: "Lorem Ipsum",
    author: "Ipsum",
    pages: 200,
    read: false
  }
];

function Book(title, author, pages, read) {
  this.id = Math.round(Math.random() * 1000);
  this.title = title;
  this.author = author;
  this.pages = pages;
  this.read = read;
}

function addBookToLibrary(data) {
  const { title, author, pages, read } = data;
  book = new Book(title, author, pages, read);

  myLibrary.push(book);
}

// DOM FUNCTIONS

const form = document.querySelector("#form-add-book");

form.addEventListener("submit", function (e) {
  e.preventDefault();
  let { author, title, pages, read } = this;
  addBookToLibrary({
    title: title.value,
    author: author.value,
    pages: parseInt(pages.value) || 0,
    read: JSON.parse(read.value)
  });

  console.table(myLibrary);
});
