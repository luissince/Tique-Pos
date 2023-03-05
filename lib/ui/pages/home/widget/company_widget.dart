import 'package:appsauri/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CompanyWidget extends StatelessWidget {
  final Size size;
  final String path;
  final String ruc;
  final String name;

  const CompanyWidget({
    Key? key,
    required this.size,
    this.path = "",
    required this.ruc,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (path == "")
          Image.asset(
            "assets/tiquepos_logo.png",
            height: 120,
          )
        else
          CachedNetworkImage(
            imageUrl: "https://$path",
            placeholder: (context, url) => CircularProgressIndicator(
              color: colorPrimary,
            ),
            errorWidget: (context, url, error) => Image.asset(
              "assets/tiquepos_logo.png",
              height: 120,
            ),
            width: 120,
            height: 120,
          ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ruc,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                width: size.width,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xffe0e0e0),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.expand_more,
                        color: Color.fromRGBO(41, 45, 67, 1),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          "Huequito 1",
                          style: TextStyle(
                            color: Color.fromRGBO(41, 45, 67, 1),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
