let myLibrary = [];
let generated = false;

// listen to database books
const books = database.ref("books");
books.on(
  "value",
  function (snapshot) {
    const libraries = snapshot.val();

    if (!generated) {
      Object.values(libraries).forEach(book => {
        myLibrary.push(book);
      });
      generated = true;
      generateTable();
    }
  },
  function (err) {
    console.error(err);
  }
);

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

  // add book to library
  database.ref("books/" + book.id).set({
    id: book.id,
    title: book.title,
    author: book.author,
    pages: book.pages,
    read: book.read
  });

  myLibrary.push(book);
}

// DOM FUNCTIONS

const form = document.querySelector("#form-add-book");
const table = document.querySelector("#table-list-book tbody");

form.addEventListener("submit", function (e) {
  e.preventDefault();
  let { author, title, pages, read } = this;
  addBookToLibrary({
    title: title.value,
    author: author.value,
    pages: parseInt(pages.value) || 0,
    read: JSON.parse(read.value)
  });

  form.reset();

  // console.table(myLibrary);

  generateTable();
});

function generateTable() {
  table.innerHTML = "";
  myLibrary.forEach(book => {
    const element = `
      <tr>
        <td>${book.id}</td>
        <td>${book.title}</td>
        <td>${book.author}</td>
        <td>${book.pages}</td>
        <td>${book.read ? "Read" : "Not read yet"}</td>
        <td>
          <button onclick='deleteBook(${book.id})'>Del!</button>
          <button onclick='toggleRead(${book.id})'>${
      book.read ? "Unread?" : "Read?"
    }</button>
        </td>
      </tr>
    `;

    table.innerHTML += element;
  });
}

function deleteBook(id) {
  const bookId = myLibrary.findIndex(book => book.id == id);
  myLibrary.splice(bookId, 1);

  // delete book from database
  database.ref(`books/${id}`).remove();

  generateTable();
}

function toggleRead(id) {
  const book = myLibrary.find(book => book.id == id);
  const bookId = myLibrary.findIndex(book => book.id == id);
  let newBook = {
    ...book,
    read: !book.read
  };

  myLibrary.splice(bookId, 1, newBook);

  // update database book
  database.ref().update({ [`books/${newBook.id}`]: newBook });

  generateTable();
}
