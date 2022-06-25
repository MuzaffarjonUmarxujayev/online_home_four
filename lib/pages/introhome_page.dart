import 'package:flutter/material.dart';
import 'package:online_home_four/pages/home_page.dart';
import '../utils/Strings.dart';

class HomeIntroPage extends StatefulWidget {
  static const id = "home_task";

  const HomeIntroPage({Key? key}) : super(key: key);

  @override
  State<HomeIntroPage> createState() => _HomeIntroPageState();
}

class _HomeIntroPageState extends State<HomeIntroPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                  image: 'assets/images/image_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent,
                  skip: 'Skip'),
              makePage(
                  reverse: true,
                  image: 'assets/images/image_2.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent,
                  skip: 'Skip'),
              makePage(
                  image: 'assets/images/image_3.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent,
                  skip: 'Skip'),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage(
      {required image,
      required title,
      required content,
      required skip,
      reverse = false}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30, top: 110),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 1,
          ),
          currentIndex == 2
              ? Container(
            padding: const EdgeInsets.only(left: 130 ),
                margin: const EdgeInsets.only(top: 200,left: 100,bottom: 20),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomePage.id);
                    },
                    child: Text(
                      skip,
                      style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
              )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 7,
      width: isActive ? 36 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
