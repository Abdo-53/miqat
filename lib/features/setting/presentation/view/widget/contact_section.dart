import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_links.dart';
import 'package:miqat/core/service/url_launcher_service.dart';
import 'package:miqat/generated/l10n.dart';
import 'package:miqat/core/service/injection.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final launcher = getIt<UrlLauncherService>();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).contact_us,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          SizedBox(height: 18.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _SocialButton(
                icon: FontAwesomeIcons.telegram,
                onTap: () => launcher.open(AppLinks.telegram),
              ),
              _SocialButton(
                icon: FontAwesomeIcons.facebook,
                onTap: () => launcher.open(AppLinks.facebook),
              ),
              _SocialButton(
                icon: FontAwesomeIcons.whatsapp,
                onTap: () => launcher.open(AppLinks.whatsapp),
              ),
              _SocialButton(
                icon: FontAwesomeIcons.envelope,
                onTap: () => launcher.sendEmail(AppLinks.email),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50.r),
        onTap: onTap,
        child: Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primary.withValues(alpha: .10),
          ),
          child: Center(
            child: FaIcon(icon, color: AppColor.primary, size: 24.sp),
          ),
        ),
      ),
    );
  }
}
