import 'package:clean_architecture/app/constants.dart';
import 'package:clean_architecture/app/extensions.dart';
import 'package:clean_architecture/data/response/responses.dart';
import 'package:clean_architecture/domain/model/models.dart';

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        phone: this?.phone.orEmpty() ?? Constants.empty,
        email: this?.email.orEmpty() ?? Constants.empty,
        link: this?.link.orEmpty() ?? Constants.empty);
  }
}

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        id: this?.id ?? Constants.empty,
        name: this?.name.orEmpty() ?? Constants.empty,
        numOfNotifications:
            this?.numOfNotifications.orZero() ?? Constants.zero);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        contacts: this?.contacts.toDomain(),
        customer: this?.customer.toDomain());
  }
}

extension SignUpResponseMapper on SignUpResponse? {
  SignUp toDomain() {
    return SignUp(
      this?.name.orEmpty() ?? Constants.empty,
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.password.orEmpty() ?? Constants.empty,
    );
  }
}
