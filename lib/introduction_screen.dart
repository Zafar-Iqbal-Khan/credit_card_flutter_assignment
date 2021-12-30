import 'package:credit_card/credit_card_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'joinUs/signin_or_register.dart';

class IntroScreen extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        titleWidget: const Text(
          'Create A Card',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        bodyWidget: const Text(
          'Create your own card based on your preference',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black38),
          textAlign: TextAlign.center,
        ),
        image: Image.network(
          'https://raw.githubusercontent.com/4eug/Digital-Cards-Onboarding-Screen/main/assets/card1.png',
          // height: 200,
          // width: 400,
        ),
      ),
      PageViewModel(
        titleWidget: const Text(
          'Own Many Cards',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        bodyWidget: const Text(
          'Add as many cards to your digital wallet',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black38),
          textAlign: TextAlign.center,
        ),
        image: Image.network(
          'https://raw.githubusercontent.com/4eug/Digital-Cards-Onboarding-Screen/main/assets/card2.png',
        ),
      ),
      PageViewModel(
        titleWidget: const Text(
          'Get Instant Notification',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        bodyWidget: const Text(
          'Instant notification about any transaction',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black38),
          textAlign: TextAlign.center,
        ),
        image: Image.network(
          'https://github.com/4eug/Digital-Cards-Onboarding-Screen/blob/main/assets/card3.png?raw=true',
          // height: 200,
          // width: 400,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: getPages(),
        done: Text('Done'),
        showNextButton: true,
        showSkipButton: true,
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => SignInOrRegister(),
            ),
          );
        },
        skip: const Text('skip'),
        next: const Text('next'),
        onSkip: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => SignInOrRegister(),
            ),
          );
        },
      ),
    );
  }
}
