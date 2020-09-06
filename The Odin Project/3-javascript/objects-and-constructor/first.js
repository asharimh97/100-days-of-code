function Player(name, color) {
  this.name = name;
  this.color = color;
}

const Book = (name, publisher) => ({
  name,
  publisher
});

player = new Player("John", "Black");
book = Book("Lorem Ipsum", "Ipsum Ipsum");

console.log(player, player.name, player.color);

console.log(book, book.name, book.publisher);
