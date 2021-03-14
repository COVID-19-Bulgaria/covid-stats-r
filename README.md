[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License: CC BY-NC-SA 4.0][license-shield]][license-url]

<br />
<p align="center">
  <h3 align="center">COVID-19 Stats</h3>

  <p align="center">
    Visualizations about the COVID-19 spread in Bulgaria.
    <br />
    <a href="https://coronavirus-bulgaria.org/"><strong>Live Demo</strong></a>
    <br />
    <br />
    <a href="https://github.com/COVID-19-Bulgaria/covid-database/issues">Report Bug</a>
    ·
    <a href="https://github.com/COVID-19-Bulgaria/covid-database/issues">Request Feature</a>
  </p>
</p>

## Table of Contents

* [About the Project](#about-the-project)
* [Getting Started](#getting-started)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)

## About The Project

This project is a R package for generating charts about the COVID-19 spread in Bulgaria.

## Getting Started

To get a local copy follow these simple example steps.

### Installation

1. Install the package
```r
remotes::install_github("COVID-19-Bulgaria/covid-stats")
```

## Usage

Publish all charts:
```r
covid19bulgaria::publish_all_charts()
```

## Roadmap

See the [open issues](https://github.com/COVID-19-Bulgaria/covid-stats/issues) for a list of proposed features (and known issues).

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

[![Creative Commons License](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/4.0/)
Project is distributed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).

## Contact

Veselin Stoyanov:
[![LinkedIn][linkedin-shield]][linkedin-url]

[contributors-shield]: https://img.shields.io/github/contributors/COVID-19-Bulgaria/covid-stats.svg?style=flat-square
[contributors-url]: https://github.com/COVID-19-Bulgaria/covid-stats/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/COVID-19-Bulgaria/covid-stats.svg?style=flat-square
[forks-url]: https://github.com/COVID-19-Bulgaria/covid-stats/network/members
[stars-shield]: https://img.shields.io/github/stars/COVID-19-Bulgaria/covid-stats.svg?style=flat-square
[stars-url]: https://github.com/COVID-19-Bulgaria/covid-stats/stargazers
[issues-shield]: https://img.shields.io/github/issues/COVID-19-Bulgaria/covid-stats.svg?style=flat-square
[issues-url]: https://github.com/COVID-19-Bulgaria/covid-stats/issues
[license-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg?style=flat-square
[license-url]: https://creativecommons.org/licenses/by-nc-sa/4.0/
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?logo=linkedin&color=blue
[linkedin-url]: https://www.linkedin.com/in/stoyanovv/
