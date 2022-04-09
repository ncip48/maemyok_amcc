import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4,
                  color: Colors.redAccent,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(
                  'https://th-thumbnailer.cdn-si-edu.com/5a79C6jJ8BrChMX5tgEKiMI_qqo=/1000x750/filters:no_upscale():focal(792x601:793x602)/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/52/e4/52e44474-c2dc-41e0-bb77-42a904695196/this-image-shows-a-portrait-of-dragon-man-credit-chuang-zhao_web.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 42),
            Text(
              'Topiq Alpianto',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 32),
            GestureDetector(
              onTap: () async {
                await launch(
                    'mailto:abc@gmail.com?subject=Ini subject&body=Ini body email');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.email,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text('abc@gmail.com')
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () async {
                await launch('tel:081234634');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.phone),
                  ),
                  SizedBox(width: 16),
                  Text('0871627612')
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/webview'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.abc),
                  ),
                  SizedBox(width: 16),
                  Text('LinkedIn')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
