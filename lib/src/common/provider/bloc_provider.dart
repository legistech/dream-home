import 'package:dream_home/src/features/chatting/application/blocs/chats/chats_bloc.dart';
import 'package:dream_home/src/features/chatting/application/blocs/create_chat/create_chat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/application/blocs/forgot_pwd/forgot_pwd_bloc.dart';
import '../../features/authentication/application/blocs/login/login_bloc.dart';
import '../../features/authentication/application/blocs/register/register_bloc.dart';
import '../../features/featured_properties/application/blocs/bloc/featured_properties_bloc.dart';
import '../../features/user_profile/application/blocs/profile_bloc/profile_bloc.dart';

class Providers {
  static List<BlocProvider<dynamic>> get blocProviders => [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
        BlocProvider<ForgotPwdBloc>(create: (context) => ForgotPwdBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
        BlocProvider<ChatsBloc>(create: (context) => ChatsBloc()),
        BlocProvider<CreateChatBloc>(create: (context) => CreateChatBloc()),
        BlocProvider<FeaturedPropertiesBloc>(
            create: (context) => FeaturedPropertiesBloc()),
        BlocProvider<CreateChatBloc>(create: (context) => CreateChatBloc()),
      ];
}
