import slugify from "slugify";

export const generateId = () => {
  return "_" + Math.random().toString(36).substr(2, 9);
};

export const createSlug = name => {
  let format = {
    replacement: "-",
    lower: true,
    remove: /[*+~.,()`"'!:@/\\]/g
  };

  let generatedSlug = slugify(name, format);

  return generatedSlug;
};
