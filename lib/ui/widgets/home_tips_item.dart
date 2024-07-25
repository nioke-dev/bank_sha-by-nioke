import 'package:sha_bank/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTipsItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String url;

  const HomeTipsItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // if (await canLaunchUrl(Uri())) {
        //   launchUrl(url);
        // }
        if (await canLaunchUrl(Uri.parse(url))) {
          launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: 176,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(20),
          color: whiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Expanded(
                child: Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
