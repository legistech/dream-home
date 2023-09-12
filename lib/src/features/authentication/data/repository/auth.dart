import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../../db/pocketbase.dart';

/// Use [AuthRepo] to handle all the authentication related operations.
class AuthRepo {
  /// Use [isUserAuthorized] to check if the current
  /// token stored in the device is still valid or not.
  static Future<bool> get isUserAuthorized async {
    try {
      final pb = await PocketBaseInstance.instance;
      if (pb.authStore.isValid) return true;
      return false;
    } catch (e) {
      rethrow;
    }
  }

  /// Use [login] to login a user with email and password.
  static Future<void> login(
    String email,
    String password,
  ) async {
    final pb = await PocketBaseInstance.instance;
    try {
      await pb.collection('users').authWithPassword(
            email,
            password,
          );
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  /// Use [register] to register a user with email, name and password.
  static Future<RecordModel> register(
      String email, String name, String password) async {
    final pb = await PocketBaseInstance.instance;
    try {
      final record = await pb.collection('users').create(body: {
        'email': email,
        'name': name,
        'password': password,
        'passwordConfirm': password,
      });

      // TODO: Add request email verification method after user registration after creating an email verification page.
      // await pb.collection('users').requestEmailVerification(email);
      return record;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<void> requestVerification(String email) async {
    final pb = await PocketBaseInstance.instance;
    try {
      pb.collection('users').requestVerification(email);
    } on ClientException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
