import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

final userRef = FirebaseFirestore.instance.collection('users');