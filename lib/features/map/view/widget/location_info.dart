import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationInfo extends StatefulWidget {
  const LocationInfo({super.key});

  @override
  State<LocationInfo> createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  final Uri _twitterurl = Uri.parse('https://twitter.com/ANIPLUS_SHOP');
  final Uri _shopurl = Uri.parse('https://shop.aniplustv.com/');

  Future<void> _twitterUrl() async {
    if (!await launchUrl(_twitterurl)) {
      throw Exception('Could not launch $_twitterurl');
    }
  }

  Future<void> _shopUrl() async {
    if (!await launchUrl(_shopurl)) {
      throw Exception('Could not launch $_shopurl');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            height: size.height * 0.55,
            padding: const EdgeInsets.only(
              bottom: 50,
            ),
            child: Scaffold(
              body: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        "https://lh3.googleusercontent.com/p/AF1QipMJ5eKMW2vOxxvPrlgvz5QlmUX-aEIFkDm5ERo=s680-w680-h510",
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 8,
                        child: Container(
                          width: 50,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.7),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "애니플러스 합정점",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(color: Colors.grey.shade500, thickness: 1.0),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Icon(Ionicons.location_outline),
                            SizedBox(
                              width: 10,
                            ),
                            Text("서울특별시 마포구 월드컵로3길 14"),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: _twitterUrl,
                          child: Row(
                            children: [
                              Icon(
                                Ionicons.logo_twitter,
                                color: Colors.grey.shade500,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "@ANIPLUS_SHOP",
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: _shopUrl,
                          child: Row(
                            children: const [
                              Icon(
                                Ionicons.bag_handle_outline,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "https://shop.aniplustv.com/",
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
