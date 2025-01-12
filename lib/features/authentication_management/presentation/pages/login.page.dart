import "package:flutter/material.dart";
import "package:flutter/physics.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_bloc.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_event.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/login/login_bloc.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/login/login_event.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/login/login_state.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<_ErrorMessage> _currentErrors = [];

  void _addErrors(List<String> messages) async{
    for (int i = 0; i < messages.length; i++) {
      setState(() {
        _currentErrors.add(_ErrorMessage(message: messages[i], isVisible: true));
      });
      // Wait 1 second before adding the next error
      await Future.delayed(const Duration(milliseconds:500));
    }

    for (int i = messages.length - 1; i >= 0; i--) {
      await Future.delayed(const Duration(milliseconds: 500));

      if (mounted && i < _currentErrors.length) {
        setState(() {
          _currentErrors[i] = _currentErrors[i].copyWith(isVisible: false);
        });
      }

      await Future.delayed(const Duration(milliseconds: 300));

      if (mounted && i < _currentErrors.length) {
        setState(() {
          _currentErrors.removeAt(i);
        });
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailOrUsernameController =
        TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        children:[
          BlocConsumer<LoginBloc, LoginState>(
            listener: _listener,
            builder: (context, state) {
              if (state is LoginLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                  TextField(
                    controller: _emailOrUsernameController,
                    decoration: InputDecoration(labelText: "Email or username"),
                    onChanged: (email) => _emailChanged(context, email: email),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    onChanged: (password) =>
                        _passwordChanged(context, password: password),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () => _logIn(context,
                          emailOrUsername: _emailOrUsernameController.value.text,
                          password: _passwordController.value.text),
                      child: Text("Log In"))
                ]));
              }
            }),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _currentErrors
                  .asMap()
                  .entries
                  .map((entry) => _buildAnimatedErrorCard(entry.value, entry.key))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  _listener(context, state) {
    if (state is LoginFailureState) {
      _addErrors(state.errorMessages);
    }else if(state is LoginSuccessState){
      this.context.read<AuthenticationBloc>().add(UserConnectedEvent(state.key));
    }
  }

  _logIn(BuildContext context, {String? emailOrUsername, String? password}) {
    context
        .read<LoginBloc>()
        .add(LoginRequestedEvent(emailOrUsername, password));
  }

  _emailChanged(BuildContext context, {String? email}) {
    //context.read<LoginBloc>().add(LoginEmailChangedEvent(email));
    //throw UnimplementedError();
  }

  _passwordChanged(BuildContext context, {String? password}) {
    //context.read<LoginBloc>().add(LoginPasswordChangedEvent(password));
  }

  Widget _buildAnimatedErrorCard(_ErrorMessage error, int index){
    return AnimatedOpacity(
      opacity: error.isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 500),
        offset: error.isVisible ? Offset(0, 0) : Offset(0, -0.5),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Text(
            error.message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}


class _ErrorMessage {
  final String message;
  final bool isVisible;

  _ErrorMessage({required this.message, required this.isVisible});

  _ErrorMessage copyWith({String? message, bool? isVisible}) {
    return _ErrorMessage(
      message: message ?? this.message,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
