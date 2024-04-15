// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pgbooking_admin/controller/home_controller.dart';
import 'package:pgbooking_admin/pages/add_pg_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('PGbooking Admin'),
        ),
        body: ListView.builder(
            itemCount: ctrl.pgdetail.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ctrl.pgdetail[index].name ?? ''),
                subtitle: Text((ctrl.pgdetail[index].price ?? 0).toString()),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    ctrl.deletePg(ctrl.pgdetail[index].id ?? '');
                  },
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddPgPage(
              onAdd: () {
                ctrl.fetchPG();
              },
            ));
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
