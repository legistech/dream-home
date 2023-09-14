import 'package:dream_home/src/features/chatting/application/blocs/messages/messages_bloc.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key, required this.chatId});
  final String chatId;
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MessagesBloc>().add(MessagesLoad(widget.chatId));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: const Scaffold(),
    );
  }
}
