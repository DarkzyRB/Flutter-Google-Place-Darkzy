# flutter_google_places_darkzy

Google places autocomplete widgets for flutter.

- Migrated to **null-safety**.
- Updated dependencies to latest release.
- Refactoring by using **RxDart** for more power.
- Fixed many issues.
- Applied [flutter_lints](https://pub.dev/packages/flutter_lints).
- Refactored example, migrated to Android v2 embedding.

## Simple usage


According to https://stackoverflow.com/a/52545293, you need to enable billing on your account, even if you are only using the free quota.

```dart
// replace flutter_google_places by flutter_google_places_darkzy
import 'package:flutter_google_places_darkzy/flutter_google_places_darkzy.dart';

const kGoogleApiKey = 'API_KEY';

void onError(PlacesAutocompleteResponse response) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(response.errorMessage ?? 'Unknown error'),
    ),
  );
}

final Prediction? p = await PlacesAutocomplete.show(
context: context,
apiKey: kGoogleApiKey,
onError: onError,
mode: Mode.overlay, // or Mode.fullscreen
language: 'fr',
components: [Component(Component.country, 'fr')],
);

```

The library use [google_maps_webservice](https://github.com/lejard-h/google_maps_webservice) library which directly refer to the official [documentation](https://developers.google.com/maps/web-services/) for google maps web service.

