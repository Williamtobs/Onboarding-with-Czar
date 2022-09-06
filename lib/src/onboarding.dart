import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding/src/widgets/button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/each_slide.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController(initialPage: 0);

  int pageNo = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    nextSlide() {
      controller.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                'Skip',
                style: GoogleFonts.inter(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    pageNo = index;
                  });
                },
                controller: controller,
                children: const [
                  EachSlide(
                    image: 'assets/screen1.png',
                    title: 'Find Best Musicians All Around Your City',
                    description:
                        'Thousands of musicians around you are waiting to rock your event.',
                  ),
                  EachSlide(
                    image: 'assets/screen2.png',
                    title: 'Fastest Way To Book Great Musicians',
                    description:
                        'Find the perfect match to perform for your event and make the day remarkable.',
                  ),
                  EachSlide(
                    image: 'assets/screen3.png',
                    title: 'Find Top Sessions Pros For Your Event',
                    description:
                        'Find the perfect match to perform for your event and make the day remarkable.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  onTap: nextSlide,
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: CustomizableEffect(
                      spacing: 4,
                      dotDecoration: DotDecoration(
                        color: const Color.fromRGBO(179, 179, 179, 1),
                        width: 8,
                        height: 8,
                        rotationAngle: 180,
                        verticalOffset: -10,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      activeDotDecoration: DotDecoration(
                          width: 32,
                          height: 8,
                          rotationAngle: 180,
                          verticalOffset: -10,
                          borderRadius: BorderRadius.circular(24),
                          color: const Color.fromRGBO(0, 0, 0, 1))),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
