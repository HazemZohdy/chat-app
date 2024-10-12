import 'package:bloc/bloc.dart';
import 'package:caht_appreview/constant.dart';
import 'package:caht_appreview/model/model_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

CollectionReference messages =
    FirebaseFirestore.instance.collection(kMessageCollection);

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  void sendMessage({required String message, required String email}) {
    messages.add({kMessage: message, kCreatedAt: DateTime.now(), kId: email});
  }

  void gitMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<Message> messageList = [];
      for (var doc in event.docs) {
        messageList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(message: messageList));
    });
  }
}
