// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:mh_admin_panel/apis/apis.dart';
import 'package:mh_admin_panel/constants.dart';
import 'package:mh_admin_panel/custom_widgets.dart';
import 'package:mh_admin_panel/helper/my_date_util.dart';
import 'package:mh_admin_panel/main.dart';
import 'package:mh_admin_panel/models/doctor.dart';
import 'package:mh_admin_panel/profile_pic_view.dart';
import 'package:shimmer/shimmer.dart';

class DoctorProfileView extends StatelessWidget {
  final Doctor doctor;
  const DoctorProfileView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: mq.width,
          ),

          // Top decoration .....................
          // ....................................

          Container(
            height: mq.height * 0.12,
            decoration: BoxDecoration(
              color: Constants().secondaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.chevron_left,
                          size: 40,
                          color: Constants().onPrimary,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Dr. ${doctor.name}",
                        style: TextStyle(
                            color: Constants().onPrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          // body .......................
          // ............................
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: mq.height * 0.12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                        child: Column(
                          children: [
                            SizedBox(
                              width: mq.width,
                              height: mq.width * 0.212,
                            ),
                            Text(
                              "Dr. ${doctor.name}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              doctor.speciality,
                              style: const TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: mq.height * 0.03,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: mq.width * 0.86,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.black38))),
                              child: Row(
                                children: [
                                  const Icon(Icons.location_pin),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: mq.width * 0.76,
                                    child: Text(
                                      "${doctor.address}, ${doctor.city}, ${doctor.state} ",
                                      maxLines: null,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Phone Container ****************
                            // **********************************
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: mq.width * 0.86,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.black38))),
                              child: Row(
                                children: [
                                  const Icon(Icons.phone),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: mq.width * 0.76,
                                    child: Text(
                                      doctor.phone,
                                      maxLines: null,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Education Container ***********************
                            // ***************************************

                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: mq.width * 0.86,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.black38))),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/education.png",
                                    height: 25,
                                    width: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: mq.width * 0.76,
                                    child: Text(
                                      doctor.qualification,
                                      maxLines: null,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Likes Container ************************
                            // ****************************************

                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: mq.width * 0.86,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.black38))),
                              child: Row(
                                children: [
                                  const Icon(Icons.favorite_outline_rounded),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: mq.width * 0.76,
                                    child: Text(
                                      "Favourite of ${doctor.favoritesCount} people",
                                      maxLines: null,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Membership date container ***********************
                            //  ************************************************

                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: mq.width * 0.86,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.black38))),
                              child: Row(
                                children: [
                                  const Icon(Icons.date_range),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: mq.width * 0.76,
                                    child: Text(
                                      "Created at ${MyDateUtil.getformattedDate(context: context, time: doctor.createdAt, showDate: true)}",
                                      maxLines: null,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // CNIC Pic container ***********************
                            //  ************************************************

                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: mq.width * 0.86,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.black38))),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.image),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: mq.width * 0.76,
                                        child: const Text(
                                          "CNIC Image",
                                          maxLines: null,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => ProfileDialog(
                                                  name: "CNIC Image:",
                                                  imageUrl:
                                                      doctor.cnicImageUrl)));
                                    },
                                    child: Container(
                                        width: mq.width * 0.9,
                                        height: mq.height * 0.25,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.green),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            height: mq.width * .4,
                                            width: mq.width * .4,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                                    baseColor:
                                                        const Color.fromARGB(
                                                            255, 119, 115, 115),
                                                    highlightColor:
                                                        Colors.grey[300]!,
                                                    child: const Icon(
                                                        Icons.person)),
                                            imageUrl: doctor.cnicImageUrl,
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.image),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),

                            // Liscence Pic container ***********************
                            //  ************************************************

                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: mq.width * 0.86,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.black38))),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.image),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: mq.width * 0.76,
                                        child: const Text(
                                          "Liscence Image:",
                                          maxLines: null,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => ProfileDialog(
                                                  name: "Liscence Image",
                                                  imageUrl:
                                                      doctor.licenseImageUrl)));
                                    },
                                    child: Container(
                                        width: mq.width * 0.9,
                                        height: mq.height * 0.25,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.green),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            height: mq.width * .4,
                                            width: mq.width * .4,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                                    baseColor:
                                                        const Color.fromARGB(
                                                            255, 119, 115, 115),
                                                    highlightColor:
                                                        Colors.grey[300]!,
                                                    child: const Icon(
                                                        Icons.person)),
                                            imageUrl: doctor.licenseImageUrl,
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.image),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),

                            if (!doctor.isReviewed)
                              SizedBox(
                                width: mq.width,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      width: mq.width * 0.47,
                                      decoration: const BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12))),
                                      child: GestureDetector(
                                        onTap: () async {
                                          CustomWidget.showProgressBar(context);
                                          await Apis.updateStatus(
                                              true, doctor.id);

                                          Navigator.pop(context);
                                          CustomWidget.showSnackBar(
                                              context, "Approved Successfully");

                                          Navigator.pop(context);
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.check_circle_outline),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              "Approve",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        CustomWidget.showProgressBar(context);
                                        await Apis.updateStatus(
                                            false, doctor.id);

                                        Navigator.pop(context);

                                        CustomWidget.showSnackBar(
                                            context, "Approved Successfully");

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        width: mq.width * 0.45,
                                        decoration: BoxDecoration(
                                            color:
                                                Constants().secondaryTextColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(12))),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.info,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              "Decline",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -(mq.width * 0.2),
                        left: mq.width * 0.27,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProfileDialog(
                                        name: doctor.name,
                                        imageUrl: doctor.profileImageUrl)));
                          },
                          child: Container(
                            height: mq.width * .4,
                            width: mq.width * .4,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Constants().primaryColor),
                                borderRadius:
                                    BorderRadius.circular(mq.height * .33)),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(mq.height * .33),
                              child: CachedNetworkImage(
                                height: mq.width * .4,
                                width: mq.width * .4,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.lightGreen,
                                        child: const Text("")),
                                imageUrl: doctor.profileImageUrl,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.person),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
