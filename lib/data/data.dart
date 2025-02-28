class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'Boost Productivity',
    image: 'assets/image1.png',
    description: 'Foc.io helps you boost your productivity on a different level.',
  ),
  OnboardingContent(
    title: 'Work Seamlessly',
    image: 'assets/image2.png',
    description: 'Get your work done seamlessly without interruptions.',
  ),
  OnboardingContent(
    title: 'Achieve Higher Goals',
    image: 'assets/image3.png',
    description: 'By boosting your productivity, we help you achieve higher goals.',
  ),
];
