import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // OrderHistory
  {
    'ifwq2r9e': {
      'en': 'Order History',
      'ar': '',
    },
    'rmvw7pfe': {
      'en': 'Below are a summary of your invoices.',
      'ar': '',
    },
    'qron9id9': {
      'en': 'All',
      'ar': '',
    },
    'm627yg1j': {
      'en': 'Order #: ',
      'ar': '',
    },
    'xo2096au': {
      'en': 'Active',
      'ar': '',
    },
    'v2i4zhv0': {
      'en': 'Order #: ',
      'ar': '',
    },
    'is1va2kn': {
      'en': 'Done',
      'ar': '',
    },
    'qn8vmw47': {
      'en': 'Order #: ',
      'ar': '',
    },
    'dfii6ug7': {
      'en': '.',
      'ar': '',
    },
  },
  // auth_2_Create
  {
    '65jnzjdd': {
      'en': 'QafilaTech',
      'ar': '',
    },
    '8dlh3uyb': {
      'en': 'Get Started',
      'ar': '',
    },
    'rcf1zn5l': {
      'en': 'Create an account by using the form below.',
      'ar': '',
    },
    't38n9sv1': {
      'en': 'Email',
      'ar': '',
    },
    'hzqxf7mb': {
      'en': 'Password',
      'ar': '',
    },
    'q0dwderc': {
      'en': 'Confirm Password',
      'ar': '',
    },
    'bd6ha3e0': {
      'en': 'Create Account',
      'ar': '',
    },
    '7fed5xct': {
      'en': 'Or sign up with',
      'ar': '',
    },
    'p0wpobr9': {
      'en': 'Continue with Google',
      'ar': '',
    },
    'nqthr9zo': {
      'en': 'Continue with Apple',
      'ar': '',
    },
    '0i9sgcgh': {
      'en': 'Already have an account? ',
      'ar': '',
    },
    '3r8z00sh': {
      'en': 'Sign in here',
      'ar': '',
    },
    '8lixzr3t': {
      'en': 'Home',
      'ar': '',
    },
  },
  // auth_2_Login
  {
    'uikimkl5': {
      'en': 'QafilaTech',
      'ar': '',
    },
    'c2w0mbcb': {
      'en': 'Welcome Back',
      'ar': '',
    },
    'g6rzx862': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': '',
    },
    'r5rmtm8g': {
      'en': 'Email',
      'ar': '',
    },
    '2lzbtify': {
      'en': 'Password',
      'ar': '',
    },
    '3k0d27za': {
      'en': 'Sign In',
      'ar': '',
    },
    'g1f8lxz8': {
      'en': 'Or sign in with',
      'ar': '',
    },
    '9i86ov01': {
      'en': 'Continue with Google',
      'ar': '',
    },
    'nhro0nbm': {
      'en': 'Continue with Apple',
      'ar': '',
    },
    '31cajylg': {
      'en': 'Don\'t have an account?  ',
      'ar': '',
    },
    'h8c3vxlt': {
      'en': 'Create Account',
      'ar': '',
    },
    'yfew34e8': {
      'en': 'Forgot password?',
      'ar': '',
    },
    'w4939kz7': {
      'en': 'Home',
      'ar': '',
    },
  },
  // auth_2_ForgotPassword
  {
    'ehtw8pyd': {
      'en': 'QafilaTech',
      'ar': '',
    },
    '92omw3a7': {
      'en': 'Forgot Password',
      'ar': '',
    },
    'aq3m1uxf': {
      'en':
          'Please fill out your email belo in order to recieve a reset password link.',
      'ar': '',
    },
    'syfvfxg0': {
      'en': 'Email',
      'ar': '',
    },
    'nfi95we7': {
      'en': 'Send Reset Link',
      'ar': '',
    },
    'na8b0v36': {
      'en': 'Home',
      'ar': '',
    },
  },
  // auth_2_createProfile
  {
    'x69nsksq': {
      'en': 'QafilaTech',
      'ar': '',
    },
    '1k4k27ur': {
      'en': 'Home',
      'ar': '',
    },
  },
  // auth_2_Profile
  {
    'kzor9ig2': {
      'en': 'Profile',
      'ar': '',
    },
    '2e1assq5': {
      'en': 'Your Account',
      'ar': '',
    },
    'xbifttz8': {
      'en': 'Edit Profile',
      'ar': '',
    },
    '4n5hwaid': {
      'en': 'App Settings',
      'ar': '',
    },
    '9lyh82rq': {
      'en': 'Support',
      'ar': '',
    },
    'y6l0leo0': {
      'en': 'Terms of Service',
      'ar': '',
    },
    'lhnpnt79': {
      'en': 'Log Out',
      'ar': '',
    },
    '57jc9h1b': {
      'en': 'Profile',
      'ar': '',
    },
  },
  // auth_2_EditProfile
  {
    'e7m0khe5': {
      'en': 'Home',
      'ar': '',
    },
  },
  // OrderSummary
  {
    '9oq7lnr3': {
      'en': 'Order ID',
      'ar': '',
    },
    '7o6p0mg3': {
      'en': 'Order Status',
      'ar': '',
    },
    '6jqi1cq0': {
      'en': 'Schedule time',
      'ar': '',
    },
    'zx67gquw': {
      'en': 'Cargo Type',
      'ar': '',
    },
    'sczcpfvu': {
      'en': 'Package Type',
      'ar': '',
    },
    'stb1f0k9': {
      'en': 'Assembly',
      'ar': '',
    },
    'eo1d1o4m': {
      'en': 'Vehicle Type',
      'ar': '',
    },
    'vlba9pyg': {
      'en': 'Hot Tub Access',
      'ar': '',
    },
    's02446q0': {
      'en': 'No Access',
      'ar': '',
    },
    'eic2ujwo': {
      'en': 'Assistance',
      'ar': '',
    },
    'llgnjig2': {
      'en': 'Units',
      'ar': '',
    },
    'vkepcq6t': {
      'en': 'Route',
      'ar': '',
    },
    'gbgk58gw': {
      'en': 'Comments/Remarks',
      'ar': '',
    },
    'mml1mm1w': {
      'en': 'TextField',
      'ar': '',
    },
    'vktoams7': {
      'en': 'Order Review',
      'ar': '',
    },
    'f1ba97mj': {
      'en': 'Order Pictures',
      'ar': '',
    },
    '2gjqca2g': {
      'en': 'Order Price',
      'ar': '',
    },
    '5zp5etn2': {
      'en': 'Total',
      'ar': '',
    },
    'v2o0fmcc': {
      'en': 'Track Order',
      'ar': '',
    },
    '3znp6ug9': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DeliveryScreen-large
  {
    'pq7mg2n4': {
      'en': 'Specify your cargo',
      'ar': '',
    },
    'awhvf1et': {
      'en': 'What are you shipping?',
      'ar': '',
    },
    'l39hxc32': {
      'en': 'Furniture',
      'ar': '',
    },
    'stk3q97x': {
      'en': 'Electronics',
      'ar': '',
    },
    't8m84jdz': {
      'en': 'Appliances',
      'ar': '',
    },
    'b9n0e8xj': {
      'en': 'Materials',
      'ar': '',
    },
    'q4vtn0is': {
      'en': 'Machinery',
      'ar': '',
    },
    '3f1pylli': {
      'en': 'Other',
      'ar': '',
    },
    'kxompp2u': {
      'en': 'How is it packaged?',
      'ar': '',
    },
    'aa50mg9q': {
      'en': 'Packed',
      'ar': '',
    },
    'n3fwjnwb': {
      'en': 'Unpackaged',
      'ar': '',
    },
    '5t1rxggu': {
      'en': 'How many packages?',
      'ar': '',
    },
    'wzvravq5': {
      'en': 'Handeling Instructions',
      'ar': '',
    },
    '2m6qoy8i': {
      'en': 'Perishable',
      'ar': '',
    },
    '8rpsoy5n': {
      'en': 'Hazerdous',
      'ar': '',
    },
    'kqgwx99r': {
      'en': 'Oversize/Heavy',
      'ar': '',
    },
    '6x0z1a7j': {
      'en': 'Keep Upright/ Do Not Tilt',
      'ar': '',
    },
    'lp2xo42k': {
      'en': 'Do Not Stack',
      'ar': '',
    },
    't67swnv1': {
      'en': 'Keep Dry',
      'ar': '',
    },
    'pb525ud3': {
      'en': 'Fragile',
      'ar': '',
    },
    '5on4kbrr': {
      'en': '',
      'ar': '',
    },
    '8msqnpf8': {
      'en': 'Upload a picture of your cargo',
      'ar': '',
    },
    '6j8asixd': {
      'en': 'Image Uploaded!',
      'ar': '',
    },
    'oma0hv2w': {
      'en': 'Upload Image',
      'ar': '',
    },
    '05c80113': {
      'en': '1',
      'ar': '',
    },
    'jldodtd4': {
      'en': 'Search Location',
      'ar': '',
    },
    '47j3ofgz': {
      'en': 'Schedule Delivery:',
      'ar': '',
    },
    '5s0ds7em': {
      'en': 'Please select...',
      'ar': '',
    },
    'skbas4km': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'pzcfk9ph': {
      'en': 'Now',
      'ar': '',
    },
    '2h7oxn3p': {
      'en': 'Delete',
      'ar': '',
    },
    'ws2aar8e': {
      'en': 'Order Summary',
      'ar': '',
    },
    '8pjxy8o8': {
      'en': 'Route details',
      'ar': '',
    },
    'o3m0g0ab': {
      'en': 'Cargo details',
      'ar': '',
    },
    'knp55wwe': {
      'en': 'Selected Cargo -',
      'ar': '',
    },
    'm2grua8g': {
      'en': 'Package Type -',
      'ar': '',
    },
    '24ugn6kx': {
      'en': 'Handling Instructions -',
      'ar': '',
    },
    'wktoyust': {
      'en': 'Vehicle Type -',
      'ar': '',
    },
    '8r3p1dmg': {
      'en': 'Assembly -',
      'ar': '',
    },
    'mab2ynl3': {
      'en': 'Additional Information',
      'ar': '',
    },
    'tbrnxgz0': {
      'en': '',
      'ar': '',
    },
    'zm3c3hay': {
      'en':
          'Please fill in any information you wold like the driver to know like pick up and drop off contact information.',
      'ar': '',
    },
    '1czs7apx': {
      'en': 'Additional Information',
      'ar': '',
    },
    'h7x101pa': {
      'en': 'What type of vehicle do you need?',
      'ar': '',
    },
    'midy2a9x': {
      'en': 'Minivan',
      'ar': '',
    },
    'c8mavuy9': {
      'en': '20-30 OMR',
      'ar': '',
    },
    '2hajqba6': {
      'en': 'Flatbed',
      'ar': '',
    },
    '0dd6f68o': {
      'en': '30-40 OMR',
      'ar': '',
    },
    'kkr3w3ve': {
      'en': 'Boxtruck',
      'ar': '',
    },
    '6n5vdpzo': {
      'en': '40-50 OMR',
      'ar': '',
    },
    'neu3zhus': {
      'en': 'Semi-Trailer',
      'ar': '',
    },
    'l2gyva9j': {
      'en': '50-60 ORM',
      'ar': '',
    },
    'pdp4k6mv': {
      'en': '18-Wheeler',
      'ar': '',
    },
    'cchbr5k8': {
      'en': '60-70 OMR',
      'ar': '',
    },
    'qjyym4by': {
      'en': 'Does your cargo need to be assembled?',
      'ar': '',
    },
    '1qqnfxgi': {
      'en': 'Assembly on Pick-up',
      'ar': '',
    },
    '1m8c92jr': {
      'en': 'Assembly on Drop-off',
      'ar': '',
    },
    'lqrn6q85': {
      'en': 'Assembly on both',
      'ar': '',
    },
    'vqzf501e': {
      'en': 'No Assembly Required',
      'ar': '',
    },
    'nbvlxpne': {
      'en': 'Assembly on Pick-up',
      'ar': '',
    },
    'ydw2uysn': {
      'en': 'How many helpers do you need?',
      'ar': '',
    },
    'ovvf1ufz': {
      'en': 'Who will be receiving the package',
      'ar': '',
    },
    '5sd2nogc': {
      'en': 'Receiving Party: ',
      'ar': '',
    },
    'adorqgvx': {
      'en': 'Checkout',
      'ar': '',
    },
    'n1gmfyy9': {
      'en': 'Fill in the information below to place your order.',
      'ar': '',
    },
    'mwlokmib': {
      'en': 'Save card details',
      'ar': '',
    },
    'bjo3d0cv': {
      'en': 'Your details can be used for later orders',
      'ar': '',
    },
    'ieoh5hw8': {
      'en': 'Apple Pay',
      'ar': '',
    },
    'vfpfjp5i': {
      'en': 'Pay w/Paypal',
      'ar': '',
    },
    'eakk7oer': {
      'en': 'Or use an option above',
      'ar': '',
    },
    '5jar5v66': {
      'en': 'Delivery',
      'ar': '',
    },
    'rvjxgh84': {
      'en': 'Base Price -',
      'ar': '',
    },
    '46pfr1s1': {
      'en': 'Service Charge -',
      'ar': '',
    },
    '6j3ir5j1': {
      'en': ' 5%',
      'ar': '',
    },
    '8ruiu9fb': {
      'en': 'Total',
      'ar': '',
    },
    'plox68z9': {
      'en': '',
      'ar': '',
    },
    '9kzk3esc': {
      'en': 'Next',
      'ar': '',
    },
    'vohj7u56': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Home-Individual
  {
    '57g47zk3': {
      'en': 'Home',
      'ar': '',
    },
    'jo5mrmoy': {
      'en': 'Start ',
      'ar': '',
    },
    'ytrgborq': {
      'en': 'ordering',
      'ar': '',
    },
    'k6w7t492': {
      'en': 'Light Delivery',
      'ar': '',
    },
    '8gcg7kny': {
      'en': 'Package weight <5kg.',
      'ar': '',
    },
    'aobe5zbo': {
      'en': 'Heavy Delivery',
      'ar': '',
    },
    '3li4pz2h': {
      'en': 'Package weight >5kg.',
      'ar': '',
    },
    '4wswr1n3': {
      'en': 'Order ',
      'ar': '',
    },
    'ki1zwsc2': {
      'en': 'tracking',
      'ar': '',
    },
    'indmmcz1': {
      'en': 'Current order',
      'ar': '',
    },
    'vmwk4vw4': {
      'en': 'What\'s ',
      'ar': '',
    },
    '40uemps6': {
      'en': 'new',
      'ar': '',
    },
    'frjdkqto': {
      'en': 'Favorite ',
      'ar': '',
    },
    'wi2ker29': {
      'en': 'location',
      'ar': '',
    },
    'klo20vzw': {
      'en': 'Notifications',
      'ar': '',
    },
    'sdqchz41': {
      'en': 'New',
      'ar': '',
    },
    '75kzf1uj': {
      'en': 'New Product View',
      'ar': '',
    },
    'lldcg4d4': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    '8xp3ww2t': {
      'en': '3m ago',
      'ar': '',
    },
    'pcc0z3vt': {
      'en': 'New Product View',
      'ar': '',
    },
    'gceczpjy': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    '9biwqdlz': {
      'en': '3m ago',
      'ar': '',
    },
    'bobkmphi': {
      'en': 'All',
      'ar': '',
    },
    'ewc1cboc': {
      'en': 'New Product View',
      'ar': '',
    },
    'avm9eu8g': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'x14tpkzp': {
      'en': '3m ago',
      'ar': '',
    },
    't1melxlx': {
      'en': 'New Product View',
      'ar': '',
    },
    'kstyj09y': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'dgkomjlu': {
      'en': '3m ago',
      'ar': '',
    },
    '0hxm6emp': {
      'en': 'Qafila',
      'ar': '',
    },
    'df5vdfvp': {
      'en': 'Tech.',
      'ar': '',
    },
    'fh3rdc0y': {
      'en': 'Platform Navigation',
      'ar': '',
    },
    'zyg34fch': {
      'en': 'Chats',
      'ar': '',
    },
    'nmgfrplj': {
      'en': 'Support Center',
      'ar': '',
    },
    'z9bp8tmd': {
      'en': 'Payment methods',
      'ar': '',
    },
    '2a7hq04j': {
      'en': 'App Settings',
      'ar': '',
    },
    'ntwaiars': {
      'en': 'Light Mode',
      'ar': '',
    },
    'up1e5uo4': {
      'en': 'Dark Mode',
      'ar': '',
    },
    '4xj4b5bm': {
      'en': 'Home',
      'ar': '',
    },
  },
  // LocateRidePage
  {
    'hcdlcj45': {
      'en': 'Tracking Order',
      'ar': '',
    },
    '6fyin2c6': {
      'en': 'Found Ride',
      'ar': '',
    },
    'yl7bg9nq': {
      'en': 'Order Created',
      'ar': '',
    },
    '60ba75q4': {
      'en': 'Finding Ride...',
      'ar': '',
    },
    'guxnbnrp': {
      'en': 'Cancel',
      'ar': '',
    },
    'xpi5cth9': {
      'en': 'Arriving in -',
      'ar': '',
    },
    'afup8zv6': {
      'en': 'Cancel',
      'ar': '',
    },
    'va3xe9zq': {
      'en': 'Home',
      'ar': '',
    },
  },
  // editProfile_auth_2
  {
    'ebb0lgd6': {
      'en': 'Adjust the content below to update your profile.',
      'ar': '',
    },
    'n3nh723e': {
      'en': 'Change Photo',
      'ar': '',
    },
    'vnapqbhv': {
      'en': 'Full Name',
      'ar': '',
    },
    'nol5rlfq': {
      'en': 'Your full name...',
      'ar': '',
    },
    'ja3jpqte': {
      'en': 'Your Role',
      'ar': '',
    },
    'po9p8h40': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'uxvyjyhj': {
      'en': 'Individual',
      'ar': '',
    },
    'fpovfcmv': {
      'en': 'Business',
      'ar': '',
    },
    '10t6titz': {
      'en': 'Your City',
      'ar': '',
    },
    'utx6v0ct': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'z9jqwk74': {
      'en': 'Muscat',
      'ar': '',
    },
    'hr8j2ay2': {
      'en': 'Sohar',
      'ar': '',
    },
    'i452k4q9': {
      'en': 'Salalah',
      'ar': '',
    },
    'obwb3ad0': {
      'en': 'Batinah',
      'ar': '',
    },
  },
  // Card10Rating
  {
    'ur838l0l': {
      'en': 'Overall',
      'ar': '',
    },
    'ns4ry2yv': {
      'en': '5',
      'ar': '',
    },
    'mxgy0z3q': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'ar': '',
    },
    '3yfxbku5': {
      'en': 'Chat',
      'ar': '',
    },
  },
  // chat
  {
    'h3gusbj0': {
      'en': 'Sarah Miller',
      'ar': '',
    },
    'bhgt7ctj': {
      'en': 'Online',
      'ar': '',
    },
    'wzgokk5h': {
      'en': 'Select a response:',
      'ar': '',
    },
    '1y8q3foh': {
      'en': 'I\'d love to meet up for coffee!',
      'ar': '',
    },
    'u8etd9a1': {
      'en': 'That sounds great! What time works for you?',
      'ar': '',
    },
    'mpbu637v': {
      'en': 'How about tomorrow at 2pm?',
      'ar': '',
    },
    'v3ygqbbu': {
      'en': 'Perfect! I\'ll see you then!',
      'ar': '',
    },
    'vvumn03h': {
      'en': 'Choose your response...',
      'ar': '',
    },
  },
  // searchOrder
  {
    'xdd1ysjd': {
      'en': 'Search results',
      'ar': '',
    },
    'cl4a7u7a': {
      'en': 'Order #: ',
      'ar': '',
    },
  },
  // contactList
  {
    '6b4ysmks': {
      'en': 'Choose Category',
      'ar': '',
    },
    '9fclwks0': {
      'en': 'TextField',
      'ar': '',
    },
  },
  // contact
  {
    '2m3n1f5i': {
      'en': 'Enter contact phone number',
      'ar': '',
    },
  },
  // ReportIssueMenu
  {
    '3qxjsyeh': {
      'en': 'Report An Issue',
      'ar': '',
    },
    'ncjkmxxf': {
      'en': '1. Delivery Issue',
      'ar': '',
    },
    'w2csvhen': {
      'en': '2. App or User Experience Issue',
      'ar': '',
    },
    'be8qyb9u': {
      'en': '3. Driver/Delivery Person Issues',
      'ar': '',
    },
    '3vlgquil': {
      'en': '4. Order/Delivery Tracking Issues',
      'ar': '',
    },
    'u3ftph02': {
      'en': '5. Refund or Compensation Requests',
      'ar': '',
    },
    'ocr66fww': {
      'en': '6. Other',
      'ar': '',
    },
  },
  // DeliveryIssueMenu
  {
    'i6ggaksu': {
      'en': 'Delivery Issue',
      'ar': '',
    },
    'sb6cgn0u': {
      'en': '1. Late Delivery',
      'ar': '',
    },
    'jradltjl': {
      'en': '2. Damaged Items',
      'ar': '',
    },
    'olyi0r3k': {
      'en': '3. Wrong Items',
      'ar': '',
    },
    'xgkfk3qj': {
      'en': '4. Failed Delivery',
      'ar': '',
    },
    '3c80zumq': {
      'en': '5. Partial Delivery',
      'ar': '',
    },
  },
  // AppIssueMenu
  {
    'mdfslejd': {
      'en': 'App or User Experience Issue',
      'ar': '',
    },
    'pn5ouxn7': {
      'en': '1. App Crashes/Freezes',
      'ar': '',
    },
    'q0cyxs90': {
      'en': '2. Payment Issues',
      'ar': '',
    },
    '5kus9dfx': {
      'en': '3. Account/Login Issues',
      'ar': '',
    },
    'd25vdl7t': {
      'en': '4. Location Issues',
      'ar': '',
    },
    'ao4oo96w': {
      'en': '5. UI/Usability Issues',
      'ar': '',
    },
  },
  // DriverIssueMenu
  {
    '1z4majx5': {
      'en': 'Driver/Delivery Person Issue',
      'ar': '',
    },
    'htkmy375': {
      'en': '1. Rude or Unprofessional Behavior',
      'ar': '',
    },
    'cr1uj5gz': {
      'en': '2. Safety Concerns',
      'ar': '',
    },
    'n653zydd': {
      'en': '3. Unresponsive Driver',
      'ar': '',
    },
  },
  // TrackingIssueMenu
  {
    'zobyzc87': {
      'en': 'Order/Delivery Tracking Issue',
      'ar': '',
    },
    't9lu9dsa': {
      'en': '1. Unable to Track Delivery',
      'ar': '',
    },
    '6jhtmbkc': {
      'en': '2. No Contact Info',
      'ar': '',
    },
  },
  // RefundIssueMenu
  {
    '6w7u9b74': {
      'en': 'Refund or Compensation Request',
      'ar': '',
    },
    'mfj6948c': {
      'en': '1. Request Refund',
      'ar': '',
    },
    'z2rusvgr': {
      'en': '2. Request Compensation',
      'ar': '',
    },
  },
  // OtherIssueMenu
  {
    '2r3e0jd8': {
      'en': 'TextField',
      'ar': '',
    },
    '52c2ii5r': {
      'en': 'Submit Ticket',
      'ar': '',
    },
  },
  // IssueWithOrderSelect
  {
    '2fis7zb7': {
      'en': 'Please select the order ID of this incident.',
      'ar': '',
    },
    '9y8zqasg': {
      'en': 'Select...',
      'ar': '',
    },
    '4w8f3e3x': {
      'en': 'Search...',
      'ar': '',
    },
    'o2ytxdp2': {
      'en': 'Option 1',
      'ar': '',
    },
    '2dibue7b': {
      'en': 'Option 2',
      'ar': '',
    },
    'zobm6pyk': {
      'en': 'Option 3',
      'ar': '',
    },
    'lnaqxio5': {
      'en': 'Please write a description you have of the incident.',
      'ar': '',
    },
    'gynbt8xq': {
      'en': 'Submit Ticket',
      'ar': '',
    },
  },
  // favSave
  {
    'q117n94d': {
      'en': 'Route saved',
      'ar': '',
    },
    '0csmh47v': {
      'en': 'Give this route a name to referrence later.',
      'ar': '',
    },
    'kqxszwve': {
      'en': 'Enter the name here..',
      'ar': '',
    },
    'b39ecl1j': {
      'en': 'Save',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '3bgxxdbf': {
      'en': '',
      'ar': '',
    },
    'tuzhh7pm': {
      'en': '',
      'ar': '',
    },
    'bv4lr0k6': {
      'en': '',
      'ar': '',
    },
    'gwhafn3b': {
      'en': '',
      'ar': '',
    },
    'bqvvk6kx': {
      'en': '',
      'ar': '',
    },
    'lq5wnazo': {
      'en': '',
      'ar': '',
    },
    'ycewlp7n': {
      'en': '',
      'ar': '',
    },
    'vw9hut3z': {
      'en': '',
      'ar': '',
    },
    'mb1lqcvb': {
      'en': '',
      'ar': '',
    },
    'lscxzzbg': {
      'en': '',
      'ar': '',
    },
    '91vklc0b': {
      'en': '',
      'ar': '',
    },
    'zvqf1yfk': {
      'en': '',
      'ar': '',
    },
    'y1nx7xhq': {
      'en': '',
      'ar': '',
    },
    'qcs1p72k': {
      'en': '',
      'ar': '',
    },
    'pp80d309': {
      'en': '',
      'ar': '',
    },
    'w3bt91m6': {
      'en': '',
      'ar': '',
    },
    'f4b2oat6': {
      'en': '',
      'ar': '',
    },
    'x5wnfy7p': {
      'en': '',
      'ar': '',
    },
    '3fdpwpjr': {
      'en': '',
      'ar': '',
    },
    'i7dq0d86': {
      'en': '',
      'ar': '',
    },
    'xzf6b31k': {
      'en': '',
      'ar': '',
    },
    'm2txang3': {
      'en': '',
      'ar': '',
    },
    'me9tpemk': {
      'en': '',
      'ar': '',
    },
    'ki0mc7kj': {
      'en': '',
      'ar': '',
    },
    'oqflpiya': {
      'en': '',
      'ar': '',
    },
    '10798c3d': {
      'en': '',
      'ar': '',
    },
    'ikp4vge0': {
      'en': '',
      'ar': '',
    },
    '4afllffx': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
