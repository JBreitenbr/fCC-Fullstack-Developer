'use strict';

const getWeather = async function (city) {
  try {
    const res = await fetch(
      `https://weather-proxy.freecodecamp.rocks/api/city/${city}`
    );
    const data = await res.json();
    if (!res.ok)
      alert('Something went wrong, please try again later');
    return data;
  } catch (err) {
    console.log(err);
  }
};

const showWeather = async function (city) {
  try {
    const data = await getWeather(city);

    if (!data) {
      throw new Error();
    }
    const weatherInfoContainer = document.querySelector(
      '.weather-info-container'
    );
    // console.log(data);
    const markup = `
        <div id="location" class="main-weather-location">
          <span class="location-label title">${
            !data.name ? 'N/A' : data.name
          }</span>
        </div>

        <div class="header-container">
          <div id="main-temperature" class="main-temp-container">
            <span class="main-weather-text header">${
              !data.main.temp ? 'N/A' : data.main.temp + ' C'
            }</span>
          </div>
          <div class="main-weather-img-container">
            <img id="weather-icon" class="img-weather-icon" src="${
              !data.weather[0].icon ? 'N/A' : data.weather[0].icon
            }" alt="${
      !data.weather[0].description ? 'N/A' : data.weather[0].description
    }" />
          </div>
          <div id="weather-main">
            <span class="weather-main-text header">${
              !data.weather[0].main ? 'N/A' : data.weather[0].main
            }</span>
          </div>
        </div>

        <div class="divider"></div>

        <div class="main-container">
          <div id="humidity">
            <span class="main-humidiy-text main">Humidity: ${
              !data.main.humidity ? 'N/A' : data.main.humidity + '%'
            }</span>
          </div>
          <div id="feels-like">
            <span class="main-feels-like-text main">Feels Like: ${
              !data.main.feels_like ? 'N/A' : data.main.feels_like + ' C'
            }</span>
          </div>
        </div>

        <div class="divider"></div>

        <div class="wind-container">
          <div class="wind-elements">
            <div id="wind">
              <span class="wind-text main">Wind: ${
                !data.wind.speed ? 'N/A' : data.wind.speed + ' m/s'
              }</span>
            </div>
            <div id="wind-gust">
              <span class="wind-gust-text main">Gusts: ${
                !data.wind.gust || data.wind.gust === undefined
                  ? 'N/A'
                  : data.wind.gust + 'm/s'
              }</span>
            </div>
          </div>

          <div class="direction-container"></div>
        </div>
  `;
    weatherInfoContainer.innerHTML = markup;
    weatherInfoContainer.classList.remove('hidden');
  } catch (err) {
    const element = document.querySelector('.weather-info-container');
    element.innerHTML =
      '<span class="msg">Something went wrong, please try again later<span>';
    element.classList.remove('hidden');

    console.log(err);
  }
};

document.getElementById('get-weather-btn').addEventListener('click', function () {
  const selection = document.getElementById('location-selector');

  if (selection.value === '') return;
  showWeather(selection.value);
  selection.value = '';
});
