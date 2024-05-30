import 'package:flutter/material.dart';
import 'package:mh_admin_panel/apis/apis.dart';

import 'package:mh_admin_panel/doctor_card.dart';

import 'package:mh_admin_panel/models/doctor.dart';

class ApprovedDoctors extends StatefulWidget {
  const ApprovedDoctors({super.key});

  @override
  State<ApprovedDoctors> createState() => _ApprovedDoctorsState();
}

class _ApprovedDoctorsState extends State<ApprovedDoctors> {
  List<Doctor> _approvedDoctors = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Apis.fetchApprovedDoctors(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            // if data is loading
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(
                child: CircularProgressIndicator(),
              );

            //if all or some data is loaded show it
            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data!.docs;

              _approvedDoctors =
                  data.map((e) => Doctor.fromJson(e.data())).toList();
              if (_approvedDoctors.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      padding: const EdgeInsets.only(
                          top: 0, left: 8, right: 8, bottom: 8),
                      itemCount: _approvedDoctors.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: DoctorCard(
                            doctor: _approvedDoctors[index],
                          ),
                        );
                      }),
                );
              } else {
                return const Center(
                  child: Text("No pending Doctors"),
                );
              }
          }
        });
  }
}
