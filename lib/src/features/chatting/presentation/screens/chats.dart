import 'package:dream_home/src/features/chatting/application/blocs/chats/chats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../constants/screen.dart';
import '../../../../theme/pellet.dart';
import '../../../featured_properties/presentation/widgets/search_properties_field.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late final TextEditingController searchController;
  late String userId;

  @override
  void initState() {
    super.initState();
    context.read<ChatsBloc>().add(ChatsLoad());
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
    return Column(
      children: [
        SizedBox(height: height * 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text(
              'Chats',
              style: TextStyle(
                color: Pellet.kDark,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/create-chat');
              },
              child: const Icon(IconlyLight.edit_square),
            ),
          ],
        ),
        SizedBox(height: height * 2),
        CommonFeaturesSearchField(
          searchController: searchController,
          hintText: 'Search for chats',
        ),
        SizedBox(height: height * 2),
        BlocConsumer<ChatsBloc, ChatsState>(
          listener: (context, state) {
            if (state is ChatsLoaded) {
              userId = state.currentUserId;
            }
          },
          builder: (context, state) {
            return state is ChatsLoaded
                ? SizedBox(
                    height: height * 66,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<ChatsBloc>().add(ChatsLoad());
                      },
                      child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            final nextUser = state.chats[index].expand!.users!
                                .firstWhere((user) => user.id != userId);
                            final currentUser = state
                                .chats[index].expand!.users!
                                .firstWhere((user) => user.id == userId);
                            return Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/messages',
                                    arguments: {
                                      'chatId': state.chats[index].id,
                                      'currentUser': currentUser,
                                      'nextUser': nextUser,
                                    },
                                  );
                                },
                                trailing: Column(
                                  children: [
                                    const Text('12:30'),
                                    const SizedBox(height: 5),
                                    CircleAvatar(
                                      backgroundColor: Pellet.kPrimaryColor,
                                      radius: 10,
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                          color: Pellet.kWhite,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  nextUser.name!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: const Text(
                                    'Perfection is achieved not when..'),
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Pellet.kPrimaryColor.withOpacity(0.5),
                                ),
                              ),
                            );
                          },
                          itemCount: state.chats.length),
                    ),
                  )
                : state is ChatsLoading
                    ? const CircularProgressIndicator()
                    : const SizedBox();
          },
        ),
      ],
    );
  }
}
