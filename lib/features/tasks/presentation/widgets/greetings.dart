import 'package:flutter/material.dart';
import 'package:taks_app/core/ui/app_colors.dart';

class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: 123,
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(
            'assets/profile_page.png',
            height: 50,
            width: 50,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello, Kelvin',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'iamkosgei@gmail.com',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
