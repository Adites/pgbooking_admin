import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pgbooking_admin/controller/home_controller.dart';
import 'package:pgbooking_admin/widget/dropdown_btn.dart';

class AddPgPage extends StatelessWidget {
  final Function onAdd;
  const AddPgPage({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add PG'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Add PG',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.indigoAccent,
                          fontWeight: FontWeight.bold)),
                  TextField(
                      controller: ctrl.pgNameCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: const Text('PG Name'),
                          hintText: 'enter your PG name')),
                  const SizedBox(height: 10),
                  TextField(
                      controller: ctrl.pgPlaceCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: const Text('Place'),
                          hintText: 'enter your Place')),
                  const SizedBox(height: 10),
                  TextField(
                    controller: ctrl.pgDescriptionCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: const Text('Description'),
                        hintText: 'PG Description'),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                      controller: ctrl.pgImgCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: const Text('Image URL'),
                          hintText: 'enter image url')),
                  const SizedBox(height: 10),
                  TextField(
                      controller: ctrl.pgPriceCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: const Text('PG Price'),
                          hintText: 'enter your PG price')),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                          child: DropDownBtn(
                        items: const ['1 bed', '2 bed', '3 bed', '4 bed'],
                        selectedValue: ctrl.room.value.toString(),
                        selectedItemText: "Select Bed type",
                        OnSelected: (String? selectedValue) {
                          ctrl.room.value = selectedValue ?? "4 bed";
                          ctrl.update();
                        },
                      )),
                      Flexible(
                          child: DropDownBtn(
                        items: const ['All', 'Male', 'female', 'Colive'],
                        selectedValue: ctrl.category.value,
                        selectedItemText: "Select Room Type",
                        OnSelected: (selectedValue) {
                          ctrl.category.value = selectedValue ?? 'All';
                          ctrl.update();
                        },
                      )),
                    ],
                  ),
                  /* SizedBox(height: 10),
                  Text('Room Type'),
                  DropDownBtn(
                    items: ['1 bed', '2 bed', '3 bed', '4 bed'],
                    selectedItemText: ctrl.room.toString(),
                    onSelected: (selectedValue) {
                      ctrl.room = int.tryParse(selectedValue ?? 4) ?? 4;
                      ctrl.update();
                    },
                    OnSelected: (selecteValue) {},
                  ),*/
                  SizedBox(height: 10),
                  // ignore: prefer_const_constructors
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        ctrl.addPG();
                        Get.back();
                        onAdd();
                      },
                      child: Text("Add PG"))
                ]),
          ),
        ),
      );
    });
  }
}
