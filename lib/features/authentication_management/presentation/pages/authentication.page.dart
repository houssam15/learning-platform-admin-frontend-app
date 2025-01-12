import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_bloc.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_event.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_state.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/login/login_bloc.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/pages/login.page.dart";
import "package:licence_driving_admin/injection_container.dart";

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  _logIn() {
    throw UnimplementedError();
  }

  _logOut() {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: MultiBlocProvider(
        providers: [
            BlocProvider<AuthenticationBloc>(create: (context) => sl<AuthenticationBloc>()..add(AppStartedEvent())),
            BlocProvider<LoginBloc>(create: (context) => sl<LoginBloc>())
        ],
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if(kDebugMode) print(state);
            },
            builder: (context, state) {
          if (state is AuthenticationLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AuthenticationUnauthenticatedState) {
            return const LoginPage();
          } else if (state is AuthenticationAuthenticatedState) {
            return Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("Welcome, User ID: ${state.connectedUser.id} ${state.connectedUser.username} ${state.connectedUser.accessToken} ${state.connectedUser.email} ${state.connectedUser.role}"),
              SizedBox(height: 16),
              ElevatedButton(onPressed: _logOut, child: Text("Log Out"))
            ]));
          } else {
            return Center(
              child: Text(
                "Unkown state",
                style:TextStyle(fontSize: 18,color: Colors.red)
              ),
            );
          }
        }),
      ),
    );
  }
}
