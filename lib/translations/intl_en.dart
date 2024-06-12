import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          // Login Screen
          "welcome": "Welcome Back!",
          "userNameLabel": "Username or Email",
          "userNameEmailHint": "Please enter your username or email.",
          "passwordLabel": "Password",
          "passwordHint": "Please enter your password.",
          "forgotPassword": "Forgot Password?",
          "login": "Login",
          "createAccount": "Create an account",
          "signUp": "Sign Up",

          // Register Screen
          "userName": "Username",
          "userNameHint": "Please enter your username.",
          "emailLabel": "Email",
          "emailHint": "Please enter your email.",
          "passwordConfirmLabel": "Confirm Password",
          "passwordConfirmHint": "Please confirm your password.",
          "registerAgreement":
              "By clicking the Register button, you agree to the public offer",
          "alreadyHaveAccount": "I Already Have An Account",

          // Dashboard Screen
          "searchAny": "Search any Product...",
          "allCategories": "All Categories",
          "seeAll": "See All",
          "trending": "Trending Products",
          "viewAll": "View All",

          // Categories Screen
          "categories": "Categories",

          // Search Screen
          "search": "Search",
          "noResults": "No results found",

          // Products Screen
          "products": "Products",

          // Drawer
          "logout": "Logout",
          "logoutConfirm": "Are you sure you want to logout?",
          "cancel": "Cancel",
          "confirm": "Confirm",

          // NavBar
          "home": "Home",
          "wishlist": "Wishlist",
          "settings": "Settings",

          // Validation
          "nameEmpty": "Name cannot be empty.",
          "emailEmpty": "Email cannot be empty.",
          "emailInvalid": "Email is invalid.",
          "passwordEmpty": "Password cannot be empty.",
          "passwordLength": "Password should be at least 5 characters.",
          "passwordsDontMatch": "Passwords do not match.",
        }
      };
}
