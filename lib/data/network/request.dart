class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class RegisterRequest {
  String name;
  String phone;
  String email;
  String password;

  RegisterRequest(this.name, this.phone, this.email, this.password);
}
