import 'package:bund_investments/core/network/carousel_response.dart';
import 'package:bund_investments/core/utils/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCarousel extends StatefulWidget {
  final List<CarouselItem> items;

  const HomeCarousel({super.key, required this.items});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _current = 0;

  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller,
          items: widget.items.map((e) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title,
                                style: const TextStyle(
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                              Text(
                                e.subtitle,
                                style: const TextStyle(
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFA4ABBB),
                                ),
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: () => _onStartNow(e),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Color(0x0D1C2C56),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset('assets/start_now.svg'),
                                      const SizedBox(width: 6),
                                      const Text(
                                        'Start Now',
                                        style: TextStyle(
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Image.network(
                          e.logo,
                          width: 120,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ));
              },
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 0.87,
            aspectRatio: 326 / 156,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayInterval: const Duration(milliseconds: 3500),
            onPageChanged: (val, _) {
              setState(() {
                _current = val;
                // controller.jumpToPage(val);
              });
            },
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.items.map(
              (entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 5.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.items[_current] == entry
                        ? (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppColor.primaryColor)
                        : AppColor.disabledColor,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  _onStartNow(CarouselItem e) {}
}
