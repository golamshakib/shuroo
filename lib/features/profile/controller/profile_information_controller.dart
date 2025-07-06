import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/common/widgets/progress_indicator.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/profile/data/user_data_model.dart';

class ProfileInformationController extends GetxController {
  late String originalName;
  late String originalEmail;
  late String originalPhone;
  late String originalCountry;
  late String originalState;
  late String originalCity;

  @override
  void onInit() async{
    super.onInit();
    // originalName = nameTEController.text;
    // originalEmail = emailTEController.text;
    // originalPhone = phoneTEController.text;
    // originalCountry = countryTEController.text;
    // originalState = stateTEController.text;
    // originalCity = cityTEController.text;
    await getUser();
  }

  @override
  void onClose() {
    nameTEController.dispose();
    emailTEController.dispose();
    phoneTEController.dispose();
    countryTEController.dispose();
    stateTEController.dispose();
    cityTEController.dispose();
    super.onClose();
  }

  final nameTEController = TextEditingController();
  final emailTEController = TextEditingController();
  final phoneTEController = TextEditingController();
  final countryTEController = TextEditingController();
  final stateTEController = TextEditingController();
  final cityTEController = TextEditingController();

  String aboutMessage =
      "Launch Your Career with Shuroo!\n\nThe Ultimate Early Career Job Search Platform\n\nDesigned with the specific needs of graduating students, recent graduates and young professionals, Shuroo is your all-in one career partner in navigating the early stages of your professional journey. Shuroo offers a comprehensive suite of  tools to help you find and secure a role that launches the rest of your successful career. Whether you’re actively job hunting or just exploring what’s out there, here’s how Shuroo can support you: • Explore Opportunities Shuroo connects you to thousands of job listings from companies across various industries. Regardless  of your area of study, our platform curates opportunities that align with your skills and aspirations • Effortless Applications Applying for jobs has never been easier. Shuroo streamlines the application process, allowing you to  submit your resume and cover letter with just a few clicks. You even have the option to upload a video  of yourself to help employers get to know you as a person. Track the status of your applications all in  one place, so you never miss an opportunity • Network and Refer Leverage and continue to build your professional network by referring jobs to friends and helping others  launch and/or advance their careers. Shuroo makes it easy to share job listings and recommendations  within your circle, fostering a collaborative environment for professional growth • Wishlist and Save Keep track of the positions that catch your eye with our Wishlist feature. Save your favorite job postings  and revisit them anytime • Stand Out to Employers Build a compelling profile that highlights your unique strengths and experiences. Organize your  achievements, skills, and professional background to make a lasting impression on potential  employers. Upload a video of yourself summarizing your achievements; in today’s competitive  environment, it’s critical that employers know you as an individual, beyond your academic and/or  professional achievements. • Direct Communication Engage directly with employers through our in-app chat feature. After applying, you can initiate  conversations with hiring managers to express your interest and ask questions, enhancing your chances  of securing the job • Empower Your Career Journey With Shuroo, you are in control of your career path. Access our platform anytime, anywhere, and take  proactive steps towards achieving your professional goals At Shuroo, we believe every career path starts with a single step. Let’s take it together.  Join us, and let's embark on this exciting adventure together. C’mon, what are you waiting for? Shuroo your career!";
  String helpMessage =
      "Need assistance? We’re here to help! \n\nAt Shuroo, your experience matters to us. Whether you’re having trouble applying for a job, referring opportunities, updating your profile, or chatting with companies — our support team is ready to guide you. \n\n👇 Common topics we can help with: \nTrouble logging in or signing up \nIssues submitting job applications \nQuestions about referrals or rewards \nProfile setup and editing \nMessaging or notification concerns \nTechnical bugs or errors \n\n📞 How to Reach Us: \nLive Chat: Available inside the app (Mon–Fri, 9am–6pm) \nEmail Support: support@shuroo.com \nHelp Center: Browse FAQs and how-to guides in the app \n\nWe aim to respond within 24 hours.Thanks for trusting Shuroo — your career journey means the world to us!";

  Future<void> updateProfile() async {
    final name = nameTEController.text.trim();
    final email = emailTEController.text.trim();
    final phone = phoneTEController.text.trim();
    final country = countryTEController.text.trim();
    final state = stateTEController.text.trim();
    final city = cityTEController.text.trim();

    // Check if anything changed
    final isUnchanged = name == originalName &&
        email == originalEmail &&
        phone == originalPhone &&
        country == originalCountry &&
        state == originalState &&
        city == originalCity;

    if (isUnchanged) {
      AppSnackBar.showError('No changes detected');
      return;
    }

    final requestBody = {
      'name': name,
      'phone': phone,
      'email': email,
      'country': country,
      'state': state,
      'city': city
    };

    try {
      showProgressIndicator();
      final response = await NetworkCaller().putRequest(
        AppUrls.profileUpdate,
        body: requestBody,
        token: "Bearer ${AuthService.token}",
      );

      if (response.isSuccess && response.statusCode == 200) {
        AppSnackBar.showSuccess('Data updated successfully');

        // Auto-update UI-bound observable data
        userProfile.update((val) {
          if (val != null && val.data != null) {
            val.data!.name = name;
            val.data!.email = email;
            val.data!.phone = phone;
            val.data!.country = country;
            val.data!.state = state;
            val.data!.city = city;
          }
        });

        originalName = name;
        originalEmail = email;
        originalPhone = phone;
        originalCountry = country;
        originalState = state;
        originalCity = city;
      } else {
        AppSnackBar.showError('Data update failed');
      }
    } catch (e) {
      print('Something went wrong: $e');
      AppSnackBar.showError('Something went wrong');
    } finally {
      hideProgressIndicator();
    }
  }

  // Get User Profile

  var userProfile = GetUser().obs;

  Future<void> getUser() async {
    try {
      final response = await NetworkCaller().getRequest(
        AppUrls.getUserProfile,
        token: "Bearer ${AuthService.token}",
      );

      if (response.isSuccess && response.statusCode == 200) {
        userProfile.value = GetUser.fromJson(response.responseData);

        final user = userProfile.value.data;
        nameTEController.text = user?.name ?? '';
        emailTEController.text = user?.email ?? '';
        phoneTEController.text = user?.phone ?? '';
        countryTEController.text = user?.country ?? '';
        stateTEController.text = user?.state ?? '';
        cityTEController.text = user?.city ?? '';

        originalName = nameTEController.text;
        originalEmail = emailTEController.text;
        originalPhone = phoneTEController.text;
        originalCountry = countryTEController.text;
        originalState = stateTEController.text;
        originalCity = cityTEController.text;
      } else if (response.statusCode == 404) {
        AppSnackBar.showError("User Not Found");
      } else {
        AppSnackBar.showError("Something went wrong");
      }
    } catch (e) {
      print('Something went wrong $e');
    }
  }
}
