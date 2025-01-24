class OnBoardingModel {
  int id;
  String title;
  String description;

  OnBoardingModel(
      {required this.id, required this.title, required this.description});
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    id: 1,
    title: "Welcome To Errands",
    description:
        "On-demand errand services,where ever or when ever the need arises",
  ),
  OnBoardingModel(
    id: 2,
    title: "Work With Our Team",
    description: "We have team of professionals to help you with your errands.",
  ),
  OnBoardingModel(
    id: 3,
    title: "Inter-State Errands",
    description:
        "You don't have to be in the same state to get your errands done",
  ),
];
