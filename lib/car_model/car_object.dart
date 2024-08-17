final class CarObject {
  final String carName;
  final int carId;
  final String price;
  final String engin;
  final String horsepower;
  final String seating;
  final String warranty;
  final String imgSrc;
  bool favorite;
  final List<String>caroselImgs;
  final String carDetails;

  CarObject({
    this.favorite = false,
    required this.carDetails,
    required this.caroselImgs,
    required this.carId,
    required this.carName,
    required this.price,
    required this.engin,
    required this.horsepower,
    required this.seating,
    required this.warranty,
    required this.imgSrc,
  });
}
