import 'package:cloud_firestore/cloud_firestore.dart';

// Define a data model for chat messages
class ChatMessage {
  final String message;
  final String senderId;

  // final Timestamp timestamp;

  ChatMessage({required this.message, required this.senderId});
}

// Send message to Firebase
void sendMessage(String message, String senderId) {
  FirebaseFirestore.instance.collection('messages').add({
    'message': message,
    'senderId': senderId,
    'timestamp': Timestamp.now(),
  });
}

// Retrieve messages from Firebase
