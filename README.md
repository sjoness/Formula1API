
# Formula 1 API

> This Swift library provides endpoint access to Formula 1 data provided by the [Ergast API](https://ergast.com/mrd/). By using this library, you won't have to build the interactive layer yourself, and can just start consuming the data. 

## Installing / Getting started

> Formula 1 API supports Swift Package Manager. To use SwiftPM, you should use Xcode 11 to open your project. 

Click `File` -> `Swift Packages` -> `Add Package Dependency`, enter Formula1API repo's [URL](https://github.com/gionoa/Formula1API.git). Or you can login Xcode with your GitHub account and just type Formula1API to search.

After select the package, you can choose the dependency type (tagged version, branch or commit). As of now, since there's no 1.0.0 release yet, choose `master branch`.

### Initial Configuration

No configuration needed! 

### Deploying / Publishing

You can't run this library in your own server since it interacts with the live network. If you're interested in running your own server to fetch F1 data, check out this [repository](https://github.com/Edivad99/NJS-ErgastF1API).

## Features

Formula1API provides functions that allow you to access endpoints for data. 

Currently, you can fetch: 
* `Circuits (all, specified season)`
* `Seasons`
* `Constructors (all, specified season)`
* `Race Schedule (specified season)`
* `Race Results (specified season)`
* `Qualifying Results (specified season)`,
* `Pit Stops (specified season)`, 
* `Laps(specified season)`

*More endpoints will be accessible as development progresses.* 

## Usage

Usage of this library within your app or package is simple. 

Access endpoints by the `Formula1API` object. 

Example: 
```
func getRaces() async throws -> [Race] {
    let schedule = try await Formula1API.raceSchedule(for: Season.year(2022))

    return schedule.data.raceTable.races
}

func getConstructors() async throws -> Constructors {
    let constructors = try await Formula1API.allConstructors()

    return constructors
}

```

## Licensing

The code in this project is licensed under MIT license.
