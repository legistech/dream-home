import 'package:dream_home/src/common/domain/models/user.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/chatting/application/blocs/messages/messages_bloc.dart';
import 'package:dream_home/src/features/chatting/domain/models/message.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen(
      {super.key,
      required this.chatId,
      required this.currentUser,
      required this.nextUser});
  final String chatId;
  final User currentUser;
  final User nextUser;
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late List<Message> messages;
  late final TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    context.read<MessagesBloc>().add(MessagesLoad(widget.chatId));
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User currentUser = widget.currentUser;
    final User nextUser = widget.nextUser;
    final width = ScreenSize.width(context);
    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: BlocBuilder<MessagesBloc, MessagesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(nextUser.name!),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(IconlyLight.call),
                ),
              ],
            ),
            body: state is MessagesLoaded
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            itemCount: state.messages.length,
                            itemBuilder: (context, index) {
                              final message = state.messages[index];
                              return Align(
                                alignment: message.sender == currentUser.id
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: message.sender == currentUser.id
                                        ? Pellet.kWhite
                                        : Pellet.kSecondaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(message.content!),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: width * 25),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            floatingActionButton: SizedBox(
              width: width * 90,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        fillColor: Pellet.kWhite,
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<MessagesBloc>().add(
                            MessageSend(
                              chatId: widget.chatId,
                              content: messageController.text,
                              receiverId: nextUser.id!,
                            ),
                          );
                      messageController.clear();
                    },
                    icon: const Icon(IconlyLight.send),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
