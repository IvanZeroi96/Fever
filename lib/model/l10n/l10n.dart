import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Localizationes {
  Localizationes(this.locale);

  final Locale locale;

  static Localizationes? of(BuildContext context) {
    return Localizations.of<Localizationes>(context, Localizationes);
  }

  static const LocalizationesDelegete delegate = LocalizationesDelegete();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'Today': 'Today',
      'SelectCityTitle': 'Select a city',
    },
    'es': {
      'Today': 'Hoy',
      'SelectCityTitle': 'Selecciona una ciudad',
    },
  };

  String get today {
    return _localizedValues[locale.languageCode]!['Today'] ?? '';
  }

  String get selectCityTitle {
    return _localizedValues[locale.languageCode]!['SelectCityTitle'] ?? '';
  }
}

class LocalizationesDelegete extends LocalizationsDelegate<Localizationes> {
  const LocalizationesDelegete();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<Localizationes> load(Locale locale) {
    return SynchronousFuture<Localizationes>(Localizationes(locale));
  }

  @override
  bool shouldReload(LocalizationesDelegete old) => false;
}
