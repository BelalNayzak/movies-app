import 'package:flutter/material.dart';
import 'package:mina_pharma_task_movie/features/auth/presentation/pages/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/strings/strings.dart';
import '../../../../core/widgets/my_app_temp.dart';
import '../../../films/presentation/pages/home_page.dart';
import '../widget/welcome/multi_color_styled_text.dart';

class WelcomePage extends StatelessWidget {
  static const id = 'WelcomePage';
  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      String? userString = prefs.getString(CURRENT_USER);
      if (userString != null && userString.isNotEmpty) {
        Navigator.pushReplacementNamed(context, HomePage.id);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return MyAppTemp(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const MultiColoredStyledText(),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Sign up now and get access  to the best films collection ever!',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          _buildLoginButtons(context),
          const SizedBox(height: 20),
          const Text('We offer the best movies ever'),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildLoginButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      SignupPage.id,
                      arguments: false, // isLogin ???
                    );
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Log in'),
                  style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll<double>(5),
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.black),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: 50,
              height: 50,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                color: Colors.grey[100],
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {},
                  child: const Icon(Icons.apple, size: 30),
                ),
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: 50,
              height: 50,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                color: Colors.grey[100],
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset('assets/images/google_logo_icon.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
