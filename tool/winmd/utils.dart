// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Useful shared utility methods.

import 'enums.dart';

class WinmdException implements Exception {
  final String message;

  WinmdException(this.message);

  @override
  String toString() => 'WinmdException: $message';
}

extension CamelCaseConversion on String {
  String toCamelCase() =>
      length >= 2 ? substring(0, 1).toLowerCase() + substring(1) : this;
}

bool tokenIsTypeRef(int token) =>
    token & CorTokenType.mdtTypeRef == CorTokenType.mdtTypeRef;
bool tokenIsTypeDef(int token) =>
    token & CorTokenType.mdtTypeDef == CorTokenType.mdtTypeDef;
bool tokenIsTypeSpec(int token) =>
    token & CorTokenType.mdtTypeSpec == CorTokenType.mdtTypeSpec;

class UncompressedData {
  int data;
  int dataLength;

  UncompressedData(this.data, this.dataLength);
}

UncompressedData corSigUncompressData(List<int> pBytes) {
  // Smallest -- one byte
  if ((pBytes[0] & 0x80) == 0x00) // 0??? ????
  {
    return UncompressedData(pBytes[0], 1);
  }
  // Medium -- two bytes
  else if ((pBytes[0] & 0xC0) == 0x80) // 10?? ????
  {
    if (pBytes.length < 2) {
      throw WinmdException('Bad signature');
    } else {
      return UncompressedData((((pBytes[0] & 0x3f) << 8 | pBytes[1])), 2);
    }
  }
  // Large -- four bytes
  else if ((pBytes[0] & 0xE0) == 0xC0) // 110? ????
  {
    if (pBytes.length < 4) {
      throw WinmdException('Bad signature');
    } else {
      return UncompressedData(
          ((pBytes[0] & 0x1f) << 24 |
              (pBytes[1]) << 16 |
              (pBytes[2]) << 8 |
              (pBytes[3])),
          4);
    }
  } else // We don't recognize this encoding
  {
    throw WinmdException('Bad signature');
  }
}

int unencodeDefRefSpecToken(int encoded) {
  var token = encoded >> 2;

  if (encoded & 0x03 == 0x00) {
    // typedef
    return CorTokenType.mdtTypeDef | token;
  }
  if (encoded & 0x03 == 0x01) {
    // typeref
    return CorTokenType.mdtTypeRef | token;
  }
  if (encoded & 0x03 == 0x02) {
    // typespec
    return CorTokenType.mdtTypeSpec | token;
  } else {
    return 0;
  }
}
