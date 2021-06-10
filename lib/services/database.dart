import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:z_pefect_cup/modals/tea.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference teaCollection =
      FirebaseFirestore.instance.collection("tea");

  //create into collection
  Future addDoc(String sugar, String name, int strength) async {
    return await teaCollection
        .doc(uid)
        .set({"sugar": sugar, "name": name, "strength": strength});
  }

  //read data
  // Stream<QuerySnapshot> get dataStream {
  //   return teaCollection.snapshots();
  // }

  Stream<List<Tea>> get dataStream {
    return teaCollection.snapshots().map(_teaListFromSnapshot);
  }

// //tealist from querySnapshot
  List<Tea> _teaListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Tea(
          sugars: doc.get('sugars') ?? '',
          strength: doc.get('strength') ?? '',
          name: doc.get('name') ?? '');
    }).toList();
  }
  // Tea _teaListFromSnapshot(DocumentSnapshot documentSnapshot) {
  //   return documentSnapshot != null
  //       ? Tea(
  //           name: documentSnapshot.get('name'),
  //           strength: documentSnapshot.get('strength'),
  //           sugars: documentSnapshot.get('sugar'),
  //         )
  //       : null;
  // }
  //
  // //tealist from querySnapshot
  // List<Tea> _teaList(QuerySnapshot snapshot) {
  //   final teaListData = snapshot.docs.map((e) => e.data()).toList();
  // }
}
