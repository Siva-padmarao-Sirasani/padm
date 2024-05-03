/// Author: Shaik Mobin
/// Created on : 12-08-2022

class AppStrings {
  static const String greetingMsg = "Welcome!!";
  static const String noInternet = "No Internet\nPlease check your connection";
  static const String failedToGetNetwork = 'Failed to get Network Status';
  static const String networkError = 'Network Error';
  static const String enterMobileNumber = 'Enter Your Mobile Number';
  static const String agentLogin = 'Agent Login';
  static const String forgot = 'Forgot Password';
  static const String mailSent = 'Mail Sent';
  static const String sendYouCode = 'We will send you a confirmation code';
  static const String enterEmail = 'Please Enter your credentials';
  static const String mailContent = 'Enter registered email to get reset link';
  static const String mailSentContent = 'Please Check your inbox to reset your password';
  static const String sendOtp = 'Send OTP';
  static const String login = 'Login';
  static const String forgetPsw = 'Forget Password?';
  static const String createPsw = 'Create Password';
  static const String createCon='Enter Password and Confirm Password and Click Save Button to Reset password';
  static const String byContinueText = 'By continuing you agree to our';
  static const String registerContent = "New to Happy Flat?";
  static const String termsAndConditions = 'Terms Of Use & Privacy Policy';
  static const String enterVerificationCode = 'Enter Verification Code';
  static const String sendLink = "Send Link";
  static  String detectOtp(String lastFourDigits) {
    return 'We are automatically detecting a SMS\nsend to your mobile number $lastFourDigits';
  }
  static const String verifyOtp = 'Verify OTP';
  static const String backTologin = 'Back To Login';

}

class ClientEndPoints {
  //  static const String baseUrl = "https:www.example.com/api/v1/";
}

enum ToastType { error, success, info, warning, custom, failed }
