import 'package:dream_home/src/common/presentation/widgets/elevated_button.dart';
import 'package:dream_home/src/common/presentation/widgets/show_error_snack.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/chatting/application/blocs/create_chat/create_chat_bloc.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/search_properties_field.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateChatScreen extends StatefulWidget {
  const CreateChatScreen({super.key});

  @override
  State<CreateChatScreen> createState() => _CreateChatScreenState();
}

class _CreateChatScreenState extends State<CreateChatScreen> {
  late final TextEditingController searchController;
  String selectedUser = '';
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: BlocConsumer<CreateChatBloc, CreateChatState>(
        listener: (context, state) {
          if (state is CreateChatCreated) {
            // TODO: Navigate to chat screen after implementing chat screen
            Navigator.pop(context);
          } else if (state is CreateChatError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(showErrorSnack(state.error));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'New Chat',
                style: TextStyle(
                  color: Pellet.kDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'To',
                    style: TextStyle(
                      color: Pellet.kDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: height * 2),
                  CommonFeaturesSearchField(
                    searchController: searchController,
                    hintText: 'Search for users',
                    onChanged: (value) {
                      context
                          .read<CreateChatBloc>()
                          .add(CreateChatInputChanged(query: value));
                    },
                  ),
                  SizedBox(
                      height: height * 60,
                      child: state is CreateChatSearchingUsers
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : state is CreateChatSearchedUsers
                              ? ListView.builder(
                                  itemCount: state.users.length,
                                  itemBuilder: (context, index) {
                                    final user = state.users[index];
                                    return ListTile(
                                      onTap: () {
                                        setState(() {
                                          selectedUser = user.id!;
                                        });
                                      },
                                      leading: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Pellet.kDark,
                                      ),
                                      title: Text(user.name!),
                                      subtitle: Text(user.id!),
                                      trailing: Radio(
                                        fillColor: MaterialStateProperty.all(
                                          Pellet.kPrimaryColor,
                                        ),
                                        value: user.id,
                                        groupValue: selectedUser,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedUser = value.toString();
                                          });
                                        },
                                      ),
                                    );
                                  },
                                )
                              : state is CreateChatNoUserFound
                                  ? Center(
                                      child: Text(
                                        'No user found',
                                        style: TextStyle(
                                          color: Pellet.kDark,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  : state is CreateChatSearchError
                                      ? Center(
                                          child: Text(state.error),
                                        )
                                      : Center(
                                          child: Text(
                                            'Search for users',
                                            style: TextStyle(
                                              color: Pellet.kDark,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ))
                ],
              ),
            ),
            floatingActionButton: CommonElevatedButton(
              text: state is CreateChatCreatingChat ? 'Loading' : 'Create Chat',
              onPressed: selectedUser.isNotEmpty
                  ? () {
                      context
                          .read<CreateChatBloc>()
                          .add(CreateChatButtonPressed(userId: selectedUser));
                    }
                  : null,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
