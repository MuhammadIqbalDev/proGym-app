import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pro_gym/Models/error_model.dart';
import 'package:pro_gym/Models/user_model.dart';
import 'package:pro_gym/repositories/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit({required this.profileRepository})
      : super(ProfileState.initial());

      Future<void> getProfile({required String uid})async{
        emit(state.copyWith(profileStatus: ProfileStatus.loading));
        try{
          final User user = await profileRepository.getProfile(uid: uid);
          emit(state.copyWith(
            profileStatus: ProfileStatus.loaded,
            user: user,
          ));
        }on CustomError catch(e){
          emit(state.copyWith(profileStatus: ProfileStatus.error, error: e));
        }
      }
}
