import 'package:equatable/equatable.dart';

class CarouselResponse {
  CarouselItem carousel;

  CarouselResponse(this.carousel);
}

class CarouselItem extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String logo;

  const CarouselItem(
    this.id,
    this.title,
    this.subtitle,
    this.logo,
  );

  @override
  List<Object> get props => [
        this.id,
        this.title,
        this.subtitle,
        this.logo,
      ];
}
