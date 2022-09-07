part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const SEARCH_CITY = _Paths.HOME;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const SEARCH_CITY = '/search_city';
}
