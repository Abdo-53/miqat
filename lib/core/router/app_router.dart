import 'package:go_router/go_router.dart';
import 'package:miqat/features/azkar/data/model/azkar_category_model.dart';
import 'package:miqat/features/azkar/presentation/view/widget/azkar_details_page.dart';
import 'package:miqat/features/home/presentation/view/widget/adhan_view.dart';
import 'package:miqat/features/home/presentation/view/widget/qibla_view.dart';
import 'package:miqat/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:miqat/features/quran/data/model/radio_model.dart';
import 'package:miqat/features/quran/presentation/view/widget/mushaf_view.dart';
import 'package:miqat/features/quran/presentation/view/widget/mushaf_view_args.dart';
import 'package:miqat/features/quran/presentation/view/widget/radios/radio_view.dart';
import 'package:miqat/features/quran/presentation/view/widget/reciters/reciters_view.dart';
import 'package:miqat/features/quran/presentation/view/widget/surahs/arguments/surahs_view_args.dart';
import 'package:miqat/features/quran/presentation/view/widget/surahs/surahs_view.dart';
import 'package:miqat/features/splash/presentation/view/splash_view.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/taspeeh_counter_view.dart';
import 'package:miqat/main_view.dart';

class AppRouter {
  static const kMainView = '/main';
  static const kHomeView = '/home';
  static const kResultView = '/result';
  static const kOnboardingView = '/Onboarding';
  static const kQuranView = '/Quran';
  static const kSettingView = '/Setting';
  static const kAzkarView = '/Azkar';
  static const kTasbeehView = '/Tasbeeh';
  static const kTasbeehCounterView = '/TasbeehCounter';
  static const kAzkarDetailsView = '/AzkarDetails';
  static const kRecitersView = '/RecitersView';
  static const kSurahsView = '/SurahsView';
  static const kRadioView = '/RadioView';
  static const kMushafView = '/MushafView';
  static const kQiblaView = '/Qibla';
  static const kAdhanView = '/Adhan';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),

      GoRoute(path: kMainView, builder: (context, state) => MainView()),

      GoRoute(
        path: kRadioView,
        name: kRadioView,
        builder: (context, state) {
          final radio = state.extra as RadioModel?;

          return RadioView(initialRadio: radio);
        },
      ),
      GoRoute(
        path: kQiblaView,
        name: kQiblaView,
        builder: (context, state) => const QiblaView(),
      ),

      GoRoute(
        path: kAdhanView,
        name: kAdhanView,
        builder: (context, state) => const AdhanView(),
      ),
      GoRoute(
        path: kMushafView,
        name: kMushafView,
        builder: (context, state) {
          final args = state.extra as MushafViewArgs;

          return MushafView(startPage: args.startPage);
        },
      ),
      GoRoute(
        path: kSurahsView,
        name: kSurahsView,
        builder: (context, state) {
          final args = state.extra as SurahsViewArgs;

          return SurahsView(args: args);
        },
      ),
      GoRoute(
        path: kRecitersView,
        builder: (context, state) {
          final initialSearchQuery = state.extra as String?;

          return RecitersView(initialSearchQuery: initialSearchQuery);
        },
      ),
      GoRoute(
        name: kAzkarDetailsView,
        path: kAzkarDetailsView,
        builder: (context, state) {
          final data = state.extra as AzkarCategoryModel;
          return AzkarDetailsPage(model: data);
        },
      ),
      GoRoute(
        path: kTasbeehCounterView,
        name: kTasbeehCounterView,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;

          final title = data['title'] as String;
          final target = data['target'] as int;

          return TaspeehCounterView(target: target, title: title);
        },
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => OnboardingView(),
      ),
    ],
  );
}
