exports.createPages = async ({ actions, graphql }) => {
  const { createPage } = actions;

  // try parsing data from array
  const simpleDatas = [
    {
      title: "Simple data 1",
      slug: "simple-data-1",
      description: "Ini mah simple data namanya"
    },
    {
      title: "Simple data 2",
      slug: "simple-data-2",
      description: "Ini mah simple data namanya"
    }
  ];

  simpleDatas.forEach(data => {
    createPage({
      path: `/simple/${data.slug}`,
      component: require.resolve(`./src/templates/simple-template.js`),
      context: {
        data
      }
    });
  });

  // parse data from blog posts file
  const result = await graphql(`
    {
      allMarkdownRemark {
        edges {
          node {
            frontmatter {
              path
            }
          }
        }
      }
    }
  `);

  if (result.errors) {
    console.error(result.errors);
  }

  result.data.allMarkdownRemark.edges.forEach(({ node }) => {
    createPage({
      path: node.frontmatter.path,
      component: require.resolve(`./src/templates/blog-template.js`)
    });
  });
};
