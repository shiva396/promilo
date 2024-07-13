//Function to validate the email and password

bool loginValidation(email, password) {
  if (email.toString() == "test@stanch.io" &&
      password.toString() == "Test@123") {
    print("Login Success");
    return true;
  } else {
    return false;
  }
}
