
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_pattern_bloc/bloc/list_user_state.dart';
import 'package:users_pattern_bloc/service/http_service.dart';
import 'package:users_pattern_bloc/service/log_service.dart';

import '../model/user_model.dart';

class ListUserCubit extends Cubit<ListUserState>{
  ListUserCubit() : super(ListUserInit());

  void apiPostList() async{
    emit(ListUserLoading());
    final response = await Network.GET(Network.API_USER_LIST, Network.paramsEmpty());
    LogService.e(response!);
    if(response != null &&  Network.parseUserList(response) != null){
      LogService.e(response!);
      emit(ListUserLoaded(users: Network.parseUserList(response)));
    }else{
      LogService.e(response!);
      emit(ListUserError(error: "Could't fetch posts"));
    }
  }

  void apiPostDelete(User user) async {
    emit(ListUserLoading());
    final response = await Network.DEL(
        Network.API_DELETE + user.id.toString(), Network.paramsEmpty());
    print(response);
    if (response != null) {
      LogService.e("Couldn't deleERFEFEFte post");
      apiPostList();
    } else {
      LogService.e("Couldn't delete post");
      emit(ListUserError(error: "Couldn't delete post"));
    }
  }
}