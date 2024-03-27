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
  SliderViewObject(
      {required this.sliderObject,
      required this.currentIndex,
      required this.numOfSlides});
}

class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(
      {required this.id, required this.name, required this.numOfNotifications});
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts({required this.phone, required this.email, required this.link});
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication({required this.customer, required this.contacts});
}

class SignUp {
  String name;
  String phone;
  String email;
  String password;

  SignUp(this.name, this.phone, this.email, this.password);
}
