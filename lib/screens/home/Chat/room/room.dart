import 'package:flutter/material.dart';
import 'package:unnamed/util/exentions/colors.extentions.dart';


class Room extends StatefulWidget{
  const Room({super.key});

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  ChatMessage newmsg = const ChatMessage(text: "coucou c'est pour tester", isMyMessage: false,);

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isMyMessage: true,
      // Vous pouvez définir d'autres propriétés comme l'auteur, l'heure, etc.
    );
    setState(() {
      _messages.add(message);
      _messages.add(newmsg);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            )
        ),
        title: const Text("Room", style: TextStyle(color: CustomColors.blackk)),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
            color: CustomColors .divider,
            width: 1.0,
          )
        )
      ),
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
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width *0.8
          ),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isMyMessage ? CustomColors.primary : Colors.white,
            borderRadius:BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight:const Radius.circular(10.0),
                bottomLeft: isMyMessage ? const Radius.circular(10.0) : Radius.zero,
                bottomRight: isMyMessage? Radius.zero : const Radius.circular(10.0),

            )
          ),
          child: Text(
            text,
            style: TextStyle(color: isMyMessage ? Colors.white : CustomColors.blackk),
          ),
        ),
      ),
    );
  }
}