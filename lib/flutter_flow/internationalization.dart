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

  static List<String> languages() => ['en', 'ar', 'ur'];

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
    String? urText = '',
  }) =>
      [enText, arText, urText][languageIndex] ?? '';

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
    '38m2c1vb': {
      'en': 'Below are a summary of your invoices.',
      'ar': 'فيما يلي ملخص لفواتيرك.',
      'ur': 'ذیل میں آپ کی رسیدوں کا خلاصہ ہے۔',
    },
    'z179i6k2': {
      'en': 'Active',
      'ar': 'الجميع',
      'ur': 'تمام',
    },
    'inmrablz': {
      'en': 'Order ID • ',
      'ar': 'طلب #:',
      'ur': 'آرڈر نمبر:',
    },
    'o78ttj2r': {
      'en': 'On Route',
      'ar': 'نشيط',
      'ur': 'فعال',
    },
    'g66st1so': {
      'en': 'Order ID • ',
      'ar': 'طلب #:',
      'ur': 'آرڈر نمبر:',
    },
    'ey5s3jxn': {
      'en': 'Completed',
      'ar': 'منتهي',
      'ur': 'ہو گیا',
    },
    '10iv2tba': {
      'en': 'Order ID • ',
      'ar': 'طلب #:',
      'ur': 'آرڈر نمبر:',
    },
    'dfii6ug7': {
      'en': 'Order History',
      'ar': 'سجل الطلبات',
      'ur': 'آرڈر کی تاریخ',
    },
  },
  // CreateStart
  {
    'uawnfm1b': {
      'en': 'Qafila',
      'ar': 'القافلة',
      'ur': 'قافلہ',
    },
    '8zba10to': {
      'en': '.Tech',
      'ar': '.التكنولوجيا',
      'ur': '.ٹیک',
    },
    '8hl7htmx': {
      'en': 'Get Started',
      'ar': 'البدء',
      'ur': 'شروع کریں',
    },
    '7p8ltlzo': {
      'en': 'Create an account by using the form below.',
      'ar': 'قم بإنشاء حساب باستخدام النموذج أدناه.',
      'ur': 'نیچے دیے گئے فارم کو استعمال کرکے ایک اکاؤنٹ بنائیں۔',
    },
    '60seze1x': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'ur': 'ای میل',
    },
    'g9zt9jof': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'ur': 'پاس ورڈ',
    },
    'pwayammy': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'ur': 'پاس ورڈ کی تصدیق کریں۔',
    },
    'p9nyrmzi': {
      'en': 'Email is required',
      'ar': 'البريد الإلكتروني مطلوب',
      'ur': 'ای میل درکار ہے۔',
    },
    'i3lgz0uc': {
      'en': 'Incorrect email format.',
      'ar': 'تنسيق البريد الإلكتروني غير صحيح.',
      'ur': 'غلط ای میل فارمیٹ۔',
    },
    '0xpz7deo': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'ur': 'براہ کرم ڈراپ ڈاؤن سے ایک آپشن منتخب کریں۔',
    },
    'uu81u28s': {
      'en': 'Password is required',
      'ar': 'كلمة المرور مطلوبة',
      'ur': 'پاس ورڈ درکار ہے۔',
    },
    'nl088jis': {
      'en': 'Password needs to be longer than 8 characters.',
      'ar': 'يجب أن تكون كلمة المرور أطول من 8 أحرف.',
      'ur': 'پاس ورڈ 8 حروف سے زیادہ لمبا ہونا ضروری ہے۔',
    },
    '12k4j7hf': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'ur': 'براہ کرم ڈراپ ڈاؤن سے ایک آپشن منتخب کریں۔',
    },
    'wydxflyw': {
      'en': 'Confirm Password is required',
      'ar': 'تأكيد كلمة المرور مطلوب',
      'ur': 'تصدیق کریں پاس ورڈ درکار ہے۔',
    },
    '4gqagk9h': {
      'en': 'Password needs to be longer than 8 characters.',
      'ar': 'يجب أن تكون كلمة المرور أطول من 8 أحرف.',
      'ur': 'پاس ورڈ 8 حروف سے زیادہ لمبا ہونا ضروری ہے۔',
    },
    'gxondjss': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'ur': 'براہ کرم ڈراپ ڈاؤن سے ایک آپشن منتخب کریں۔',
    },
    'lqpvb4jw': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'ur': 'اکاؤنٹ بنائیں',
    },
    'd18caoky': {
      'en': 'Or sign up with',
      'ar': 'أو قم بالتسجيل مع',
      'ur': 'یا اس کے ساتھ سائن اپ کریں۔',
    },
    '7izzd8xq': {
      'en': 'Continue with Google',
      'ar': 'متابعة مع جوجل',
      'ur': 'گوگل کے ساتھ جاری رکھیں',
    },
    'qw4hi4u7': {
      'en': 'Continue with Apple',
      'ar': 'متابعة مع Apple',
      'ur': 'ایپل کے ساتھ جاری رکھیں',
    },
    'gjro1zkk': {
      'en': 'Already have an account? ',
      'ar': 'هل لديك حساب بالفعل؟',
      'ur': 'پہلے سے ہی اکاؤنٹ ہے؟',
    },
    '6z0w4x9j': {
      'en': 'Sign in here',
      'ar': 'سجل الدخول هنا',
      'ur': 'یہاں سائن ان کریں۔',
    },
    '9eq8eu4z': {
      'en': 'An App Developed by QafilaTech ©',
      'ar': 'تطبيق تم تطويره بواسطة QafilaTech ©',
      'ur': 'KafilaTech © کی طرف سے تیار کردہ ایک ایپ',
    },
    '8lixzr3t': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // LoginStart
  {
    'ia54wxt8': {
      'en': 'Qafila',
      'ar': 'القافلة',
      'ur': 'قافلہ',
    },
    'mbe9qn3e': {
      'en': '.Tech',
      'ar': '.التكنولوجيا',
      'ur': '.ٹیک',
    },
    'acgrn6cj': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
      'ur': 'دوبارہ خوش آمدید',
    },
    '9za7s502': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': 'قم بملء المعلومات أدناه لتتمكن من الوصول إلى حسابك.',
      'ur':
          'اپنے اکاؤنٹ تک رسائی حاصل کرنے کے لیے نیچے دی گئی معلومات کو پُر کریں۔',
    },
    'hj0zkcxw': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'ur': 'ای میل',
    },
    'hm75aojt': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'ur': 'پاس ورڈ',
    },
    '7qjpj6v8': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
      'ur': 'سائن ان کریں۔',
    },
    'qartcsti': {
      'en': 'Or sign in with',
      'ar': 'أو قم بتسجيل الدخول باستخدام',
      'ur': 'یا اس کے ساتھ سائن ان کریں۔',
    },
    'osxv828r': {
      'en': 'Continue with Google',
      'ar': 'متابعة مع جوجل',
      'ur': 'گوگل کے ساتھ جاری رکھیں',
    },
    'w84ck5dz': {
      'en': 'Continue with Apple',
      'ar': 'متابعة مع Apple',
      'ur': 'ایپل کے ساتھ جاری رکھیں',
    },
    'gfq7rvcy': {
      'en': 'Don\'t have an account?  ',
      'ar': 'ليس لديك حساب؟',
      'ur': 'اکاؤنٹ نہیں ہے؟',
    },
    'd1mmjvg3': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'ur': 'اکاؤنٹ بنائیں',
    },
    '9h2pfeio': {
      'en': 'Forgot password?',
      'ar': 'هل نسيت كلمة السر؟',
      'ur': 'پاس ورڈ بھول گئے؟',
    },
    '25fgoz41': {
      'en': 'An App Developed by QafilaTech ©',
      'ar': 'تطبيق تم تطويره بواسطة QafilaTech ©',
      'ur': 'KafilaTech © کی طرف سے تیار کردہ ایک ایپ',
    },
    'w4939kz7': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // ForgotPassword
  {
    '0qj9j6l0': {
      'en': 'Qafila',
      'ar': 'القافلة',
      'ur': 'قافلہ',
    },
    '0hhudqwn': {
      'en': '.Tech',
      'ar': '.التكنولوجيا',
      'ur': '.ٹیک',
    },
    '92omw3a7': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'ur': 'پاس ورڈ بھول گئے۔',
    },
    'aq3m1uxf': {
      'en':
          'Please fill out your email belo in order to recieve a reset password link.',
      'ar':
          'يرجى ملء بريدك الإلكتروني أدناه لتلقي رابط إعادة تعيين كلمة المرور.',
      'ur':
          'ری سیٹ پاس ورڈ کا لنک حاصل کرنے کے لیے براہ کرم اپنا ای میل بیلو پُر کریں۔',
    },
    'syfvfxg0': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'ur': 'ای میل',
    },
    'nfi95we7': {
      'en': 'Send Reset Link',
      'ar': 'إرسال رابط إعادة التعيين',
      'ur': 'ری سیٹ لنک بھیجیں۔',
    },
    'na8b0v36': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // UserProfile
  {
    'ujv1jenq': {
      'en': 'Your Account',
      'ar': 'حسابك',
      'ur': 'آپ کا اکاؤنٹ',
    },
    'bmvj9cu7': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'ur': 'پروفائل میں ترمیم کریں۔',
    },
    'mem6cud1': {
      'en': 'App Settings',
      'ar': 'إعدادات التطبيق',
      'ur': 'ایپ کی ترتیبات',
    },
    'ft0eoa6o': {
      'en': 'Settings',
      'ar': 'إعدادات',
      'ur': 'ترتیبات',
    },
    '81vks8hn': {
      'en': 'Terms of Service',
      'ar': 'شروط الخدمة',
      'ur': 'سروس کی شرائط',
    },
    '4jm2gmx0': {
      'en': 'Log Out',
      'ar': 'تسجيل الخروج',
      'ur': 'لاگ آؤٹ کریں۔',
    },
    '57jc9h1b': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'ur': 'پروفائل',
    },
  },
  // EditProfile
  {
    'uq2e9a6r': {
      'en': 'Adjust the content below to get started with QafilaTech',
      'ar': 'قم بتعديل المحتوى أدناه للبدء في استخدام QafilaTech',
      'ur':
          'QafilaTech کے ساتھ شروع کرنے کے لیے نیچے دیے گئے مواد کو ایڈجسٹ کریں۔',
    },
    'f9g0h2fk': {
      'en': 'Change Photo',
      'ar': 'تغيير الصورة',
      'ur': 'تصویر تبدیل کریں۔',
    },
    'c9efwfrz': {
      'en': 'Display Name',
      'ar': 'الاسم الأول',
      'ur': 'پہلا نام',
    },
    'jrhlrjh4': {
      'en': 'Your full name...',
      'ar': 'اسمك الكامل...',
      'ur': 'آپ کا پورا نام...',
    },
    't21jrimp': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'ur': 'ای میل ایڈریس',
    },
    'hh0nzrin': {
      'en': 'Your full name...',
      'ar': 'اسمك الكامل...',
      'ur': 'آپ کا پورا نام...',
    },
    '9at3mvnm': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
      'ur': 'فون نمبر',
    },
    'kaexp3da': {
      'en': 'Your full name...',
      'ar': 'اسمك الكامل...',
      'ur': 'آپ کا پورا نام...',
    },
    '5e6xn2sm': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'ur': 'تبدیلیاں محفوظ کریں۔',
    },
    'e7m0khe5': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // OrderSummary
  {
    '6jqi1cq0': {
      'en': 'Schedule time',
      'ar': 'جدولة الوقت',
      'ur': 'وقت طے کریں۔',
    },
    'zx67gquw': {
      'en': 'Cargo Type',
      'ar': 'نوع الشحنة',
      'ur': 'کارگو کی قسم',
    },
    'hzqud3rn': {
      'en': 'Vehicle Type',
      'ar': 'نوع المركبة',
      'ur': 'گاڑی کی قسم',
    },
    'eo1d1o4m': {
      'en': 'Assistance Required',
      'ar': 'نوع المركبة',
      'ur': 'گاڑی کی قسم',
    },
    'vlba9pyg': {
      'en': 'Hot Tub Access',
      'ar': 'الوصول إلى حوض الاستحمام الساخن',
      'ur': 'ہاٹ ٹب تک رسائی',
    },
    's02446q0': {
      'en': 'No Access',
      'ar': 'لا يوجد وصول',
      'ur': 'کوئی رسائی نہیں۔',
    },
    'vkepcq6t': {
      'en': 'Route',
      'ar': 'طريق',
      'ur': 'راستہ',
    },
    'gbgk58gw': {
      'en': 'Comments',
      'ar': 'التعليقات/الملاحظات',
      'ur': 'تبصرے/ریمارکس',
    },
    'mml1mm1w': {
      'en': 'TextField',
      'ar': 'حقل النص',
      'ur': 'ٹیکسٹ فیلڈ',
    },
    'vktoams7': {
      'en': 'Order Review',
      'ar': 'مراجعة الطلب',
      'ur': 'آرڈر کا جائزہ',
    },
    'f1ba97mj': {
      'en': 'Order Pictures',
      'ar': 'طلب الصور',
      'ur': 'تصاویر آرڈر کریں۔',
    },
    '2gjqca2g': {
      'en': 'Order Price',
      'ar': 'سعر الطلب',
      'ur': 'آرڈر کی قیمت',
    },
    '5zp5etn2': {
      'en': 'Total',
      'ar': 'المجموع',
      'ur': 'کل',
    },
    'v2o0fmcc': {
      'en': 'Track Order',
      'ar': 'تتبع الطلب',
      'ur': 'ٹریک آرڈر',
    },
    '94aavkh4': {
      'en': 'View Invoice',
      'ar': 'تتبع الطلب',
      'ur': 'ٹریک آرڈر',
    },
    '3znp6ug9': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // Home
  {
    'ue9bbcq7': {
      'en': 'Start ',
      'ar': 'يبدأ',
      'ur': 'شروع کریں۔',
    },
    'gdf078fd': {
      'en': 'ordering',
      'ar': 'الطلب',
      'ur': 'آرڈر کرنا',
    },
    'hbx62gck': {
      'en': 'Light Delivery',
      'ar': 'توصيل الضوء',
      'ur': 'لائٹ ڈیلیوری',
    },
    'hz28f696': {
      'en': 'Package weight <5kg.',
      'ar': 'وزن العبوة <5 كجم.',
      'ur': 'پیکیج کا وزن <5 کلوگرام۔',
    },
    'b6vyxhlb': {
      'en': 'Heavy Delivery',
      'ar': 'تسليم ثقيل',
      'ur': 'بھاری ترسیل',
    },
    'xfjfzuoc': {
      'en': 'Package weight >5kg.',
      'ar': 'وزن العبوة >5 كجم.',
      'ur': 'پیکیج وزن> 5 کلوگرام۔',
    },
    'jruxetny': {
      'en': 'What\'s ',
      'ar': 'يبدأ',
      'ur': 'شروع کریں۔',
    },
    'o5djxloz': {
      'en': 'new',
      'ar': 'الطلب',
      'ur': 'آرڈر کرنا',
    },
    'hc1xesnr': {
      'en': 'Order ',
      'ar': 'طلب',
      'ur': 'آرڈر',
    },
    '7csdjzda': {
      'en': 'tracking',
      'ar': 'التتبع',
      'ur': 'ٹریکنگ',
    },
    '59a8p4bx': {
      'en': 'STATUS',
      'ar': '',
      'ur': '',
    },
    'i0e0chca': {
      'en': 'ETA',
      'ar': '',
      'ur': '',
    },
    'dif8k6o6': {
      'en': 'Favorite ',
      'ar': 'مفضل',
      'ur': 'پسندیدہ',
    },
    'o0ljo3z1': {
      'en': 'location',
      'ar': 'موقع',
      'ur': 'مقام',
    },
    '4xj4b5bm': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // ValidatePhone
  {
    '4vruz1dx': {
      'en': 'Qafila',
      'ar': 'القافلة',
      'ur': 'قافلہ',
    },
    '8cxpaknr': {
      'en': '.Tech',
      'ar': '.التكنولوجيا',
      'ur': '.ٹیک',
    },
    'ousk9e5h': {
      'en': 'Validate Phone Number',
      'ar': 'التحقق من صحة رقم الهاتف',
      'ur': 'فون نمبر کی توثیق کریں۔',
    },
    'kzlg63id': {
      'en': 'Input your number below in order to continue.',
      'ar': 'أدخل رقمك أدناه للمتابعة.',
      'ur': 'جاری رکھنے کے لیے نیچے اپنا نمبر درج کریں۔',
    },
    'km85ocp8': {
      'en': 'Select your country...',
      'ar': 'اختر بلدك...',
      'ur': 'اپنا ملک منتخب کریں...',
    },
    '38mna0si': {
      'en': 'Search...',
      'ar': 'يبحث...',
      'ur': 'تلاش کریں...',
    },
    'zw01sil3': {
      'en': 'Your phone number...',
      'ar': 'رقم هاتفك...',
      'ur': 'آپ کا فون نمبر...',
    },
    '1oxz10vd': {
      'en': 'Validate',
      'ar': 'التحقق من صحة',
      'ur': 'توثیق کریں۔',
    },
    'j3ypvlma': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // VerifyPhone
  {
    '9lumkmyw': {
      'en': 'Qafila',
      'ar': 'القافلة',
      'ur': 'قافلہ',
    },
    'dwqeyc1u': {
      'en': '.Tech',
      'ar': '.التكنولوجيا',
      'ur': '.ٹیک',
    },
    'g3z31w5j': {
      'en': 'Verification Code',
      'ar': 'رمز التحقق',
      'ur': 'تصدیقی کوڈ',
    },
    'z42xogdp': {
      'en': 'Enter the 6 digit code that you received at: ',
      'ar': 'أدخل الرمز المكون من 6 أرقام الذي تلقيته في:',
      'ur': '6 ہندسوں کا کوڈ درج کریں جو آپ کو موصول ہوا ہے:',
    },
    'cqwa0y0q': {
      'en': ' change number?',
      'ar': 'تغيير الرقم؟',
      'ur': 'نمبر تبدیل کریں؟',
    },
    'bqpmrgpl': {
      'en': 'Resend will be available in:',
      'ar': 'ستكون إعادة الإرسال متاحة في:',
      'ur': 'دوبارہ بھیجنا اس میں دستیاب ہوگا:',
    },
    'qvw4h4b7': {
      'en': ' s',
      'ar': 'س',
      'ur': 's',
    },
    'w6ho3j8m': {
      'en': 'Didn\'t get the code?',
      'ar': 'لم تحصل على الرمز؟',
      'ur': 'کوڈ نہیں ملا؟',
    },
    'bro205jb': {
      'en': 'Resend',
      'ar': 'إعادة الإرسال',
      'ur': 'دوبارہ بھیجیں۔',
    },
    'irfortw3': {
      'en': 'Continue',
      'ar': 'يكمل',
      'ur': 'جاری رکھیں',
    },
    'csc0ka5e': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // CreateProfile
  {
    '9wo9u7hk': {
      'en': 'Qafila',
      'ar': 'القافلة',
      'ur': 'قافلہ',
    },
    'dn25cm66': {
      'en': '.Tech',
      'ar': '.التكنولوجيا',
      'ur': '.ٹیک',
    },
    '9t84n9q9': {
      'en': 'Create Profile',
      'ar': 'إنشاء ملف تعريفي',
      'ur': 'پروفائل بنائیں',
    },
    '6gmppp9v': {
      'en': 'Adjust the content below to get started with QafilaTech',
      'ar': 'قم بتعديل المحتوى أدناه للبدء في استخدام QafilaTech',
      'ur':
          'QafilaTech کے ساتھ شروع کرنے کے لیے نیچے دیے گئے مواد کو ایڈجسٹ کریں۔',
    },
    'ct86gc4j': {
      'en': 'Change Photo',
      'ar': 'تغيير الصورة',
      'ur': 'تصویر تبدیل کریں۔',
    },
    'w4l230ls': {
      'en': 'Display Name',
      'ar': 'الاسم الأول',
      'ur': 'پہلا نام',
    },
    'fia6j3zq': {
      'en': 'Your display name here...',
      'ar': 'اسمك الكامل...',
      'ur': 'آپ کا پورا نام...',
    },
    'oauhw2k6': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '5a9u4s4l': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'ur': 'ای میل',
    },
    'yu6ct0lq': {
      'en': 'Your email address here...',
      'ar': 'اسمك الكامل...',
      'ur': 'آپ کا پورا نام...',
    },
    '1a1kf00u': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
      'ur': 'فون نمبر',
    },
    'hx6oumlg': {
      'en': 'Your phone number...',
      'ar': 'اسمك الكامل...',
      'ur': 'آپ کا پورا نام...',
    },
    'o03cw2zo': {
      'en': 'Create ',
      'ar': 'يخلق',
      'ur': 'بنائیں',
    },
    'kwgov10i': {
      'en': 'An App Developed by QafilaTech ©',
      'ar': 'تطبيق تم تطويره بواسطة QafilaTech ©',
      'ur': 'KafilaTech © کی طرف سے تیار کردہ ایک ایپ',
    },
    'n1pbe70c': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // Onboarding
  {
    '2tq2pc4c': {
      'en': 'Continue',
      'ar': 'يكمل',
      'ur': 'جاری رکھیں',
    },
    'q2lxee3b': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // FavouritesScreen
  {
    '8gkp8zj4': {
      'en': 'Search..',
      'ar': 'يبحث..',
      'ur': 'تلاش کریں..',
    },
  },
  // LocateRidePage
  {
    'mkmzome3': {
      'en': 'Found Ride',
      'ar': 'وجدت ركوب',
      'ur': 'سواری مل گئی۔',
    },
    'wmdmg7m6': {
      'en': 'Order Created',
      'ar': 'تم إنشاء الطلب',
      'ur': 'آرڈر بنایا گیا۔',
    },
    'vie6s4zy': {
      'en': 'Looking for your ride...',
      'ar': 'العثور على رحلة...',
      'ur': 'سواری تلاش کر رہا ہے...',
    },
    'nxnsjk4n': {
      'en': 'No one accepting? Try increasing\nthe order price.',
      'ar': '',
      'ur': '',
    },
    'xaudwtm8': {
      'en': '+5RO',
      'ar': '',
      'ur': '',
    },
    'nx9sp7yy': {
      'en': '+10RO',
      'ar': '',
      'ur': '',
    },
    'so8kmy44': {
      'en': '+20RO',
      'ar': '',
      'ur': '',
    },
    'mk4yty7w': {
      'en': '+25RO',
      'ar': '',
      'ur': '',
    },
    'mad8h5o8': {
      'en': 'You just tipped the \ndriver an additional',
      'ar': '',
      'ur': '',
    },
    'nylebqmo': {
      'en': 'Still not getting any drivers? \nContact our call center',
      'ar': '',
      'ur': '',
    },
    '9n9zf6nr': {
      'en': 'Support',
      'ar': '',
      'ur': '',
    },
    'jzm73znk': {
      'en': 'Cancel order',
      'ar': '',
      'ur': '',
    },
    'myuwohl1': {
      'en': 'Tracking Order',
      'ar': 'تتبع الطلب',
      'ur': 'ٹریکنگ آرڈر',
    },
    '8to4wkk2': {
      'en': 'Distance to destination: ',
      'ar': '',
      'ur': '',
    },
    'oag74oua': {
      'en': 'Estimate arrival time: ',
      'ar': '',
      'ur': '',
    },
    'k5q179u6': {
      'en': 'Amount Paid ',
      'ar': '',
      'ur': '',
    },
    'rxt22h7p': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // PaymentScreen
  {
    'uf1l2a1g': {
      'en': 'Active ',
      'ar': 'نشيط',
      'ur': 'فعال',
    },
    'bawdr46e': {
      'en': 'Cards',
      'ar': 'بطاقات',
      'ur': 'کارڈز',
    },
    'v1vw32sm': {
      'en': 'Visa',
      'ar': 'فيزا',
      'ur': 'ویزا',
    },
    'tin2687g': {
      'en': 'Add Payment Method',
      'ar': 'إضافة طريقة الدفع',
      'ur': 'ادائیگی کا طریقہ شامل کریں۔',
    },
    'ecvff7qy': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // supportPage
  {
    '7s72rcrt': {
      'en': 'Call Us',
      'ar': '',
      'ur': '',
    },
    'jz9kapeh': {
      'en': 'Email Us',
      'ar': '',
      'ur': '',
    },
    'fdapmtgw': {
      'en': 'Review FAQ\'s below',
      'ar': '',
      'ur': '',
    },
    'b8tfixwr': {
      'en': 'How do I download Code?',
      'ar': '',
      'ur': '',
    },
    'kshcck7u': {
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
      'ar': '',
      'ur': '',
    },
    'qzewzrzh': {
      'en': 'How do I download Code?',
      'ar': '',
      'ur': '',
    },
    'bz7teo3k': {
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
      'ar': '',
      'ur': '',
    },
    'tu1vpfc4': {
      'en': 'How do I download Code?',
      'ar': '',
      'ur': '',
    },
    'lkc8gn3d': {
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
      'ar': '',
      'ur': '',
    },
    '8q5wblrq': {
      'en': 'Home',
      'ar': '',
      'ur': '',
    },
  },
  // TermsScreenCopy
  {
    'pyeo97ef': {
      'en': 'I accept the terms & conditions',
      'ar': '',
      'ur': '',
    },
    '8bv65vej': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'zlmf2pg1': {
      'en': 'Continue',
      'ar': '',
      'ur': '',
    },
  },
  // InvoiceScreen
  {
    '89o306f8': {
      'en': 'Order successfully delivered',
      'ar': '',
      'ur': '',
    },
    'un3umuwc': {
      'en': 'Date',
      'ar': '',
      'ur': '',
    },
    'bt0ucbb9': {
      'en': 'Invoice Due',
      'ar': '',
      'ur': '',
    },
    'q1rogder': {
      'en': 'Customer Details',
      'ar': '',
      'ur': '',
    },
    '9z2384i9': {
      'en': 'Name',
      'ar': '',
      'ur': '',
    },
    'lb3u2xo6': {
      'en': 'Email',
      'ar': '',
      'ur': '',
    },
    'jepgcm0n': {
      'en': 'Phone',
      'ar': '',
      'ur': '',
    },
    'hfu7muax': {
      'en': 'Account Type',
      'ar': '',
      'ur': '',
    },
    '9df2yh91': {
      'en': 'Individual',
      'ar': '',
      'ur': '',
    },
    'rj8geta1': {
      'en': 'Order Summary',
      'ar': '',
      'ur': '',
    },
    'ekghqo15': {
      'en': 'Cargo',
      'ar': '',
      'ur': '',
    },
    '2hc67mb2': {
      'en': 'Order Type',
      'ar': '',
      'ur': '',
    },
    '03v1gqul': {
      'en': 'Vehicle Type',
      'ar': '',
      'ur': '',
    },
    'l4y092ej': {
      'en': 'Special Instructions',
      'ar': '',
      'ur': '',
    },
    '11k14my8': {
      'en': 'Pick up',
      'ar': '',
      'ur': '',
    },
    'guoba3aw': {
      'en': 'Drop off',
      'ar': '',
      'ur': '',
    },
    '9x0r26x0': {
      'en': 'Subtotal',
      'ar': '',
      'ur': '',
    },
    '71x11cca': {
      'en': 'Service Charge (5%)',
      'ar': '',
      'ur': '',
    },
    'jd0eu3kn': {
      'en': 'VAT (5%)',
      'ar': '',
      'ur': '',
    },
    'qcytp8tf': {
      'en': 'Total',
      'ar': '',
      'ur': '',
    },
    'qrx2tu4q': {
      'en': 'Payment Information',
      'ar': '',
      'ur': '',
    },
    '9toyet7o': {
      'en': 'Payment Method',
      'ar': '',
      'ur': '',
    },
    'mwsz3qai': {
      'en': 'Visa ending in 4242',
      'ar': '',
      'ur': '',
    },
    '2smok4sa': {
      'en': 'Payment Status',
      'ar': '',
      'ur': '',
    },
    'fbir933k': {
      'en': 'Download PDF',
      'ar': '',
      'ur': '',
    },
    'fq8ukx9q': {
      'en': 'View Invoice',
      'ar': '',
      'ur': '',
    },
  },
  // SettingsScreen
  {
    'x8rx142z': {
      'en': 'Settings',
      'ar': '',
      'ur': '',
    },
    '7ac1okn8': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': '',
      'ur': '',
    },
    'bmz6q0gr': {
      'en': 'Push Notifications',
      'ar': '',
      'ur': '',
    },
    'h7c2ukw1': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': '',
      'ur': '',
    },
    'l9sxxr5g': {
      'en': 'Email Notifications',
      'ar': '',
      'ur': '',
    },
    'sjwhl2qj': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'ar': '',
      'ur': '',
    },
    '5e60wuk1': {
      'en': 'Location Services',
      'ar': '',
      'ur': '',
    },
    'nlz7qkmp': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'ar': '',
      'ur': '',
    },
    'dshgaomx': {
      'en': 'Save Changes',
      'ar': '',
      'ur': '',
    },
    'fzpds3sc': {
      'en': 'Follow us on',
      'ar': '',
      'ur': '',
    },
    'bxvxmm21': {
      'en': 'App Versions',
      'ar': '',
      'ur': '',
    },
    'wd3xs479': {
      'en': 'v0.0.1',
      'ar': '',
      'ur': '',
    },
    'ipf7l747': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // LargeDeliveryScreen
  {
    '33f51xyf': {
      'en': 'Schedule Delivery:',
      'ar': 'جدول التسليم:',
      'ur': 'ڈیلیوری کا شیڈول:',
    },
    'p1lq513n': {
      'en': 'Please select...',
      'ar': 'الرجاء الاختيار...',
      'ur': 'براہ کرم منتخب کریں...',
    },
    '7kug6qsk': {
      'en': 'Search for an item...',
      'ar': 'ابحث عن العنصر...',
      'ur': 'ایک آئٹم تلاش کریں...',
    },
    '7stamqu3': {
      'en': 'Now',
      'ar': 'الآن',
      'ur': 'اب',
    },
    'bq80hwem': {
      'en': 'Clear',
      'ar': 'واضح',
      'ur': 'صاف',
    },
    'qsmvcbxl': {
      'en': 'Edit',
      'ar': 'يحرر',
      'ur': 'ترمیم کریں۔',
    },
    's1j87nra': {
      'en': 'From',
      'ar': '',
      'ur': '',
    },
    '0y2qagir': {
      'en': 'Clear',
      'ar': 'واضح',
      'ur': 'صاف',
    },
    'zmm1pxp6': {
      'en': 'Edit',
      'ar': 'يحرر',
      'ur': 'ترمیم کریں۔',
    },
    'o6j8u0uw': {
      'en': 'To',
      'ar': '',
      'ur': '',
    },
    'rcisgua6': {
      'en': 'Specify your cargo',
      'ar': 'حدد حمولتك',
      'ur': 'اپنے کارگو کی وضاحت کریں۔',
    },
    'ml5bvdv2': {
      'en': 'What type of vehicle do you need?',
      'ar': 'ما نوع السيارة التي تحتاجها؟',
      'ur': 'آپ کو کس قسم کی گاڑی کی ضرورت ہے؟',
    },
    'ylm58n5e': {
      'en': '*',
      'ar': 'ما نوع السيارة التي تحتاجها؟',
      'ur': 'آپ کو کس قسم کی گاڑی کی ضرورت ہے؟',
    },
    'bcczkn93': {
      'en':
          'Choose a vehicle based on your cargo size. Larger vehicles have different weight limits and rates.',
      'ar': '',
      'ur': '',
    },
    'p9ofmhrt': {
      'en': 'Flatbed',
      'ar': 'شاحنة مسطحة',
      'ur': 'فلیٹ بیڈ',
    },
    'axsaq8h8': {
      'en': '25 OMR Base',
      'ar': '30-40 ريال عماني',
      'ur': '30-40 OMR',
    },
    '2qp1h1xg': {
      'en': 'Boxtruck',
      'ar': 'شاحنة صندوقية',
      'ur': 'باکس ٹرک',
    },
    'yqa3iw0o': {
      'en': ' 10 OMR Base',
      'ar': '40-50 ريال عماني',
      'ur': '40-50 OMR',
    },
    'ltafkslu': {
      'en': 'Semi-Trailer',
      'ar': 'نصف مقطورة',
      'ur': 'نیم ٹریلر',
    },
    'fp85cgs0': {
      'en': '60 OMR Base',
      'ar': '50-60 أورم',
      'ur': '50-60 ORM',
    },
    'pwiekaf0': {
      'en': 'Refridge',
      'ar': 'ميني فان',
      'ur': 'منی وین',
    },
    '68yednoz': {
      'en': '30 OMR Base',
      'ar': '20-30 ريال عماني',
      'ur': '20-30 OMR',
    },
    'zkzrf3fv': {
      'en': 'Tanker',
      'ar': 'شاحنة ذات 18 عجلة',
      'ur': '18 وہیلر',
    },
    'h7x0fxmm': {
      'en': '25 OMR Base',
      'ar': '60-70 ريال عماني',
      'ur': '60-70 OMR',
    },
    'qs5r5a2z': {
      'en': 'Car Carrier',
      'ar': 'شاحنة ذات 18 عجلة',
      'ur': '18 وہیلر',
    },
    'd9bvmc6g': {
      'en': '15 OMR Base',
      'ar': '60-70 ريال عماني',
      'ur': '60-70 OMR',
    },
    '6x6ch4n3': {
      'en': 'Dump Truck',
      'ar': 'شاحنة ذات 18 عجلة',
      'ur': '18 وہیلر',
    },
    '8z4hukfz': {
      'en': '20 OMR Base',
      'ar': '60-70 ريال عماني',
      'ur': '60-70 OMR',
    },
    's3yqoc73': {
      'en': 'Livestock',
      'ar': 'شاحنة ذات 18 عجلة',
      'ur': '18 وہیلر',
    },
    'ungrl3xo': {
      'en': '20 OMR Base',
      'ar': '60-70 ريال عماني',
      'ur': '60-70 OMR',
    },
    'phae1a0y': {
      'en': 'What type of cargo will you be shipping?',
      'ar': 'ما نوع السيارة التي تحتاجها؟',
      'ur': 'آپ کو کس قسم کی گاڑی کی ضرورت ہے؟',
    },
    '3mhrzurp': {
      'en': '*',
      'ar': 'ما نوع السيارة التي تحتاجها؟',
      'ur': 'آپ کو کس قسم کی گاڑی کی ضرورت ہے؟',
    },
    'j4f0b94i': {
      'en':
          'Help us prepare by specifying what we’re moving (e.g., furniture, electronics, or perishables).',
      'ar': '',
      'ur': '',
    },
    '8mvnh52s': {
      'en': 'Furniture',
      'ar': 'أثاث',
      'ur': 'فرنیچر',
    },
    '97vkewlj': {
      'en': 'Electronics',
      'ar': 'الإلكترونيات',
      'ur': 'الیکٹرانکس',
    },
    'whvlln84': {
      'en': 'Appliances',
      'ar': 'الأجهزة',
      'ur': 'آلات',
    },
    'ls54e5pi': {
      'en': 'Materials',
      'ar': 'مواد',
      'ur': 'مواد',
    },
    'bmrozlmv': {
      'en': 'Machinery',
      'ar': 'الآلات',
      'ur': 'مشینری',
    },
    'i7jiq7lz': {
      'en': 'Other',
      'ar': 'آخر',
      'ur': 'دیگر',
    },
    '63pzsmf6': {
      'en': 'Handeling Instructions',
      'ar': 'تعليمات المناولة',
      'ur': 'ہینڈلنگ کی ہدایات',
    },
    'xwwzlwg9': {
      'en': '*',
      'ar': 'ما نوع السيارة التي تحتاجها؟',
      'ur': 'آپ کو کس قسم کی گاڑی کی ضرورت ہے؟',
    },
    'erdk7q8o': {
      'en':
          'Let the driver know if items are fragile, need to stay upright, or require climate control.',
      'ar': '',
      'ur': '',
    },
    '6lwxigvd': {
      'en': 'Perishable',
      'ar': 'قابلة للتلف',
      'ur': 'فنا ہونے والا',
    },
    'n75gseu5': {
      'en': 'Hazerdous',
      'ar': 'خطير',
      'ur': 'خطرناک',
    },
    '971eakz5': {
      'en': 'Oversize/Heavy',
      'ar': 'كبير الحجم/ثقيل',
      'ur': 'بڑا/بھاری',
    },
    'y68f7vpb': {
      'en': 'Keep Upright/ Do Not Tilt',
      'ar': 'حافظ على الوضع مستقيمًا/ لا تميل',
      'ur': 'سیدھا رکھیں/ جھکاؤ نہ کریں۔',
    },
    'o9ocrprg': {
      'en': 'Do Not Stack',
      'ar': 'لا تكدس',
      'ur': 'اسٹیک نہ کریں۔',
    },
    '1lpn63zz': {
      'en': 'Keep Dry',
      'ar': 'حافظ على الجفاف',
      'ur': 'خشک رکھیں',
    },
    '08mugill': {
      'en': 'Fragile',
      'ar': 'قابل للكسر',
      'ur': 'نازک',
    },
    'w5cvuhmc': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'mr9w1wbn': {
      'en': 'How many helpers do you need?',
      'ar': 'كم عدد المساعدين الذين تحتاجهم؟',
      'ur': 'آپ کو کتنے مددگاروں کی ضرورت ہے؟',
    },
    '6xkhr3dt': {
      'en': '*',
      'ar': 'ما نوع السيارة التي تحتاجها؟',
      'ur': 'آپ کو کس قسم کی گاڑی کی ضرورت ہے؟',
    },
    '75q2a985': {
      'en':
          'Select additional hands if your items are too heavy for one person to lift safely.',
      'ar': '',
      'ur': '',
    },
    'c9z9xysg': {
      'en': 'Upload a picture of your cargo',
      'ar': 'قم بتحميل صورة لشحنتك',
      'ur': 'اپنے کارگو کی تصویر اپ لوڈ کریں۔',
    },
    'rhtfpsq1': {
      'en': '*',
      'ar': 'ما نوع السيارة التي تحتاجها؟',
      'ur': 'آپ کو کس قسم کی گاڑی کی ضرورت ہے؟',
    },
    'htf38k55': {
      'en':
          'Take a photo of your items so the driver can bring the right equipment and verify the cargo\'s condition.',
      'ar': '',
      'ur': '',
    },
    '4a0uk0i7': {
      'en': 'Upload Image',
      'ar': 'تحميل الصورة',
      'ur': 'تصویر اپ لوڈ کریں۔',
    },
    'antg7aa1': {
      'en': 'Checkout',
      'ar': 'الدفع',
      'ur': 'چیک آؤٹ',
    },
    'stq2qfop': {
      'en': 'Please choose one of the payment options',
      'ar': 'الرجاء اختيار أحد خيارات الدفع',
      'ur': 'براہ کرم ادائیگی کے اختیارات میں سے ایک کا انتخاب کریں۔',
    },
    'tk0muepg': {
      'en': 'Add a new card',
      'ar': 'إضافة بطاقة جديدة',
      'ur': 'نیا کارڈ شامل کریں۔',
    },
    'f3t8qrtw': {
      'en': 'Or use an option below',
      'ar': 'أو استخدم أحد الخيارات أعلاه',
      'ur': 'یا اوپر والا آپشن استعمال کریں۔',
    },
    '2eczyb5w': {
      'en': 'Apple Pay',
      'ar': 'أبل باي',
      'ur': 'ایپل پے',
    },
    '4zfv8lpz': {
      'en': 'Pay w/Paypal',
      'ar': 'الدفع عبر باي بال',
      'ur': 'پے پال کے ساتھ ادائیگی کریں۔',
    },
    'fbevwr5x': {
      'en': 'Order Summary',
      'ar': 'ملخص الطلب',
      'ur': 'آرڈر کا خلاصہ',
    },
    'pgym4otk': {
      'en': 'Route Details',
      'ar': '',
      'ur': '',
    },
    'xhem3muy': {
      'en': 'FROM',
      'ar': '',
      'ur': '',
    },
    'wb71wi1w': {
      'en': 'TO',
      'ar': '',
      'ur': '',
    },
    '19f0d5xq': {
      'en': 'Vehicle & Cargo Details',
      'ar': '',
      'ur': '',
    },
    'vgmi5e8e': {
      'en': 'VEHICLE TYPE',
      'ar': '',
      'ur': '',
    },
    'm8ob3f3b': {
      'en': 'SELECTED CARGO',
      'ar': '',
      'ur': '',
    },
    '55twygyb': {
      'en': 'Option 1',
      'ar': '',
      'ur': '',
    },
    'hepw3ro9': {
      'en': 'Option 2',
      'ar': '',
      'ur': '',
    },
    '82qm3wni': {
      'en': 'Option 3',
      'ar': '',
      'ur': '',
    },
    '9panqc33': {
      'en': 'Handling Instructions',
      'ar': '',
      'ur': '',
    },
    'b7egz5dh': {
      'en': 'Receiver Information',
      'ar': '',
      'ur': '',
    },
    '9qhr6rlo': {
      'en':
          'Specify who will meet the driver. We\'ll send the tracking link and arrival code to this phone number.',
      'ar': '',
      'ur': '',
    },
    '7a5wu692': {
      'en': 'RECEIVING PERSON \n',
      'ar': 'الطرف المتلقي:',
      'ur': 'وصول کرنے والی پارٹی:',
    },
    'k4rvifr5': {
      'en': 'RECEIVER DETAILS',
      'ar': '',
      'ur': '',
    },
    '6t9veky9': {
      'en': 'Name',
      'ar': '',
      'ur': '',
    },
    'lj57lins': {
      'en': 'Phone Number',
      'ar': '',
      'ur': '',
    },
    '7wnqcf1v': {
      'en': 'Notes for Driver',
      'ar': '',
      'ur': '',
    },
    'mths3kfk': {
      'en':
          'Add helpful details like apartment gate codes, specific parking spots, or \'ring the doorbell\'.',
      'ar': '',
      'ur': '',
    },
    'xitk14xw': {
      'en': 'Add any special instructions or notes for the driver...',
      'ar': '',
      'ur': '',
    },
    'f8z6bkii': {
      'en': 'Click to search location',
      'ar': 'موقع البحث',
      'ur': 'مقام تلاش کریں۔',
    },
    'htcrjprg': {
      'en': 'Heavy Delivery',
      'ar': 'توصيل',
      'ur': 'ڈیلیوری',
    },
    'iaf8br3q': {
      'en': 'Base Price -',
      'ar': 'السعر الأساسي -',
      'ur': 'بنیادی قیمت -',
    },
    'atb48iwh': {
      'en': 'Service Charge (5%) -',
      'ar': 'رسوم الخدمة -',
      'ur': 'سروس چارج -',
    },
    'xqxn5d56': {
      'en': 'VAT (5%)',
      'ar': 'رسوم الخدمة -',
      'ur': 'سروس چارج -',
    },
    '8osaqj0m': {
      'en': 'Total',
      'ar': 'المجموع',
      'ur': 'کل',
    },
    'ylb2myyt': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'won6o04z': {
      'en': 'Next',
      'ar': 'التالي',
      'ur': 'اگلا',
    },
    'p9he37oa': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // loadingPage
  {
    '6a99ksou': {
      'en': 'Welcome to QafilaTech!',
      'ar': '',
      'ur': '',
    },
    'it8cfjlt': {
      'en':
          'Thanks for joining! Access or create your account below, and get started on your journey!',
      'ar': '',
      'ur': '',
    },
    'z44ogtxx': {
      'en': 'Get Started',
      'ar': '',
      'ur': '',
    },
    'f61f41jx': {
      'en': 'Home',
      'ar': '',
      'ur': '',
    },
  },
  // favourites
  {
    '27w2pcea': {
      'en': 'Pick Up',
      'ar': '',
      'ur': '',
    },
    'ic30w30e': {
      'en': 'Drop Off',
      'ar': '',
      'ur': '',
    },
  },
  // Card10Rating
  {
    'm59gbmaw': {
      'en': 'Rating',
      'ar': 'تصنيف',
      'ur': 'درجہ بندی',
    },
    'qnsmxn7r': {
      'en': '5',
      'ar': '5',
      'ur': '5',
    },
    '7kvixz1q': {
      'en': 'Vehicle',
      'ar': 'تصنيف',
      'ur': 'درجہ بندی',
    },
    'au55ilsk': {
      'en': 'Semi trailer',
      'ar': 'شاحنة',
      'ur': 'ٹرک',
    },
    '1f1tloea': {
      'en': 'Phone',
      'ar': 'رقم التليفون',
      'ur': 'فون نمبر',
    },
    'bnlx5xfp': {
      'en': 'Message',
      'ar': 'رسالة',
      'ur': 'پیغام',
    },
  },
  // chat
  {
    'h3gusbj0': {
      'en': 'Sarah Miller',
      'ar': 'سارة ميلر',
      'ur': 'سارہ ملر',
    },
    'bhgt7ctj': {
      'en': 'Online',
      'ar': 'متصل',
      'ur': 'آن لائن',
    },
    'wzgokk5h': {
      'en': 'Select a response:',
      'ar': 'حدد الرد:',
      'ur': 'جواب منتخب کریں:',
    },
    '1y8q3foh': {
      'en': 'I\'d love to meet up for coffee!',
      'ar': 'سأحب أن نلتقي لتناول القهوة!',
      'ur': 'میں کافی کے لیے ملنا پسند کروں گا!',
    },
    'u8etd9a1': {
      'en': 'That sounds great! What time works for you?',
      'ar': 'هذا رائع! ما هو الوقت المناسب لك؟',
      'ur': 'یہ بہت اچھا لگتا ہے! آپ کے لیے کون سا وقت کام کرتا ہے؟',
    },
    'mpbu637v': {
      'en': 'How about tomorrow at 2pm?',
      'ar': 'ماذا عن الغد الساعة 2 ظهرا؟',
      'ur': 'کل دوپہر 2 بجے کے بارے میں کیا خیال ہے؟',
    },
    'v3ygqbbu': {
      'en': 'Perfect! I\'ll see you then!',
      'ar': 'ممتاز! سأراك حينها!',
      'ur': 'کامل! پھر ملوں گا!',
    },
    'vvumn03h': {
      'en': 'Choose your response...',
      'ar': 'اختر ردك...',
      'ur': 'اپنا جواب منتخب کریں...',
    },
  },
  // addressEdit
  {
    '6b4ysmks': {
      'en': 'Edit Address Name',
      'ar': 'تعديل اسم العنوان',
      'ur': 'ایڈریس کے نام میں ترمیم کریں۔',
    },
    'gqrrt4m8': {
      'en': 'Enter a name to your location (optional)',
      'ar': 'أدخل اسمًا لموقعك (اختياري)',
      'ur': 'اپنے مقام کا نام درج کریں (اختیاری)',
    },
    'hkl4q2q3': {
      'en': 'Save',
      'ar': 'يحفظ',
      'ur': 'محفوظ کریں۔',
    },
  },
  // contact
  {
    '2m3n1f5i': {
      'en': 'Enter contact phone number',
      'ar': 'أدخل رقم الهاتف للاتصال',
      'ur': 'رابطہ فون نمبر درج کریں۔',
    },
  },
  // ReportIssueMenu
  {
    '3qxjsyeh': {
      'en': 'Report An Issue',
      'ar': 'الإبلاغ عن مشكلة',
      'ur': 'ایک مسئلے کی اطلاع دیں۔',
    },
    'ncjkmxxf': {
      'en': '1. Delivery Issue',
      'ar': '1. مشكلة التسليم',
      'ur': '1. ترسیل کا مسئلہ',
    },
    'smxfdu6n': {
      'en': 'Delivery Issue',
      'ar': 'مشكلة في التسليم',
      'ur': 'ڈیلیوری کا مسئلہ',
    },
    'w2csvhen': {
      'en': '2. App or User Experience Issue',
      'ar': '2. مشكلة في التطبيق أو تجربة المستخدم',
      'ur': '2. ایپ یا صارف کے تجربے کا مسئلہ',
    },
    'y3wmlx4c': {
      'en': 'App or User Experience Issue',
      'ar': 'مشكلة في التطبيق أو تجربة المستخدم',
      'ur': 'ایپ یا صارف کے تجربے کا مسئلہ',
    },
    'be8qyb9u': {
      'en': '3. Driver/Delivery Person Issues',
      'ar': '3. مشاكل السائق/موظف التوصيل',
      'ur': '3. ڈرائیور/ڈیلیوری پرسن کے مسائل',
    },
    '3vlgquil': {
      'en': '4. Order/Delivery Tracking Issues',
      'ar': '4. مشاكل تتبع الطلب/التسليم',
      'ur': '4. آرڈر/ڈیلیوری ٹریکنگ کے مسائل',
    },
    'ksu3uahz': {
      'en': 'Order/Delivery Tracking Issues',
      'ar': 'مشاكل تتبع الطلب/التسليم',
      'ur': 'آرڈر/ڈیلیوری ٹریکنگ کے مسائل',
    },
    'u3ftph02': {
      'en': '5. Refund or Compensation Requests',
      'ar': '5. طلبات الاسترداد أو التعويض',
      'ur': '5. رقم کی واپسی یا معاوضے کی درخواستیں۔',
    },
    't5dkpswf': {
      'en': 'Refund or Compensation Requests',
      'ar': 'طلبات استرداد الأموال أو التعويض',
      'ur': 'رقم کی واپسی یا معاوضے کی درخواستیں۔',
    },
    'ocr66fww': {
      'en': '6. Other',
      'ar': '6. أخرى',
      'ur': '6. دیگر',
    },
    '0gr955nx': {
      'en': 'Other',
      'ar': 'آخر',
      'ur': 'دیگر',
    },
  },
  // DeliveryIssueMenu
  {
    'i6ggaksu': {
      'en': 'Delivery Issue',
      'ar': 'مشكلة في التسليم',
      'ur': 'ڈیلیوری کا مسئلہ',
    },
    'sb6cgn0u': {
      'en': '1. Late Delivery',
      'ar': '1. التسليم المتأخر',
      'ur': '1. دیر سے ڈیلیوری',
    },
    'jradltjl': {
      'en': '2. Damaged Items',
      'ar': '2. العناصر التالفة',
      'ur': '2. تباہ شدہ اشیاء',
    },
    'p4s8o6fx': {
      'en':
          'Report any damaged items during delivery to ensure swift resolution. Provide details about the condition and delivery issue for accurate assistance.',
      'ar':
          'أبلغ عن أي تلف في المنتجات أثناء التوصيل لضمان حل سريع. قدّم تفاصيل عن حالة المنتج ومشكلة التوصيل للحصول على مساعدة دقيقة.',
      'ur':
          'فوری حل کو یقینی بنانے کے لیے ترسیل کے دوران کسی بھی خراب اشیاء کی اطلاع دیں۔ درست مدد کے لیے حالت اور ترسیل کے مسئلے کے بارے میں تفصیلات فراہم کریں۔',
    },
    'olyi0r3k': {
      'en': '3. Wrong Items',
      'ar': '3. العناصر الخاطئة',
      'ur': '3. غلط اشیاء',
    },
    'kakfnc3h': {
      'en':
          'Report items delivered incorrectly or not matching your order. Share details about the wrong items to help us resolve the issue swiftly.',
      'ar':
          'أبلغ عن المنتجات التي وصلت بشكل غير صحيح أو لا تتوافق مع طلبك. شارك تفاصيل المنتجات الخاطئة لمساعدتنا في حل المشكلة بسرعة.',
      'ur':
          'غلط طریقے سے ڈیلیور کیے گئے یا آپ کے آرڈر سے مماثل نہ ہونے کی اطلاع دیں۔ غلط آئٹمز کے بارے میں تفصیلات کا اشتراک کریں تاکہ اس مسئلے کو تیزی سے حل کرنے میں ہماری مدد کریں۔',
    },
    'xgkfk3qj': {
      'en': '4. Failed Delivery',
      'ar': '4. فشل التسليم',
      'ur': '4. ناکام ترسیل',
    },
    '79x5woih': {
      'en':
          'Report unsuccessful delivery attempts to help us address the issue efficiently. Share details such as the reason for failure and any relevant delivery information.',
      'ar':
          'أبلغ عن محاولات التسليم الفاشلة لمساعدتنا في حل المشكلة بكفاءة. شارك تفاصيل مثل سبب الفشل وأي معلومات تسليم ذات صلة.',
      'ur':
          'اس مسئلے کو مؤثر طریقے سے حل کرنے میں ہماری مدد کرنے کے لیے ڈیلیوری کی ناکام کوششوں کی اطلاع دیں۔ تفصیلات کا اشتراک کریں جیسے ناکامی کی وجہ اور کوئی متعلقہ ڈیلیوری معلومات۔',
    },
    '3c80zumq': {
      'en': '5. Partial Delivery',
      'ar': '5. التسليم الجزئي',
      'ur': '5. جزوی ترسیل',
    },
    'zhb41b62': {
      'en':
          'Report items that were partially delivered or missing from your shipment. Provide details about the undelivered items to help us address the issue effectively.',
      'ar':
          'أبلغ عن العناصر التي تم تسليمها جزئيًا أو المفقودة من شحنتك. قدّم تفاصيل عن العناصر غير المسلمة لمساعدتنا في معالجة المشكلة بفعالية.',
      'ur':
          'ان آئٹمز کی اطلاع دیں جو آپ کی کھیپ سے جزوی طور پر ڈیلیور یا غائب تھیں۔ اس مسئلے کو مؤثر طریقے سے حل کرنے میں ہماری مدد کرنے کے لیے غیر ڈیلیور شدہ اشیاء کے بارے میں تفصیلات فراہم کریں۔',
    },
  },
  // AppIssueMenu
  {
    'mdfslejd': {
      'en': 'App or User Experience Issue',
      'ar': 'مشكلة في التطبيق أو تجربة المستخدم',
      'ur': 'ایپ یا صارف کے تجربے کا مسئلہ',
    },
    'pn5ouxn7': {
      'en': '1. App Crashes/Freezes',
      'ar': '1. تعطل التطبيق/تجميده',
      'ur': '1. ایپ کریش/جمی',
    },
    'q0cyxs90': {
      'en': '2. Payment Issues',
      'ar': '2. مشاكل الدفع',
      'ur': '2. ادائیگی کے مسائل',
    },
    '5kus9dfx': {
      'en': '3. Account/Login Issues',
      'ar': '3. مشاكل الحساب/تسجيل الدخول',
      'ur': '3. اکاؤنٹ/لاگ ان کے مسائل',
    },
    'd25vdl7t': {
      'en': '4. Location Issues',
      'ar': '4. مشاكل الموقع',
      'ur': '4. مقام کے مسائل',
    },
    'ao4oo96w': {
      'en': '5. UI/Usability Issues',
      'ar': '5. مشكلات واجهة المستخدم/سهولة الاستخدام',
      'ur': '5. UI/استعمال کے مسائل',
    },
  },
  // DriverIssueMenu
  {
    '1z4majx5': {
      'en': 'Driver/Delivery Person Issue',
      'ar': 'مشكلة السائق/موظف التوصيل',
      'ur': 'ڈرائیور/ڈیلیوری پرسن کا مسئلہ',
    },
    'htkmy375': {
      'en': '1. Rude or Unprofessional Behavior',
      'ar': '1. السلوك الوقح أو غير المهني',
      'ur': '1. بدتمیز یا غیر پیشہ ورانہ رویہ',
    },
    'cr1uj5gz': {
      'en': '2. Safety Concerns',
      'ar': '2. المخاوف المتعلقة بالسلامة',
      'ur': '2. حفاظتی خدشات',
    },
    'fp12ki8o': {
      'en':
          'Report any safety-related issues or concerns during delivery. Your input helps us ensure a secure and reliable service for all users.',
      'ar':
          'أبلغ عن أي مشاكل أو مخاوف تتعلق بالسلامة أثناء التوصيل. ملاحظاتك تساعدنا على ضمان خدمة آمنة وموثوقة لجميع المستخدمين.',
      'ur':
          'ڈیلیوری کے دوران کسی بھی حفاظت سے متعلق مسائل یا خدشات کی اطلاع دیں۔ آپ کا ان پٹ تمام صارفین کے لیے ایک محفوظ اور قابل اعتماد سروس کو یقینی بنانے میں ہماری مدد کرتا ہے۔',
    },
    'n653zydd': {
      'en': '3. Unresponsive Driver',
      'ar': '3. سائق لا يستجيب',
      'ur': '3. غیر ذمہ دار ڈرائیور',
    },
    '0m4aibe6': {
      'en':
          'Report drivers who are unresponsive or not reachable during delivery. Provide relevant details to help us address the situation promptly.',
      'ar':
          'أبلغ عن السائقين الذين لا يستجيبون أو يتعذر الوصول إليهم أثناء التوصيل. قدّم التفاصيل اللازمة لمساعدتنا في معالجة الموقف بسرعة.',
      'ur':
          'ان ڈرائیوروں کی اطلاع دیں جو ڈیلیوری کے دوران غیر ذمہ دار ہیں یا ان تک پہنچ نہیں سکتے۔ صورتحال سے فوری نمٹنے میں ہماری مدد کے لیے متعلقہ تفصیلات فراہم کریں۔',
    },
  },
  // TrackingIssueMenu
  {
    'zobyzc87': {
      'en': 'Order/Delivery Tracking Issue',
      'ar': 'مشكلة في تتبع الطلب/التسليم',
      'ur': 'آرڈر/ڈیلیوری ٹریکنگ کا مسئلہ',
    },
    't9lu9dsa': {
      'en': '1. Unable to Track Delivery',
      'ar': '1. غير قادر على تتبع التسليم',
      'ur': '1. ترسیل کو ٹریک کرنے سے قاصر',
    },
    '6jhtmbkc': {
      'en': '2. No Contact Info',
      'ar': '2. لا توجد معلومات اتصال',
      'ur': '2. کوئی رابطہ معلومات نہیں۔',
    },
  },
  // RefundIssueMenu
  {
    '6w7u9b74': {
      'en': 'Refund or Compensation Request',
      'ar': 'طلب استرداد أو تعويض',
      'ur': 'رقم کی واپسی یا معاوضے کی درخواست',
    },
    'mfj6948c': {
      'en': '1. Request Refund',
      'ar': '1. طلب استرداد المبلغ',
      'ur': '1. رقم کی واپسی کی درخواست کریں۔',
    },
    'xxrhq02v': {
      'en': 'Request Refund',
      'ar': 'طلب استرداد المبلغ',
      'ur': 'رقم کی واپسی کی درخواست کریں۔',
    },
    'z2rusvgr': {
      'en': '2. Request Compensation',
      'ar': '2. طلب التعويض',
      'ur': '2. معاوضے کی درخواست کریں۔',
    },
    'fmorzlfs': {
      'en': 'Request Compensation',
      'ar': 'طلب التعويض',
      'ur': 'معاوضے کی درخواست کریں۔',
    },
    '2daje6ac': {
      'en':
          'Request compensation for delivery issues, such as damaged, missing, or incorrect items. Compensation may include refunds, free deliveries, or other suitable resolutions. Provide details about the issue to help us process your request efficiently.',
      'ar':
          'اطلب تعويضًا عن مشاكل التوصيل، مثل المنتجات التالفة أو المفقودة أو غير الصحيحة. قد يشمل التعويض استرداد الأموال، أو توصيلًا مجانيًا، أو حلولًا مناسبة أخرى. قدّم تفاصيل المشكلة لمساعدتنا في معالجة طلبك بكفاءة.',
      'ur':
          'ترسیل کے مسائل کے لیے معاوضے کی درخواست کریں، جیسے کہ خراب، گمشدہ، یا غلط اشیاء۔ معاوضے میں رقم کی واپسی، مفت ترسیل، یا دیگر مناسب قراردادیں شامل ہو سکتی ہیں۔ آپ کی درخواست پر موثر طریقے سے کارروائی کرنے میں ہماری مدد کرنے کے لیے مسئلے کے بارے میں تفصیلات فراہم کریں۔',
    },
  },
  // OtherIssueMenu
  {
    '2r3e0jd8': {
      'en': 'TextField',
      'ar': 'حقل النص',
      'ur': 'ٹیکسٹ فیلڈ',
    },
    '52c2ii5r': {
      'en': 'Submit Ticket',
      'ar': 'إرسال التذكرة',
      'ur': 'ٹکٹ جمع کروائیں۔',
    },
  },
  // IssueWithOrderSelect
  {
    '2fis7zb7': {
      'en': 'Please select the order ID of this incident.',
      'ar': 'الرجاء تحديد معرف الطلب لهذا الحادث.',
      'ur': 'براہ کرم اس واقعے کی آرڈر ID منتخب کریں۔',
    },
    '9y8zqasg': {
      'en': 'Select...',
      'ar': 'يختار...',
      'ur': 'منتخب کریں...',
    },
    '4w8f3e3x': {
      'en': 'Search...',
      'ar': 'يبحث...',
      'ur': 'تلاش کریں...',
    },
    'lnaqxio5': {
      'en': 'Please write a description you have of the incident.',
      'ar': 'يرجى كتابة وصف لديك للحادث.',
      'ur': 'براہ کرم اس واقعے کی تفصیل لکھیں۔',
    },
    '9jkwuxee': {
      'en': 'Enter your details here...',
      'ar': '',
      'ur': '',
    },
    'gynbt8xq': {
      'en': 'Submit Ticket',
      'ar': 'إرسال التذكرة',
      'ur': 'ٹکٹ جمع کروائیں۔',
    },
  },
  // favSave
  {
    'q117n94d': {
      'en': 'Route saved',
      'ar': 'تم حفظ المسار',
      'ur': 'راستہ محفوظ ہو گیا۔',
    },
    '0csmh47v': {
      'en': 'Give this route a name to referrence later.',
      'ar': 'أعط هذا الطريق اسمًا للرجوع إليه لاحقًا.',
      'ur': 'اس راستے کو بعد میں حوالہ دینے کے لیے ایک نام دیں۔',
    },
    'kqxszwve': {
      'en': 'Enter the name here..',
      'ar': 'أدخل الاسم هنا..',
      'ur': 'یہاں نام درج کریں..',
    },
    'b39ecl1j': {
      'en': 'Save',
      'ar': 'يحفظ',
      'ur': 'محفوظ کریں۔',
    },
  },
  // pay
  {
    '61dj70nd': {
      'en': 'Payment Method',
      'ar': 'طريقة الدفع',
      'ur': 'ادائیگی کا طریقہ',
    },
    '0qzcyb4c': {
      'en': 'Fill in the information below to save your card.',
      'ar': 'قم بملء المعلومات أدناه لحفظ بطاقتك.',
      'ur': 'اپنا کارڈ محفوظ کرنے کے لیے نیچے دی گئی معلومات کو پُر کریں۔',
    },
    'qqxgcrn9': {
      'en': 'Card Number',
      'ar': 'رقم البطاقة',
      'ur': 'کارڈ نمبر',
    },
    'srfzt1fw': {
      'en': 'xxxx-xxxx-xxxx-xxxx',
      'ar': 'xxxx-xxxx-xxxx-xxxx',
      'ur': 'xxxx-xxxx-xxxx-xxxx',
    },
    'ba6aepfa': {
      'en': 'Expiry Date',
      'ar': 'تاريخ انتهاء الصلاحية',
      'ur': 'میعاد ختم ہونے کی تاریخ',
    },
    '3a7wq7gn': {
      'en': 'dd/yy',
      'ar': 'يوم/سنة',
      'ur': 'dd/yy',
    },
    'gekryh6q': {
      'en': 'Pin',
      'ar': 'دبوس',
      'ur': 'پن',
    },
    'cy9txlkl': {
      'en': 'CVV',
      'ar': 'رمز التحقق من البطاقة (CVV)',
      'ur': 'سی وی وی',
    },
    '6svp79s0': {
      'en': 'Save your card',
      'ar': 'احفظ بطاقتك',
      'ur': 'اپنا کارڈ محفوظ کریں۔',
    },
  },
  // TermsSection
  {
    'rkih1lo4': {
      'en': 'Last Updated: June 15, 2023',
      'ar': 'آخر تحديث: ١٥ يونيو ٢٠٢٣',
      'ur': 'آخری تازہ کاری: جون 15، 2023',
    },
    'mu0kt1gs': {
      'en': '1. Acceptance of Terms',
      'ar': '1. قبول الشروط',
      'ur': '1. شرائط کی قبولیت',
    },
    'trp00srf': {
      'en':
          'By accessing or using our application, you agree to be bound by these Terms and Conditions and all applicable laws and regulations. If you do not agree with any of these terms, you are prohibited from using or accessing this application.',
      'ar':
          'بدخولك إلى تطبيقنا أو استخدامه، فإنك توافق على الالتزام بهذه الشروط والأحكام وجميع القوانين واللوائح السارية. في حال عدم موافقتك على أيٍّ من هذه الشروط، يُحظر عليك استخدام هذا التطبيق أو الوصول إليه.',
      'ur':
          'ہماری درخواست تک رسائی یا استعمال کرکے، آپ ان شرائط و ضوابط اور تمام قابل اطلاق قوانین و ضوابط کے پابند ہونے سے اتفاق کرتے ہیں۔ اگر آپ ان شرائط میں سے کسی سے متفق نہیں ہیں، تو آپ کو اس ایپلی کیشن کو استعمال کرنے یا اس تک رسائی حاصل کرنے سے منع کیا گیا ہے۔',
    },
    'chx8phk2': {
      'en': '2. Use License',
      'ar': '2. استخدام الترخيص',
      'ur': '2. لائسنس استعمال کریں۔',
    },
    'bw00q119': {
      'en':
          'Permission is granted to temporarily download one copy of the materials on our application for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not: modify or copy the materials; use the materials for any commercial purpose; attempt to decompile or reverse engineer any software contained in the application; remove any copyright or other proprietary notations from the materials; or transfer the materials to another person or \'mirror\' the materials on any other server.',
      'ar':
          'يُسمح بتنزيل نسخة واحدة مؤقتًا من المواد الموجودة في تطبيقنا للعرض الشخصي غير التجاري فقط. هذا ترخيص، وليس نقل ملكية، وبموجب هذا الترخيص، لا يجوز لك: تعديل المواد أو نسخها؛ أو استخدامها لأي غرض تجاري؛ أو محاولة فك أو عكس هندسة أي برنامج موجود في التطبيق؛ أو إزالة أي حقوق نشر أو أي حقوق ملكية أخرى من المواد؛ أو نقل المواد إلى شخص آخر أو نسخها على أي خادم آخر.',
      'ur':
          'ہماری درخواست پر مواد کی ایک کاپی عارضی طور پر ڈاؤن لوڈ کرنے کی اجازت صرف ذاتی، غیر تجارتی عارضی دیکھنے کے لیے دی گئی ہے۔ یہ لائسنس کی گرانٹ ہے، عنوان کی منتقلی نہیں، اور اس لائسنس کے تحت آپ: مواد میں ترمیم یا کاپی نہیں کر سکتے۔ کسی بھی تجارتی مقصد کے لیے مواد استعمال کریں؛ ایپلی کیشن میں موجود کسی بھی سافٹ ویئر کو ڈی کمپائل یا ریورس انجینئر کرنے کی کوشش کریں؛ مواد سے کاپی رائٹ یا دیگر ملکیتی اشارے ہٹا دیں؛ یا مواد کو کسی دوسرے شخص کو منتقل کریں یا کسی دوسرے سرور پر مواد کو \'آئینہ\' کریں۔',
    },
    'wh2h3dkk': {
      'en': '3. Disclaimer',
      'ar': '3. إخلاء المسؤولية',
      'ur': '3. دستبرداری',
    },
    'abz3dprv': {
      'en':
          'The materials on our application are provided on an \'as is\' basis. We make no warranties, expressed or implied, and hereby disclaim and negate all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.',
      'ar':
          'المواد في تطبيقنا مُقدمة \"كما هي\". لا نقدم أي ضمانات، صريحة كانت أم ضمنية، ونتنصل بموجب هذا من جميع الضمانات الأخرى، بما في ذلك على سبيل المثال لا الحصر، الضمانات الضمنية أو شروط قابلية التسويق، والملاءمة لغرض معين، وعدم انتهاك الملكية الفكرية أو أي انتهاك آخر للحقوق.',
      'ur':
          'ہماری درخواست پر مواد \'جیسا ہے\' کی بنیاد پر فراہم کیا جاتا ہے۔ ہم کوئی وارنٹی نہیں دیتے، ظاہر یا مضمر، اور اس کے ذریعے تمام دیگر وارنٹیوں کو مسترد اور مسترد کرتے ہیں، بشمول، بغیر کسی حد کے، مضمر وارنٹی یا تجارتی ہونے کی شرائط، کسی خاص مقصد کے لیے فٹنس، یا املاک دانش کی عدم خلاف ورزی یا حقوق کی دوسری خلاف ورزی۔',
    },
    'mfl2puns': {
      'en': '4. Limitations',
      'ar': '4. القيود',
      'ur': '4. حدود',
    },
    'o1er5bne': {
      'en':
          'In no event shall our company or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on our application, even if we or an authorized representative has been notified orally or in writing of the possibility of such damage.',
      'ar':
          'لن تكون شركتنا أو موردوها مسؤولين في أي حال من الأحوال عن أي أضرار (بما في ذلك على سبيل المثال لا الحصر، الأضرار الناجمة عن فقدان البيانات أو الربح، أو بسبب انقطاع الأعمال) الناشئة عن استخدام أو عدم القدرة على استخدام المواد الموجودة في تطبيقنا، حتى لو تم إخطارنا أو إخطار ممثل مفوض شفويًا أو كتابيًا بإمكانية حدوث مثل هذه الأضرار.',
      'ur':
          'کسی بھی صورت میں ہماری کمپنی یا اس کے سپلائرز ہماری درخواست پر مواد کے استعمال یا استعمال میں ناکامی سے پیدا ہونے والے نقصانات (بشمول، بغیر کسی حد کے، ڈیٹا یا منافع کے نقصان، یا کاروباری رکاوٹ کی وجہ سے) کے ذمہ دار نہیں ہوں گے، چاہے ہمیں یا کسی مجاز نمائندے کو اس طرح کے نقصان کے امکان کے بارے میں زبانی یا تحریری طور پر مطلع کیا گیا ہو۔',
    },
    '5wivt1ba': {
      'en': '5. Revisions and Errata',
      'ar': '5. المراجعات والأخطاء',
      'ur': '5. نظرثانی اور خرابی',
    },
    'bvpemmzp': {
      'en':
          'The materials appearing on our application could include technical, typographical, or photographic errors. We do not warrant that any of the materials on our application are accurate, complete or current. We may make changes to the materials contained on our application at any time without notice.',
      'ar':
          'قد تتضمن المواد الواردة في طلبنا أخطاءً فنية أو مطبعية أو تصويرية. لا نضمن دقة أو اكتمال أو تحديث أيٍّ من المواد الواردة في طلبنا. يحق لنا إجراء تغييرات على المواد الواردة في طلبنا في أي وقت دون إشعار.',
      'ur':
          'ہماری درخواست پر ظاہر ہونے والے مواد میں تکنیکی، ٹائپوگرافیکل یا فوٹو گرافی کی غلطیاں شامل ہو سکتی ہیں۔ ہم اس بات کی ضمانت نہیں دیتے کہ ہماری درخواست پر موجود کوئی بھی مواد درست، مکمل یا موجودہ ہے۔ ہم کسی بھی وقت بغیر اطلاع کے اپنی درخواست پر موجود مواد میں تبدیلیاں کر سکتے ہیں۔',
    },
    'e8e1m9x8': {
      'en': '6. Links',
      'ar': '6. الروابط',
      'ur': '6. لنکس',
    },
    'dig83he4': {
      'en':
          'We have not reviewed all of the sites linked to our application and are not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by us of the site. Use of any such linked website is at the user\'s own risk.',
      'ar':
          'لم نراجع جميع المواقع المرتبطة بتطبيقنا، ولسنا مسؤولين عن محتوياتها. إدراج أي رابط لا يعني تأييدنا للموقع. استخدام أي موقع مرتبط يكون على مسؤولية المستخدم الشخصية.',
      'ur':
          'ہم نے اپنی درخواست سے منسلک تمام سائٹوں کا جائزہ نہیں لیا ہے اور ایسی کسی بھی لنک شدہ سائٹ کے مواد کے ذمہ دار نہیں ہیں۔ کسی بھی لنک کو شامل کرنا سائٹ کی ہماری طرف سے توثیق کا مطلب نہیں ہے۔ ایسی کسی بھی منسلک ویب سائٹ کا استعمال صارف کے اپنے خطرے پر ہے۔',
    },
    'uwcfprmd': {
      'en': '7. Modifications to Terms of Use',
      'ar': '7. تعديلات على شروط الاستخدام',
      'ur': '7. استعمال کی شرائط میں ترمیم',
    },
    'kx51hx4r': {
      'en':
          'We may revise these terms of use for our application at any time without notice. By using this application you are agreeing to be bound by the then current version of these Terms and Conditions of Use.',
      'ar':
          'يجوز لنا مراجعة شروط استخدام تطبيقنا هذه في أي وقت دون إشعار. باستخدامك لهذا التطبيق، فإنك توافق على الالتزام بالنسخة الحالية من شروط وأحكام الاستخدام هذه.',
      'ur':
          'ہم کسی بھی وقت بغیر اطلاع کے اپنی درخواست کے لیے استعمال کی ان شرائط پر نظر ثانی کر سکتے ہیں۔ اس ایپلیکیشن کو استعمال کر کے آپ ان شرائط و ضوابط کے استعمال کے اس وقت کے موجودہ ورژن کے پابند ہونے پر اتفاق کر رہے ہیں۔',
    },
    'fxcbt6qc': {
      'en': '8. Governing Law',
      'ar': '8. القانون الحاكم',
      'ur': '8. گورننگ قانون',
    },
    'jdd6t4nu': {
      'en':
          'These terms and conditions are governed by and construed in accordance with the laws and you irrevocably submit to the exclusive jurisdiction of the courts in that location.',
      'ar':
          'تخضع هذه الشروط والأحكام للقوانين ويتم تفسيرها وفقًا لها، وتخضع بشكل لا رجعة فيه للاختصاص الحصري للمحاكم في ذلك الموقع.',
      'ur':
          'یہ شرائط و ضوابط قوانین کے مطابق اور ان کی تشکیل کی جاتی ہیں اور آپ اٹل طور پر اس جگہ کی عدالتوں کے خصوصی دائرہ اختیار میں جمع ہوجاتے ہیں۔',
    },
    'r7hplsm3': {
      'en': '9. Privacy Policy',
      'ar': '9. سياسة الخصوصية',
      'ur': '9. رازداری کی پالیسی',
    },
    'ueoor3bc': {
      'en':
          'Your use of our application is also subject to our Privacy Policy. Please review our Privacy Policy, which also governs the application and informs users of our data collection practices.',
      'ar':
          'يخضع استخدامك لتطبيقنا أيضًا لسياسة الخصوصية الخاصة بنا. يُرجى مراجعة سياسة الخصوصية الخاصة بنا، والتي تُنظّم التطبيق وتُبلغ المستخدمين بممارساتنا في جمع البيانات.',
      'ur':
          'ہماری درخواست کا آپ کا استعمال بھی ہماری رازداری کی پالیسی سے مشروط ہے۔ براہ کرم ہماری پرائیویسی پالیسی کا جائزہ لیں، جو ایپلیکیشن کو بھی کنٹرول کرتی ہے اور صارفین کو ہمارے ڈیٹا اکٹھا کرنے کے طریقوں سے آگاہ کرتی ہے۔',
    },
  },
  // OtherOptions
  {
    'srqkssfu': {
      'en': 'Options',
      'ar': '',
      'ur': '',
    },
    'sph13pmi': {
      'en': 'Request Support',
      'ar': '',
      'ur': '',
    },
    '8v0ker9h': {
      'en': 'Report Incident',
      'ar': '',
      'ur': '',
    },
  },
  // PinSelect
  {
    'fnfmv93y': {
      'en': 'Set Pick Up',
      'ar': '',
      'ur': '',
    },
    '1ihpmjpy': {
      'en': 'Set Drop Off',
      'ar': '',
      'ur': '',
    },
  },
  // MenuDrawer
  {
    'bmj8rr5w': {
      'en': 'Qafila',
      'ar': '',
      'ur': '',
    },
    'xcornxcu': {
      'en': 'Tech.',
      'ar': '',
      'ur': '',
    },
    'g5ef4nmm': {
      'en': 'Platform Navigation',
      'ar': '',
      'ur': '',
    },
    'e80bnm5y': {
      'en': 'Support Center',
      'ar': '',
      'ur': '',
    },
    'l0pe39f5': {
      'en': 'Payment methods',
      'ar': '',
      'ur': '',
    },
    'h7je3729': {
      'en': 'Favorite Locations',
      'ar': '',
      'ur': '',
    },
    'vaw0gkqh': {
      'en': 'Report Incident',
      'ar': '',
      'ur': '',
    },
    'x9720y36': {
      'en': 'Light Mode',
      'ar': '',
      'ur': '',
    },
    'vx2wetay': {
      'en': 'Dark Mode',
      'ar': '',
      'ur': '',
    },
  },
  // ReviewComponent
  {
    'yrrfdhzm': {
      'en': 'How was your order?',
      'ar': '',
      'ur': '',
    },
    '7t9lt5ku': {
      'en': 'Share your experience to help others',
      'ar': '',
      'ur': '',
    },
    '98tzisic': {
      'en': 'Tell us more',
      'ar': '',
      'ur': '',
    },
    '0cbp8fxn': {
      'en': 'Share your thoughts about the food, delivery, or service...',
      'ar': '',
      'ur': '',
    },
    '3iolvsi9': {
      'en': 'Skip',
      'ar': '',
      'ur': '',
    },
    'f0xlh2rs': {
      'en': 'Submit Review',
      'ar': '',
      'ur': '',
    },
  },
  // AttachmentConfirmPhoto
  {
    'i7xt9l4s': {
      'en': 'Cargo Inspection',
      'ar': '',
      'ur': '',
    },
    '37t66bkx': {
      'en': 'Cargo Condition',
      'ar': '',
      'ur': '',
    },
    'mqfjkxbd': {
      'en': 'Excellent',
      'ar': '',
      'ur': '',
    },
    '42oyh9tx': {
      'en': 'Good',
      'ar': '',
      'ur': '',
    },
    'js2iw09p': {
      'en': 'Fair',
      'ar': '',
      'ur': '',
    },
    'xsctw4bg': {
      'en': 'Damaged',
      'ar': '',
      'ur': '',
    },
    'k0gbqwbk': {
      'en': 'Additional Notes',
      'ar': '',
      'ur': '',
    },
    'ss5dxn7k': {
      'en': 'Any damage or special observations...',
      'ar': '',
      'ur': '',
    },
    'x5c6eg47': {
      'en': 'Report Issue',
      'ar': '',
      'ur': '',
    },
    'y4c0cofb': {
      'en': 'Confirm Condition',
      'ar': '',
      'ur': '',
    },
  },
  // Miscellaneous
  {
    '3bgxxdbf': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'tuzhh7pm': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'bv4lr0k6': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'g9g7rnla': {
      'en':
          'QafilaTech needs access to your notifications to send you notifications',
      'ar': '',
      'ur': '',
    },
    'gwhafn3b': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'bqvvk6kx': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'lq5wnazo': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'ycewlp7n': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'vw9hut3z': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'mb1lqcvb': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'lscxzzbg': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '91vklc0b': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'zvqf1yfk': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'y1nx7xhq': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'qcs1p72k': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'pp80d309': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'w3bt91m6': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'f4b2oat6': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'x5wnfy7p': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '3fdpwpjr': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'i7dq0d86': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'xzf6b31k': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'm2txang3': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'me9tpemk': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'ki0mc7kj': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'oqflpiya': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '10798c3d': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'ikp4vge0': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '4afllffx': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'a6d4trby': {
      'en': 'Home',
      'ar': '',
      'ur': '',
    },
  },
].reduce((a, b) => a..addAll(b));
