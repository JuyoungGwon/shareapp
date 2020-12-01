// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Usercollect {
  final String Email;
  final String name;
  final String student_id;
  final String English_name;
  final String CellPhone;
  final String BANK;
  final String Accountnum;
  final DocumentReference reference;

  //String timestamp;

  Usercollect.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['Email'] != null),
        assert(map['English_name'] != null),
        assert(map['CellPhone'] != null),
        assert(map['BANK'] != null),
        assert(map['Accountnum'] != null),
        assert(map['name'] != null),
        assert(map['student_id'] != null),

        Email = map['Email'],
        English_name = map['English_name'],
        CellPhone = map['CellPhone'],
        BANK = map['BANK'],
        Accountnum = map['Accountnum'],
        name = map['name'],
        student_id = map['student_id'];






  Usercollect.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$name>";

}