// ignore_for_file: constant_identifier_names
part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const CART = _Paths.CART;
  static const LOGIN_WITH_PHONE = _Paths.LOGIN_WITH_PHONE;
  static const OTP_VIEW = _Paths.OTP_VIEW;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const LOGIN_WITH_PHONE = '/login-phone';
  static const OTP_VIEW = '/otp';
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const CART = '/cart';
}
