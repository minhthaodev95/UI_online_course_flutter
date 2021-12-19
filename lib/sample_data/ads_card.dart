class AdsCard {
  final String title;
  final String imageUrl;
  final int backgroundColor;
  final int titleColor;

  AdsCard({
    required this.title,
    required this.imageUrl,
    required this.backgroundColor,
    required this.titleColor,
  });
}

List<AdsCard> listAdsCard = [
  AdsCard(
    title: 'Language',
    imageUrl: 'assets/image_svg/course_icon01-min.svg',
    backgroundColor: 0xffCEECFE,
    titleColor: 0xff3D5CFF,
  ),
  AdsCard(
    title: 'Painting',
    imageUrl: 'assets/image_svg/course_icon02-min.svg',
    backgroundColor: 0xffEFE0FF,
    titleColor: 0xff9065BE,
  ),
];
