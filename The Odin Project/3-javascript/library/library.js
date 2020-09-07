let myLibrary = [
  {
    id: 1,
    title: "Think and Grow Rich",
    author: "Napoleon Hill",
    pages: 265,
    read: false
  },
  {
    id: 2,
    title: "Barking Up the Wrong Tree",
    author: "Eric Barker",
    pages: 305,
    read: false
  },
  {
    id: 3,
    title: "Everything is Fucked",
    author: "Mark Manson",
    pages: 292,
    read: false
  },
  {
    id: 4,
    title: "It Doesn't Have to be Crazy at Work",
    author: "Ipsum",
    pages: 270,
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

  generateTable();
}

generateTable();
