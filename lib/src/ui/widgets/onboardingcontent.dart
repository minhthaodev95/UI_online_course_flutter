class OnBoardingContent {
  final String title;
  final String description;
  final String image;
  OnBoardingContent({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnBoardingContent> content = <OnBoardingContent>[
  OnBoardingContent(
    title: 'Numerous free \n trial courses',
    description: 'Free courses for you to \n find your way to learning',
    image: 'assets/image_svg/onboarding01-min.svg',
  ),
  OnBoardingContent(
    title: 'Quick and easy \n learning',
    description:
        'Easy and fast learning at \n any time to help you \n improve various skills',
    image: 'assets/image_svg/onboarding02-min.svg',
  ),
  OnBoardingContent(
    title: 'Create your own \n study plan',
    description:
        'Study according to the \n study plan, make study \n more motivated',
    image: 'assets/image_svg/onboarding03-min.svg',
  ),
];
