const API_KEY = "ebb9af501be4cb21e5fc28835efcf0f5";
const url = type =>
  `https://api.openweathermap.org/data/2.5/${type}?q=Sleman&appid=${API_KEY}&cnt=5`;

fetch(url("forecast"))
  .then(res => res.json())
  .then(res => {
    console.log(res);

    renderHeading(res);
    renderForecast(res.list);
  })
  .catch(err => console.error(err));

function renderHeading(data) {
  const { city, list } = data;
  const currentTemp = document.querySelector(".current-temp");
  const currentLocation = document.querySelector(".current-location");
  const currentDay = document.querySelector(".current-day");

  const temp = convertToCelcius(list[0].main.temp);
  currentTemp.innerHTML = `${temp}<sup>o</sup>`;
  currentLocation.textContent = `${city.name}, ${city.country}`;
  currentDay.textContent = dateFns.format(new Date(list[0].dt_txt), "dddd");
}

function renderForecast(forecasts) {
  const forecastWrapper = document.querySelector(".temp__forecast");
  forecasts.map(fc => {
    const forecastItem = document.createElement("div");
    const date = new Date(fc.dt_txt);
    forecastItem.className = "forecast__item";
    forecastItem.innerHTML = `
      <p class="forecast__day">
        ${dateFns.format(date, "HH:mm")}
        <span>${dateFns.format(date, "D MMM YYYY")}</span>
      </p>

      <p class="forecast__temp">
        ${convertToCelcius(fc.main.temp)}<sup>o</sup>
        <span>${fc.weather[0].main}</span>
      </p>
    `;

    forecastWrapper.appendChild(forecastItem);
  });
}

function convertToCelcius(temp) {
  return Math.round(temp - 273);
}
