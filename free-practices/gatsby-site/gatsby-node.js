exports.createPages = ({ actions }) => {
  const { createPage } = actions;

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
};
