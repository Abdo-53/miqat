import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<void> open(String url) async {
    final uri = Uri.parse(url);

    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);

    if (!launched) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> sendEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);

    final launched = await launchUrl(uri);

    if (!launched) {
      throw Exception('Could not launch email client');
    }
  }
}
