import 'package:caht_appreview/constant.dart';
import 'package:caht_appreview/model/model_message.dart';
import 'package:caht_appreview/views/cubits/login_cubit/chat_cubit/chat_cubit.dart';
import 'package:caht_appreview/widgets/custom_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = 'ChatView';

  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  List<Message> messageList = [];
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryKey,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(klogo, height: 65),
            const Text(' Chat Bubble'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messageList = state.message;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messageList.length,
                  itemBuilder: (context, index) {
                    return messageList[index].id == email
                        ? customChatBubble(
                            message: messageList[index],
                          )
                        : customChatBubbleFriends(message: messageList[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                controller.clear();
                _controller.animateTo(
                  0,
                  duration: const Duration(seconds: 2),
                  curve: Curves.bounceIn,
                );
              },
              decoration: InputDecoration(
                  hintText: 'Send Message',
                  suffixIcon: const Icon(
                    Icons.send,
                    color: kPrimaryKey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
