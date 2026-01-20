class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: "assets/icons/landingVector1.svg",
    title: 'Effortless Bartering',
    description:
        'Easily connect with barterers, rate trustworthy trades, and find reliable partners. Join for seamless, secure bartering.',
  ),
  OnboardingModel(
    image: "assets/icons/landingVector2.svg",
    title: 'Easy Item Swapping',
    description:
        'Swap your used items easily with millions of like-minded barterers. Join our platform for seamless and secure exchanges',
  ),
  OnboardingModel(
    image: "assets/icons/landingVector3.svg",
    title: 'Secure Barter',
    description:
        'Easily connect with millions of like-minded barterers. Our app ensures 100% secured and seamless exchanges.',
  ),
];
