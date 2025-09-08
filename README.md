## iOS Learning Projects (Swift)

This repository contains multiple small projects I built while learning iOS development with Swift. It includes UIKit, SwiftUI, Core Data, gesture recognizers, timers, simple networking/API usage, Firebase (Auth/Firestore/Storage), and a Sticker Pack extension.

Each section below highlights a project with a short description and screenshots. Images are stored under `images/` and linked here so they render on GitHub.

### 1. FirstProject (`1_FirstProject`)
- **Topics**: UIKit basics, storyboards, image assets

Screenshots:

![FirstProject](images/1.png)
![FirstProject 2](images/1.2.png)

### 2. SimpleCalculator (`2_SimpleCalculator`)
- **Topics**: IBAction/IBOutlet, simple arithmetic UI

Screenshots:

![SimpleCalculator](images/2.png)
![SimpleCalculator 2](images/2.2.png)

### 3. BirthdayNoteTaker (`3_BirthdayNoteTaker`)
- **Topics**: TextFields, persistence basics, UIKit

Screenshots:

![BirthdayNoteTaker](images/3.png)
![BirthdayNoteTaker 2](images/3.2.png)

### 5. AlertProject (`5_AlertProject`)
- **Topics**: `UIAlertController`, basic user input flows

Screenshots:

![AlertProject](images/5.png)
![AlertProject 2](images/5.2.png)

### 6. GestureRecognizerApp (`6_GestureRecognizerApp`)
- **Topics**: UIGestureRecognizer, image interaction

Screenshots:

![GestureRecognizerApp](images/6.png)
![GestureRecognizerApp 2](images/6.2.png)

### 7. TimerProject (`7_TimerProject`)
- **Topics**: `Timer`, scheduling, basic game-like loop

Screenshots:

![TimerProject](images/7.png)
![TimerProject 2](images/7.2.png)

### 8. CatchTheKennyGame (`8_CatchTheKennyGame`)
- **Topics**: Timers, random positioning, score keeping

Screenshots:

![CatchTheKennyGame](images/8.png)
![CatchTheKennyGame 2](images/8.2.png)

### 9. LandmarkBook (`9_LandmarkBook`)
- **Topics**: TableView, detail navigation, passing data

Screenshots:

![LandmarkBook](images/9.png)
![LandmarkBook 2](images/9.2.png)

### 10. MusicianClass (`10_MusicianClass`)
- **Topics**: Classes, inheritance, basic OOP in Swift (CLI project)

### 11. SimpsonBook (`11_SimpsonBook`)
- **Topics**: Custom model (`Simpson`), selection + detail view flow

Screenshots:

![SimpsonBook](images/11.png)
![SimpsonBook 2](images/11.2.png)

### 12. ArtBookProject (`12_ArtBookProject`)
- **Topics**: Core Data (save/fetch/delete), image picking, detail view

Screenshots:

![ArtBookProject](images/12.png)
![ArtBookProject 2](images/12.2.png)
![ArtBookProject 3](images/12.3.png)

### 13. TravelBook (`13_TravelBook`)
- **Topics**: Core Data, MapKit, list + detail, annotations

Screenshots:

![TravelBook](images/13.png)
![TravelBook 2](images/13.2.png)

### 14. DarkModeProject (`14_DarkModeProject`)
- **Topics**: Dark Mode support, theming with UIKit, Core Data model skeleton

Screenshots: (no external image files provided)

### 16. PokemonStickerApp (`16_PokemonStickerApp`)
- **Topics**: iMessage Sticker Pack Extension, asset catalogs

Screenshots: (no external image files provided)

### 18. CurencyConverter (`18_CurencyConverter`)
- **Topics**: Basic networking/API call to fetch currency rates, UIKit

Screenshots:

![CurencyConverter](images/18.png)

### 19. InstaCloneFirebase (`19_InstaCloneFirebase`)
- **Topics**: Firebase (Auth/Firestore/Storage), feed, upload, settings
- Contains `GoogleService-Info.plist` for Firebase configuration

Screenshots:

![InstaCloneFirebase](images/19.png)
![InstaCloneFirebase 2](images/19.2.png)
![InstaCloneFirebase 3](images/19.3.png)

### 30. CryptoCrazySwiftUI (`30_CryptoCrazySwiftUI`)
- **Topics**: SwiftUI, MVVM, networking service for crypto prices

Screenshots:

![CryptoCrazySwiftUI](images/30.png)

## Getting Started
- Open any `*.xcodeproj` with Xcode.
- For Firebase projects, add your own `GoogleService-Info.plist` and configure Firebase in the console.
- For projects using APIs, set the appropriate endpoints/keys where applicable.

## Folder Structure
Each project lives in its own numbered directory (e.g., `11_SimpsonBook`). Most have the standard Xcode folders: `AppDelegate.swift`, `SceneDelegate.swift`, `Info.plist`, `Base.lproj`, and `Assets.xcassets`.

## Requirements
- Xcode (version compatible with Swift versions used)
- iOS Simulator or a physical iOS device for testing
- CocoaPods/SPM only if you add dependencies (not all projects require them)

## Notes
- Screenshots are in `images/` and linked relatively so they render on GitHub.
- Project names reflect the learning topic demonstrated in each app.

