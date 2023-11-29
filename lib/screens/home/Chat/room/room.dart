// Flutter imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:unnamed/util/exentions/colors.extentions.dart';

import '../../../../Model/users.model.dart';

class Room extends StatefulWidget {
  final Users user;

  const Room({super.key, required this.user});

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  ChatMessage newmsg = const ChatMessage(
    text: "coucou c'est pour tester",
    isMyMessage: false,
  );

  Future<void> _handleSubmitted(String text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isMyMessage: true,
    );
    setState(() {
      _messages.add(message);
      _messages.add(newmsg);
    });
    await FirebaseFirestore.instance.collection("message").add({
      'text': text,
      'userId': FirebaseAuth.instance.currentUser?.uid,
      'recipientId': widget.user.id,
      'date': DateTime.now(),
    });
    print('User post this message successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            )),
        title: Text(widget.user.username,
            style: TextStyle(color: CustomColors.blackk)),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              /*  TODO presque
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('messages')
                    .where('userId',
                        whereIn: [FirebaseAuth.instance.currentUser?.uid, widget.user.id])
                    .where('recipientId',
                        whereIn: [FirebaseAuth.instance.currentUser?.uid, widget.user.id])
                    .orderBy('date',
                        descending:
                            false) // Vous pouvez ajuster cet ordre selon vos besoins
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }

                  var messages = snapshot.data?.docs;

                  // Créer une liste de widgets représentant les messages

                  for (var message in messages!) {
                    var messageData = message.data() as Map<String, dynamic>;
                    var messageText = messageData['text'];
                    var senderId = messageData['userId'];

                    // Vous pouvez personnaliser l'affichage en fonction de l'émetteur ou du destinataire
                    var messageWidget = ListTile(
                      title: Text(messageText),
                      subtitle: Text(senderId == FirebaseAuth.instance.currentUser?.uid
                          ? 'Moi'
                          : 'Autre utilisateur'),
                    );

                    _messages.add(ChatMessage(text: messageText, isMyMessage: senderId == FirebaseAuth.instance.currentUser?.uid));
                  }

                  // Afficher la liste des messages dans un ListView
                  return ListView(
                    children: _messages,
                  );
                },
              ),
               */
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              ),
            ),
            _buildComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
        color: CustomColors.divider,
        width: 1.0,
      ))),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              controller: _textController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: CustomColors.primary),
            onPressed: () {
              _handleSubmitted(_textController.text);
            },
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMyMessage;

  const ChatMessage({super.key, required this.text, this.isMyMessage = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Align(
        alignment: isMyMessage ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: isMyMessage ? CustomColors.primary : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
                bottomLeft:
                    isMyMessage ? const Radius.circular(10.0) : Radius.zero,
                bottomRight:
                    isMyMessage ? Radius.zero : const Radius.circular(10.0),
              )),
          child: Text(
            text,
            style: TextStyle(
                color: isMyMessage ? Colors.white : CustomColors.blackk),
          ),
        ),
      ),
    );
  }
}
