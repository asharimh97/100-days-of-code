import React from "react";
import PropTypes from "prop-types";
import { format } from "date-fns";

const CardBook = ({ book }) => {
  const { image, title, author, read_at: date, description } = book;
  console.log(book);
  return (
    <div data-test="card-book">
      <div data-test="book-cover" className="relative h-48 w-full">
        <img
          src={image}
          alt={title}
          className="absolute w-full h-full left-0 top-0 object-center object-cover"
        />
      </div>
      <div className="p-6">
        <h1 className="text-xl font-bold text-gray-700 mb-2">{title}</h1>
        <p className="text-base text-gray-400 mb-4">{description}</p>
        <div className="flex items-center">
          <img
            src="https://images.unsplash.com/photo-1491528323818-fdd1faba62cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
            alt={author}
            className="w-10 h-10 rounded-full mr-4"
          />

          <div>
            <p className="text-base text-gray-600 font-semibold truncate">
              {author}
            </p>
            <p className="text-sm text-gray-400">
              {format(new Date(date), "MMMM yyyy")}
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};

CardBook.propTypes = {
  book: PropTypes.object
};

CardBook.defaultProps = {
  book: {
    image:
      "https://images.unsplash.com/photo-1512820790803-83ca734da794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    title: "Zero To One",
    author: "Peter Thiel",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil alias, eum ex modi repellendus",
    read_at: "2020-08-01"
  }
};

export default CardBook;
