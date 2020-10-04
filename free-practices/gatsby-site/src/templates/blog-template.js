import React, { useEffect } from "react";
import { graphql } from "gatsby";

const BlogTemplate = ({ data }) => {
  const {
    markdownRemark: { frontmatter, html }
  } = data;
  const { title, author, slug, date } = frontmatter;
  useEffect(() => {
    console.log(data);
  });
  return (
    <div>
      <h1>{title}</h1>
      <p>
        By: {author} <br />
        <small>On {date}</small>
      </p>
      <div dangerouslySetInnerHTML={{ __html: html }} />
    </div>
  );
};

export const pageQuery = graphql`
  query($path: String!) {
    markdownRemark(frontmatter: { path: { eq: $path } }) {
      html
      frontmatter {
        title
        date(formatString: "dddd, D MMMM YYYY")
        author
        tags
      }
    }
  }
`;

export default BlogTemplate;
