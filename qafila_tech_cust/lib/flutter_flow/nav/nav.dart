import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';
import 'package:custom_openstreetmap_vmty5u/index.dart'
    as $custom_openstreetmap_vmty5u;
import 'package:community_testing_ryusdv/index.dart'
    as $community_testing_ryusdv;
import 'package:marketplace_random_from_list_library_m7hdw4/index.dart'
    as $marketplace_random_from_list_library_m7hdw4;
import 'package:that_bottom_bar_y134zt/index.dart' as $that_bottom_bar_y134zt;

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) {
  $custom_openstreetmap_vmty5u.initializeRoutes(
    homePageWidgetName: 'custom_openstreetmap_vmty5u.HomePage',
    homePageWidgetPath: 'homePage',
  );

  $community_testing_ryusdv.initializeRoutes(
    notificationsWidgetName: 'community_testing_ryusdv.notifications',
    notificationsWidgetPath: 'notifications',
  );

  $marketplace_random_from_list_library_m7hdw4.initializeRoutes(
    homePageWidgetName: 'marketplace_random_from_list_library_m7hdw4.HomePage',
    homePageWidgetPath: 'homerPage',
  );

  $that_bottom_bar_y134zt.initializeRoutes(
    homePageWidgetName: 'that_bottom_bar_y134zt.HomePage',
    homePageWidgetPath: 'home_that-bottom-bar-y134zt',
    page2WidgetName: 'that_bottom_bar_y134zt.page2',
    page2WidgetPath: 'page2',
    page3WidgetName: 'that_bottom_bar_y134zt.page3',
    page3WidgetPath: 'page3',
  );

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: appStateNotifier,
    navigatorKey: appNavigatorKey,
    errorBuilder: (context, state) =>
        appStateNotifier.loggedIn ? HomeWidget() : LoginStartWidget(),
    routes: [
      FFRoute(
        name: '_initialize',
        path: '/',
        builder: (context, _) =>
            appStateNotifier.loggedIn ? HomeWidget() : LoginStartWidget(),
        routes: [
          FFRoute(
            name: OrderHistoryWidget.routeName,
            path: OrderHistoryWidget.routePath,
            builder: (context, params) => OrderHistoryWidget(),
          ),
          FFRoute(
            name: CreateStartWidget.routeName,
            path: CreateStartWidget.routePath,
            builder: (context, params) => CreateStartWidget(),
          ),
          FFRoute(
            name: LoginStartWidget.routeName,
            path: LoginStartWidget.routePath,
            builder: (context, params) => LoginStartWidget(),
          ),
          FFRoute(
            name: ForgotPasswordWidget.routeName,
            path: ForgotPasswordWidget.routePath,
            builder: (context, params) => ForgotPasswordWidget(),
          ),
          FFRoute(
            name: UserProfileWidget.routeName,
            path: UserProfileWidget.routePath,
            builder: (context, params) => UserProfileWidget(),
          ),
          FFRoute(
            name: EditProfileWidget.routeName,
            path: EditProfileWidget.routePath,
            builder: (context, params) => EditProfileWidget(),
          ),
          FFRoute(
            name: OrderSummaryWidget.routeName,
            path: OrderSummaryWidget.routePath,
            builder: (context, params) => OrderSummaryWidget(
              rideRef: params.getParam(
                'rideRef',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['Orders'],
              ),
            ),
          ),
          FFRoute(
            name: HomeWidget.routeName,
            path: HomeWidget.routePath,
            builder: (context, params) => HomeWidget(),
          ),
          FFRoute(
            name: ValidatePhoneWidget.routeName,
            path: ValidatePhoneWidget.routePath,
            builder: (context, params) => ValidatePhoneWidget(
              email: params.getParam(
                'email',
                ParamType.String,
              ),
              password: params.getParam(
                'password',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: VerifyPhoneWidget.routeName,
            path: VerifyPhoneWidget.routePath,
            builder: (context, params) => VerifyPhoneWidget(
              email: params.getParam(
                'email',
                ParamType.String,
              ),
              password: params.getParam(
                'password',
                ParamType.String,
              ),
              phone: params.getParam(
                'phone',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: CreateProfileWidget.routeName,
            path: CreateProfileWidget.routePath,
            builder: (context, params) => CreateProfileWidget(
              email: params.getParam(
                'email',
                ParamType.String,
              ),
              password: params.getParam(
                'password',
                ParamType.String,
              ),
              phone: params.getParam(
                'phone',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: OnboardingWidget.routeName,
            path: OnboardingWidget.routePath,
            builder: (context, params) => OnboardingWidget(),
          ),
          FFRoute(
            name: TermsScreenWidget.routeName,
            path: TermsScreenWidget.routePath,
            builder: (context, params) => TermsScreenWidget(),
          ),
          FFRoute(
            name: FavouritesScreenWidget.routeName,
            path: FavouritesScreenWidget.routePath,
            builder: (context, params) => FavouritesScreenWidget(),
          ),
          FFRoute(
            name: LocateRidePageWidget.routeName,
            path: LocateRidePageWidget.routePath,
            builder: (context, params) => LocateRidePageWidget(
              rideDetailsReference: params.getParam(
                'rideDetailsReference',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['Orders'],
              ),
              routeHelp: params.getParam<LatLng>(
                'routeHelp',
                ParamType.LatLng,
                isList: true,
              ),
            ),
          ),
          FFRoute(
            name: PaymentScreenWidget.routeName,
            path: PaymentScreenWidget.routePath,
            builder: (context, params) => PaymentScreenWidget(),
          ),
          FFRoute(
            name: SupportPageWidget.routeName,
            path: SupportPageWidget.routePath,
            builder: (context, params) => SupportPageWidget(),
          ),
          FFRoute(
            name: TermsScreenCopyWidget.routeName,
            path: TermsScreenCopyWidget.routePath,
            builder: (context, params) => TermsScreenCopyWidget(
              displayName: params.getParam(
                'displayName',
                ParamType.String,
              ),
              emailUser: params.getParam(
                'emailUser',
                ParamType.String,
              ),
              passwordUser: params.getParam(
                'passwordUser',
                ParamType.String,
              ),
              phoneNumber: params.getParam(
                'phoneNumber',
                ParamType.String,
              ),
              photoURL: params.getParam(
                'photoURL',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: InvoiceScreenWidget.routeName,
            path: InvoiceScreenWidget.routePath,
            builder: (context, params) => InvoiceScreenWidget(
              rideref: params.getParam(
                'rideref',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['Orders'],
              ),
            ),
          ),
          FFRoute(
            name: SettingsScreenWidget.routeName,
            path: SettingsScreenWidget.routePath,
            builder: (context, params) => SettingsScreenWidget(),
          ),
          FFRoute(
            name: LargeDeliveryScreenWidget.routeName,
            path: LargeDeliveryScreenWidget.routePath,
            builder: (context, params) => LargeDeliveryScreenWidget(
              favCoordinates: params.getParam<LatLng>(
                'favCoordinates',
                ParamType.LatLng,
                isList: true,
              ),
              favAddress: params.getParam<String>(
                'favAddress',
                ParamType.String,
                isList: true,
              ),
              favStatus: params.getParam(
                'favStatus',
                ParamType.bool,
              ),
              dropCount: params.getParam(
                'dropCount',
                ParamType.int,
              ),
              detectedOS: params.getParam(
                'detectedOS',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: LoadingPageWidget.routeName,
            path: LoadingPageWidget.routePath,
            builder: (context, params) => LoadingPageWidget(),
          ),
          FFRoute(
            name: $custom_openstreetmap_vmty5u.HomePageWidget.routeName,
            path: $custom_openstreetmap_vmty5u.HomePageWidget.routePath,
            builder: (context, params) =>
                $custom_openstreetmap_vmty5u.HomePageWidget(),
          ),
          FFRoute(
            name: $community_testing_ryusdv.NotificationsWidget.routeName,
            path: $community_testing_ryusdv.NotificationsWidget.routePath,
            builder: (context, params) =>
                $community_testing_ryusdv.NotificationsWidget(),
          ),
          FFRoute(
            name: $marketplace_random_from_list_library_m7hdw4
                .HomePageWidget.routeName,
            path: $marketplace_random_from_list_library_m7hdw4
                .HomePageWidget.routePath,
            builder: (context, params) =>
                $marketplace_random_from_list_library_m7hdw4.HomePageWidget(),
          ),
          FFRoute(
            name: $that_bottom_bar_y134zt.HomePageWidget.routeName,
            path: $that_bottom_bar_y134zt.HomePageWidget.routePath,
            builder: (context, params) =>
                $that_bottom_bar_y134zt.HomePageWidget(),
          ),
          FFRoute(
            name: $that_bottom_bar_y134zt.Page2Widget.routeName,
            path: $that_bottom_bar_y134zt.Page2Widget.routePath,
            builder: (context, params) => $that_bottom_bar_y134zt.Page2Widget(),
          ),
          FFRoute(
            name: $that_bottom_bar_y134zt.Page3Widget.routeName,
            path: $that_bottom_bar_y134zt.Page3Widget.routePath,
            builder: (context, params) => $that_bottom_bar_y134zt.Page3Widget(),
          )
        ].map((r) => r.toRoute(appStateNotifier)).toList(),
      ),
    ].map((r) => r.toRoute(appStateNotifier)).toList(),
  );
}

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo {
    final possibleKeys = [
      '__transition_info__',
      '__transition_info__custom_openstreetmap_vmty5u',
      '__transition_info__community_testing_ryusdv',
      '__transition_info__marketplace_random_from_list_library_m7hdw4',
      '__transition_info__that_bottom_bar_y134zt'
    ];
    for (final key in possibleKeys) {
      if (extraMap.containsKey(key)) {
        return extraMap[key] as TransitionInfo;
      }
    }
    return TransitionInfo.appDefault();
  }
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginStart';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/ChatGPT_Image_Dec_24,_2025,_12_49_49_PM.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
