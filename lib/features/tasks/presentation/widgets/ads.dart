import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taks_app/core/ui/app_colors.dart';

class Ads extends StatelessWidget {
  const Ads({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: adsBackgroundColor,
      height: 116,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(
            'assets/ad.png',
            height: 50,
            width: 50,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Go Pro (No Ads)',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: adsPricingTitleTextColor,
                        )),
                Text(
                  'No fuss, no ads, for only \$1 a month',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: secondaryTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: adsPricingBackgroundColor,
              width: 66,
              height: 71,
              child: Center(
                child: Text(
                  '\$1',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: adsPricingTextColor,
                        fontSize: 18,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
