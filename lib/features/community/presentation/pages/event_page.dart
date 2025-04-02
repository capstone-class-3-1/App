import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  final List<Map<String, String>> imageData = [
    {
      'image': 'assets/test/event_image.png',
      'description': 'Build with AI : Hello-Wolrd in Incheon',
    },
    {
      'image': 'assets/test/event_image.png',
      'description': 'Build with AI : Hello-Wolrd in Incheon',
    },
    {
      'image': 'assets/test/event_image.png',
      'description': 'Build with AI : Hello-Wolrd in Incheon',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 250.0,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items:
                      imageData.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Stack(
                              children: [
                                // 이미지
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250.0,
                                  child: Image.asset(
                                    item['image']!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                // 설명 컨테이너 - 이미지 위에 오버레이
                                Positioned(
                                  bottom: 30, // 인디케이터 위에 위치하도록 조정
                                  left: 20,
                                  right: 20,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 15.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Text(
                                      item['description']!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }).toList(),
                ),
                // 인디케이터
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        imageData.asMap().entries.map((entry) {
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 4.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  _currentIndex == entry.key
                                      ? AppColors.textColor2
                                      : Colors.white.withOpacity(0.5),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(color: Colors.white, height: 200),
            SizedBox(height: 10),
            Container(color: Colors.white, height: 200),
            SizedBox(height: 10),
            Container(color: Colors.white, height: 200),
          ],
        ),
      ),
    );
  }
}
