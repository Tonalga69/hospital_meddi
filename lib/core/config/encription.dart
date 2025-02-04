import 'package:encrypt_shared_preferences/provider.dart';
import 'package:encrypt/encrypt.dart';

import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

///Saque esta clase de la libreria encrypt para poder usarla en el proyecto
class CustomSalsa20Encryptor extends IEncryptor {
  final int ivLength = 8;

  @override
  String encrypt(String key, String plainText) {
    if (plainText.trim().isEmpty) return "";

    final keyDigest = sha256.convert(utf8.encode(key)).bytes;
    final cipherKey = Key(Uint8List.fromList(keyDigest));

    final salsa20Algorithm = Salsa20(cipherKey);


    final initVector = IV.fromSecureRandom(ivLength);

    final encryptedData = salsa20Algorithm.encrypt(
      Uint8List.fromList(utf8.encode(plainText)),
      iv: initVector,
    );


    final combined = Uint8List(initVector.bytes.length + encryptedData.bytes.length);
    combined.setRange(0, initVector.bytes.length, initVector.bytes);
    combined.setRange(initVector.bytes.length, combined.length, encryptedData.bytes);


    return base64.encode(combined);
  }

  @override
  String decrypt(String key, String encryptedData) {
    if (encryptedData.trim().isEmpty) return "";


    final keyDigest = sha256.convert(utf8.encode(key)).bytes;
    final cipherKey = Key(Uint8List.fromList(keyDigest));


    final salsa20Algorithm = Salsa20(cipherKey);

    final combined = base64.decode(encryptedData);

    final ivBytes = combined.sublist(0, ivLength);
    final encryptedBytes = combined.sublist(ivLength);
    final initVector = IV(ivBytes);


    final decryptedBytes = salsa20Algorithm.decrypt(
      Encrypted(encryptedBytes),
      iv: initVector,
    );

    return utf8.decode(decryptedBytes);
  }
}
