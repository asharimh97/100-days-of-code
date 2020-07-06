let findTheOldest = function (people) {
  let oldest,
    oldestAge = 0;
  people.forEach((person) => {
    const death = person.yearOfDeath || new Date().getFullYear();
    const age = death - person.yearOfBirth;
    if (age > oldestAge) {
      oldest = person;
      oldestAge = age;
    }
  });

  return oldest;
};

module.exports = findTheOldest;
