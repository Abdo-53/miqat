import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miqat/core/const/app_asset.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/helper/cubit/localization_cubit.dart';
import 'package:miqat/core/helper/cubit/localization_state.dart';
import 'package:miqat/core/helper/cubit/theme_cubit.dart';
import 'package:miqat/core/helper/cubit/theme_state.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/service/miqat_notification_service.dart';
import 'package:miqat/core/service/shared_preferences_service.dart';
import 'package:miqat/features/home/presentation/manager/cubit/prayer_cubit.dart';
import 'package:miqat/features/home/presentation/manager/cubit/prayer_state.dart';
import 'package:miqat/features/setting/presentation/view/widget/contact_section.dart';
import 'package:miqat/features/setting/presentation/view/widget/setting_expandable_tile.dart';
import 'package:miqat/features/setting/presentation/view/widget/setting_options.dart';
import 'package:miqat/features/setting/presentation/view/widget/setting_section.dart';
import 'package:miqat/generated/l10n.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  SettingExpansion? expandedSetting;

  late bool notificationsEnabled;

  @override
  void initState() {
    super.initState();

    notificationsEnabled = getIt<SharedPreferencesService>()
        .getNotificationsEnabled();
  }

  void toggleExpansion(SettingExpansion setting) {
    setState(() {
      expandedSetting = expandedSetting == setting ? null : setting;
    });
  }

  Future<void> _toggleNotifications(bool value) async {
    final notificationService = getIt<MiqatNotificationService>();

    await notificationService.setNotificationsEnabled(value);

    if (!mounted) return;

    setState(() {
      notificationsEnabled = value;
    });

    if (!value) {
      return;
    }

    final prayerState = context.read<PrayerCubit>().state;

    if (prayerState is PrayerSuccess) {
      final localization = S.of(context);

      await notificationService.schedulePrayerNotifications(
        timings: prayerState.prayerTimesResponse.data.timings,
        title: localization.notification_prayer,
        fajrMessage: localization.notification_fajr,
        dhuhrMessage: localization.notification_dhuhr,
        asrMessage: localization.notification_asr,
        maghribMessage: localization.notification_maghrib,
        ishaMessage: localization.notification_isha,
      );

      await notificationService.scheduleAzkarNotifications(
        timings: prayerState.prayerTimesResponse.data.timings,
        morningTitle: localization.azkar_morning,
        morningMessage: localization.notification_morningAzkar,
        eveningTitle: localization.azkar_evening,
        eveningMessage: localization.notification_eveningAzkar,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state as ThemeChanged;

    final localizationState =
        context.watch<LocalizationCubit>().state as LocalizationChanged;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            AppAsset.decor2,
            height: 200.h,
            color: AppColor.primary,
          ),
        ),

        SingleChildScrollView(
          padding: EdgeInsets.only(top: 180.h, bottom: 40.h),
          child: Column(
            children: [
              SettingSection(
                title: S.of(context).settings_appSettings,
                tiles: [
                  SettingExpandableTile(
                    title: S.of(context).settings_notifications,
                    leading: Icon(FontAwesomeIcons.bell, size: 26.sp),
                    trailing: Switch(
                      value: notificationsEnabled,
                      onChanged: _toggleNotifications,
                    ),
                  ),

                  _buildDivider(context),

                  SettingExpandableTile(
                    title: S.of(context).settings_appTheme,
                    subtitle: _themeName(context, themeState.themeMode),
                    leading: Icon(FontAwesomeIcons.palette, size: 26.sp),
                    isExpanded: expandedSetting == SettingExpansion.theme,
                    onTap: () {
                      toggleExpansion(SettingExpansion.theme);
                    },
                    expandedChild: SettingOptions<ThemeMode>(
                      currentValue: themeState.themeMode,
                      items: [
                        SettingOptionItem(
                          title: S.of(context).lightMode,
                          value: ThemeMode.light,
                        ),
                        SettingOptionItem(
                          title: S.of(context).darkMode,
                          value: ThemeMode.dark,
                        ),
                        SettingOptionItem(
                          title: S.of(context).systemMode,
                          value: ThemeMode.system,
                        ),
                      ],
                      onSelected: (mode) {
                        context.read<ThemeCubit>().changeTheme(mode);

                        setState(() {
                          expandedSetting = null;
                        });
                      },
                    ),
                  ),

                  _buildDivider(context),

                  SettingExpandableTile(
                    title: S.of(context).settings_appLanguage,
                    subtitle: localizationState.locale.languageCode == 'ar'
                        ? S.of(context).arabic
                        : S.of(context).english,
                    leading: Icon(FontAwesomeIcons.language, size: 26.sp),
                    isExpanded: expandedSetting == SettingExpansion.language,
                    onTap: () {
                      toggleExpansion(SettingExpansion.language);
                    },
                    expandedChild: SettingOptions<Locale>(
                      currentValue: localizationState.locale,
                      items: [
                        SettingOptionItem(
                          title: S.of(context).arabic,
                          value: const Locale('ar'),
                        ),
                        SettingOptionItem(
                          title: S.of(context).english,
                          value: const Locale('en'),
                        ),
                      ],
                      onSelected: (locale) {
                        context.read<LocalizationCubit>().changeLocalization(
                          locale,
                        );

                        setState(() {
                          expandedSetting = null;
                        });
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              const ContactSection(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(BuildContext context) => Divider(
    color: Theme.of(context).dividerColor,
    thickness: .4,
    indent: 20,
    endIndent: 20,
  );

  String _themeName(BuildContext context, ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return S.of(context).lightMode;
      case ThemeMode.dark:
        return S.of(context).darkMode;
      case ThemeMode.system:
        return S.of(context).systemMode;
    }
  }
}

enum SettingExpansion { theme, language }
