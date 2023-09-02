import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

_launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

getNewsCard(e) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children:[ Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color.fromARGB(255, 32, 96, 126)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(e["image_url"]??Image.network("img_placeHolder")),
            ),
            GestureDetector(
              onTap: ()=>_launchUrl(e["link"]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      e["title"],
                      style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    const SizedBox(
                  height: 15,
                ),
                Text(e["description"])
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            
          ],
        ),
      ),

      Positioned(
        top: 20,
        right: 20,
        child:GestureDetector(
          onTap:()=> Share.share("Interesting news: ${e["link"]}")
          ,child: const Icon(Icons.share,color: Colors.white,) ,)
        )
    ]),
  );
}
