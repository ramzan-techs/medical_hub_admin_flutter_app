import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mh_admin_panel/constants.dart';
import 'package:mh_admin_panel/doctor_profile_view.dart';
import 'package:mh_admin_panel/main.dart';
import 'package:mh_admin_panel/models/doctor.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  const DoctorCard({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DoctorProfileView(doctor: doctor)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Constants().primaryColor)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        height: mq.width * .25,
                        width: mq.width * .25,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Icon(Icons.person),
                        imageUrl: doctor.profileImageUrl,
                        errorWidget: (context, url, error) =>
                            const Icon(CupertinoIcons.person),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: mq.width * 0.525,
                      child: Text(
                        "Dr. ${doctor.name}",
                        maxLines: null,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Constants().primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: mq.width * 0.525,
                      child: Text(
                        doctor.speciality,
                        style: TextStyle(
                            color: Constants().primaryColor,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    SizedBox(
                      width: mq.width * 0.525,
                      child: Text(
                        doctor.city,
                        style: TextStyle(
                            color: Constants().primaryColor,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
