part of 'auth_bloc.dart';

abstract class AuthEvent{
const AuthEvent();

@override
List<Object?>get props=> [];


}
class AuthStateChangedEvent extends AuthEvent{
  final fbAuth.User? user;

  AuthStateChangedEvent({this.user});
  @override
List<Object?>get props=> [user];
}

class SignoutRequestedEvent extends AuthEvent{
  
}
