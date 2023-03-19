# Travel Buddy

![Travel Buddy Logo](https://somedomain.com/logo.png)

Travel Buddy is a Flutter app that helps users explore different countries and their unique cultures. This app makes use of the [REST Countries API](https://restcountries.com/) to fetch country data such as country name, flag, population, language, currency, and more.

## Features

- List of all countries
- Country details page with photo, population, currency, etc.
- Translation of country name, capital, language, and region in the user's preferred language
- Search for a country by name
- Filter countries by region, language, and currency

## Architecture

- MVVM architecture is used in the Travel Buddy app
- API calls are made using the `http` package
- Provider package is used for state management
- `shared_preferences` package is used to save the user's preferred languages

## Screenshots

![Travel Buddy Screenshot 1](https://somedomain.com/screenshot1.png)

![Travel Buddy Screenshot 2](https://somedomain.com/screenshot2.png)

## License

Travel Buddy is licensed under the MIT License. See [LICENSE](/LICENSE) for more information.