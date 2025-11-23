class UserSession {
  static bool isLoggedIn = false;

  static String nombre = "";
  static String email = "";

  static void login(String name, String mail) {
    isLoggedIn = true;
    nombre = name;
    email = mail;
  }

  static void logout() {
    isLoggedIn = false;
    nombre = "";
    email = "";
  }
}
