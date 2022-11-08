import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  body: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('chats/7RTrigeYbb8Qq06la2ty/messages')
                        .snapshots(),
                    builder: ((context, streamSnapshot) {
                      if (streamSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final documents = streamSnapshot.data!.docs;
                      return ListView.builder(
                        itemBuilder: (ctx, index) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(documents[index]['text'] as String),
                          );
                        },
                        itemCount: documents.length,
                      );
                    }),
                  ),
                  floatingActionButton: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () async {
                      FirebaseFirestore.instance
                          .collection('chats/7RTrigeYbb8Qq06la2ty/messages')
                          .add(
                        {'text': 'this was added by clicking the button'},
                      );
                    },
                  ),
                ),
    );
  }
}
