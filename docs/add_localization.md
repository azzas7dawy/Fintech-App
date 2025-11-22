# Adding Localization to the App

This guide explains how to add and use localization in the Fintech App using `easy_localization: ^3.0.8`.

## Overview

The app uses `easy_localization` package to support multiple languages. Currently, the app supports:
- English (en)
- Arabic (ar)

## Project Structure

```
assets/
  translations/
    en.json    # English translations
    ar.json    # Arabic translations

lib/core/constant/
  translation_keys.dart  # Translation key constants
```

## Setup

### 1. Configuration

The localization is already configured in `main.dart`:

```dart
EasyLocalization(
  supportedLocales: const [Locale('en'), Locale('ar')],
  path: 'assets/translations',
  child: const CoinsApp(),
)
```

Make sure `pubspec.yaml` includes the assets folder:

```yaml
flutter:
  assets:
    - assets/translations/
```

### 2. Using Translations in Code

#### Basic Usage

Use the `.tr()` extension method on any string to get its translation:

```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/constant/translation_keys.dart';

// Using translation keys constant
Text(TranslationKeys.settings.tr())

// Or directly with string
Text('settings'.tr())
```

#### Example in Widget

```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/constant/translation_keys.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationKeys.settings.tr()),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(TranslationKeys.general.tr()),
          ),
          ListTile(
            title: Text(TranslationKeys.myAccount.tr()),
          ),
          ListTile(
            title: Text(TranslationKeys.darkMode.tr()),
          ),
        ],
      ),
    );
  }
}
```

### 3. Adding New Translations

#### Step 1: Add to JSON Files

Add the new key-value pair to both `en.json` and `ar.json`:

**en.json:**
```json
{
  "newKey": "New Translation"
}
```

**ar.json:**
```json
{
  "newKey": "ترجمة جديدة"
}
```

#### Step 2: Add to Translation Keys Constant

Add the constant to `lib/core/constant/translation_keys.dart`:

```dart
class TranslationKeys {
  TranslationKeys._();
  
  // ... existing keys ...
  
  static const String newKey = 'newKey';
}
```

#### Step 3: Use in Code

```dart
Text(TranslationKeys.newKey.tr())
```

### 4. Changing Language Programmatically

To change the app language at runtime:

```dart
import 'package:easy_localization/easy_localization.dart';

// Change to Arabic
context.setLocale(const Locale('ar'));

// Change to English
context.setLocale(const Locale('en'));

// Or using EasyLocalization directly
await context.setLocale(const Locale('ar'));
```

#### Example: Language Switcher

```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: context.locale,
      items: const [
        DropdownMenuItem(
          value: Locale('en'),
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: Locale('ar'),
          child: Text('العربية'),
        ),
      ],
      onChanged: (Locale? locale) {
        if (locale != null) {
          context.setLocale(locale);
        }
      },
    );
  }
}
```

### 5. Getting Current Language

```dart
// Get current locale
Locale currentLocale = context.locale;

// Check if current language is Arabic
bool isArabic = context.locale.languageCode == 'ar';

// Check if current language is English
bool isEnglish = context.locale.languageCode == 'en';
```

### 6. Translation with Parameters

If you need to include variables in translations:

**en.json:**
```json
{
  "welcome": "Welcome, {name}!"
}
```

**ar.json:**
```json
{
  "welcome": "مرحباً، {name}!"
}
```

**Usage:**
```dart
Text('welcome'.tr(namedArgs: {'name': 'John'}))
// Output: "Welcome, John!" (English) or "مرحباً، John!" (Arabic)
```

### 7. Pluralization

For plural forms:

**en.json:**
```json
{
  "items": "{count} item | {count} items",
  "@items": {
    "zero": "No items",
    "one": "One item",
    "other": "{count} items"
  }
}
```

**Usage:**
```dart
Text('items'.plural(5))  // "5 items"
Text('items'.plural(1))  // "One item"
Text('items'.plural(0))  // "No items"
```

## Best Practices

1. **Always use TranslationKeys constants** instead of hardcoded strings to avoid typos and make refactoring easier.

2. **Keep JSON files in sync** - When adding a new key, add it to both language files.

3. **Use descriptive key names** - Use camelCase and make keys self-documenting (e.g., `myAccount` instead of `ma`).

4. **Organize keys logically** - Group related translations together in the JSON files.

5. **Test both languages** - Always test your app in both supported languages to ensure translations fit properly in the UI.

## Troubleshooting

### Translations not showing

1. Make sure `assets/translations/` is included in `pubspec.yaml`
2. Run `flutter pub get` after adding assets
3. Restart the app completely (hot reload may not pick up new assets)
4. Check that the key exists in both JSON files

### Missing translations

If a translation key is missing, `easy_localization` will return the key itself. Make sure:
- The key exists in the JSON file
- The JSON file is valid (no syntax errors)
- The key name matches exactly (case-sensitive)

## Resources

- [easy_localization Documentation](https://pub.dev/packages/easy_localization)
- [Flutter Internationalization Guide](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)

