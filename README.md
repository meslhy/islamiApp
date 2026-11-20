# Islami

A Flutter Islamic app: read the Quran, browse the forty plus hadiths, use the tasbih counter, and listen to the radio tab. Available in Arabic and English, with light and dark themes.

## Features

- **Quran:** browse all suras and open any sura to read its full text
- **Ahadeth:** a collection of 50 hadiths bundled as local text files
- **Sebha:** a tap counter for tasbih
- **Radio:** radio tab inside the home screen
- **Settings:** switch language (Arabic / English) and theme (light / dark), saved across launches

## Tech Stack

- **Flutter / Dart**
- **State management:** provider
- **Localization:** flutter_localizations + intl (ar, en)
- **Local storage:** shared_preferences
- Quran sura text and hadith content ship as local assets

## Getting Started

```bash
flutter pub get
flutter run
```
