// onboarding models
class SliderObject {
  String? title;
  String? supTitle;
  String? image;

  SliderObject({this.title, this.supTitle, this.image});
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject({required this.sliderObject, required this.currentIndex, required this.numOfSlides});
}
