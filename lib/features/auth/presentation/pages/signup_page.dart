import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mina_pharma_task_movie/core/widgets/my_app_temp.dart';

import '../../../../core/ui_utils/snack_messenger.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../films/presentation/pages/home_page.dart';
import '../../domain/entity/user.dart';
import '../bloc/user_bloc.dart';
import '../widget/shared/the_intead_row.dart';

class SignupPage extends StatelessWidget {
  static const id = 'SignupPage';

  late User user;
  final TextEditingController _nameCTRL = TextEditingController();
  final TextEditingController _emailCTRL = TextEditingController();
  final TextEditingController _passCTRL = TextEditingController();

  SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        MyAppTemp(
          child: BlocConsumer<UserBloc, UserState>(
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const LoadingWidget();
              }
              return _buildTheBodyBasedOnState(state, context);
            },
            listener: (context, state) {
              if (state is AuthedState) {
                SnackMessenger()
                    .showSuccessSnack(context, 'Welcom! Enjoy your movies.');
                Navigator.pushNamed(context, HomePage.id);
              } else if (state is NotAuthedState) {
                SnackMessenger().showErrorSnack(context, state.errorMessage);
              }
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildBottomWave(),
        ),
      ],
    );
  }

  Widget _buildTheBodyBasedOnState(UserState state, context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 100),
          _buildTitle(state),
          const SizedBox(height: 50),
          _buildFormCard(state, context),
          const SizedBox(height: 50),
          TheInsteadRow(userState: state),
        ],
      ),
    );
  }

  Text _buildTitle(UserState state) {
    if (state is SignupScreenState) {
      return Text('SIGN UP', style: _buildTitleTxtStyle());
    } else {
      return Text('\nLOG IN', style: _buildTitleTxtStyle());
    }
  }

  TextStyle _buildTitleTxtStyle() {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w900,
      fontSize: 40,
    ));
  }

  Widget _buildFormCard(UserState state, context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 60, top: 40),
                child: Form(
                  child: _buildForm(state),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildFab(state, context),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(UserState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (state is SignupScreenState)
          TextFormField(
            controller: _nameCTRL,
            decoration: InputDecoration(
              hintText: 'full name',
              labelText: 'Full Name',
              prefixIcon: const Icon(
                Icons.account_circle,
                color: Colors.black87,
              ),
              enabledBorder: _buildInputBorder(),
              border: _buildInputBorder(),
            ),
          ),
        if (state is SignupScreenState) const SizedBox(height: 25),
        TextFormField(
          controller: _emailCTRL,
          decoration: InputDecoration(
            hintText: 'email',
            labelText: 'Email',
            prefixIcon: const Icon(
              Icons.mail,
              color: Colors.black87,
            ),
            enabledBorder: _buildInputBorder(),
            border: _buildInputBorder(),
          ),
        ),
        const SizedBox(height: 25),
        TextFormField(
          controller: _passCTRL,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'password',
            labelText: 'Password',
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.black87,
            ),
            border: _buildInputBorder(),
            enabledBorder: _buildInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildFab(UserState state, context) {
    return FloatingActionButton(
      elevation: 30,
      onPressed: () => _handleFabPress(state, context),
      backgroundColor: Colors.black87,
      child: state is SignupScreenState
          ? const Icon(Icons.ios_share)
          : const Icon(Icons.login),
    );
  }

  Widget _buildBottomWave() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Opacity(
          opacity: 0.3,
          child: Image.asset(
            'assets/images/wave1.png',
            height: 100,
            fit: BoxFit.fitHeight,
          ),
        ),
        Image.asset(
          'assets/images/wave1.png',
          height: 70,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }

  OutlineInputBorder _buildInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    );
  }

  _handleFabPress(state, context) {
    if (_isValidData(state)) {
      final userBloc = BlocProvider.of<UserBloc>(context);

      if (state is SignupScreenState) {
        user = User(
          name: _nameCTRL.text,
          email: _emailCTRL.text,
          password: _passCTRL.text,
        );
        userBloc.add(SignupEvent(user: user));
      } else if (state is LoginScreenState || state is UserInitial) {
        user = User(
          name: '',
          email: _emailCTRL.text,
          password: _passCTRL.text,
        );
        userBloc.add(LoginEvent(user: user));
      }
    } else {
      SnackMessenger().showErrorSnack(context, 'Oops!');
    }
  }

  bool _isValidData(UserState state) {
    // return true;
    String n = _nameCTRL.text;
    String e = _emailCTRL.text;
    String p = _passCTRL.text;

    // better is to specify a specific returned text for each case and show
    // that for the user in the ui but just developing time concerns are there
    // as i'm too busy currently for sorrow!

    bool nameIsValid =
        (state is SignupScreenState && n.length > 3 && n.length < 50) ||
            (state is! SignupScreenState && n.isEmpty);

    if (nameIsValid &&
        e.length > 4 &&
        e.contains('@') &&
        e.contains('.') &&
        !e.contains(' ') &&
        p.length > 5 &&
        p.length < 50) {
      return true;
    }

    return false;
  }
}
