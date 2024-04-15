import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:pgbooking_admin/model/pg/pg.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference pgCollection;

  TextEditingController pgNameCtrl = TextEditingController();
  TextEditingController pgDescriptionCtrl = TextEditingController();
  TextEditingController pgImgCtrl = TextEditingController();
  TextEditingController pgPriceCtrl = TextEditingController();
  TextEditingController pgPlaceCtrl = TextEditingController();

  RxString category = 'All'.obs;
  RxString room = "4 bed".obs;
  List<PG_details> pgdetail = [];

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    pgCollection = firestore.collection('PG_detail');
    await fetchPG();
    super.onInit();
  }

  addPG() {
    try {
      DocumentReference doc = pgCollection.doc();
      PG_details pgdetail = PG_details(
        id: doc.id,
        name: pgNameCtrl.text,
        category: 'female',
        description: pgDescriptionCtrl.text,
        price: double.tryParse(pgPriceCtrl.text),
        place: pgPlaceCtrl.text,
        image: pgImgCtrl.text,
        room: 4,
      );
      final pgdetailJson = pgdetail.toJson();
      doc.set(pgdetailJson);
      Get.snackbar('success', 'Product added succeccfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  fetchPG() async {
    try {
      QuerySnapshot pgSnapshot = await pgCollection.get();
      final List<PG_details> retrievepg = pgSnapshot.docs
          .map((doc) => PG_details.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      pgdetail.clear();
      pgdetail.assignAll(retrievepg);
      Get.snackbar('Success', 'PG detail fetch successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  deletePg(String id) async {
    try {
      await pgCollection.doc(id).delete();
      fetchPG();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }

  setValuesDefault() {
    pgNameCtrl.clear();
    pgDescriptionCtrl.clear();
    pgPriceCtrl.clear();
    pgPlaceCtrl.clear();
    pgImgCtrl.clear();

    category.value = 'All';
    room.value = "4 bed";

    update();
  }
}
