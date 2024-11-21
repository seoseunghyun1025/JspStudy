// weather.js

function fetchWeather(apiKey) {
    const url = `https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=${apiKey}&units=metric`;

    return fetch(url)
        .then(response => response.json())
        .then(json => {
            console.log(json);

            const result = `
                온도 : ${Math.floor(json.main.temp)}ºC<br><br>
                습도 : ${json.main.humidity}%<br><br>
                바람 : ${json.wind.speed}m/s<br><br>
                최고 온도 : ${Math.floor(json.main.temp_max)}ºC<br><br>
                최저 온도 : ${Math.floor(json.main.temp_min)}ºC
            `;

            const icon = json.weather[0].icon;
            const iconUrl = `http://openweathermap.org/img/wn/${icon}.png`;

            return { result, iconUrl };
        })
        .catch(error => {
            console.error('날씨 정보를 가져오는 중 에러 발생:', error);
            return { result: '날씨 정보를 가져오지 못했습니다.', iconUrl: '' };
        });
}