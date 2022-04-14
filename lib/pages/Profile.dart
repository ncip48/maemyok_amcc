import 'package:flutter/material.dart';
import 'package:maemyok_amcc/components/ListProfile.dart';
import 'package:maemyok_amcc/constant/constant.dart';
import 'package:maemyok_amcc/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: merah,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(
                  'https://media-exp1.licdn.com/dms/image/C5603AQGJgwZuQ3sUMQ/profile-displayphoto-shrink_800_800/0/1601275519734?e=1654128000&v=beta&t=kLq3-MlD8oiZo5ub0eJdH91TQyJafO2Uy0cRnVpm7cg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 42,
            ),
            Text(
              'Herly Chahya',
              style: ukuran2,
            ),
            SizedBox(height: 32),
            ListProfile(
              label: 'mbahcip00@gmail.com',
              icon: Icon(Icons.email),
              action: () async {
                await launch('mailto:mbahcip00@gmail.com');
              },
            ),
            ListProfile(
              label: '085156842765',
              icon: Icon(Icons.phone),
              action: () async {
                await launch('tel:085156842765');
              },
            ),
            ListProfile(
              label: 'Linkedin',
              icon: Icon(Icons.abc),
              action: () => Navigator.of(context).pushNamed(
                Routes.WebView,
                arguments: {
                  'url': 'https://www.linkedin.com/in/herly-chahya/',
                  'title': 'Linkedin'
                },
              ),
            ),
            ListProfile(
              label: 'Facebook',
              icon: Icon(Icons.facebook),
              action: () => Navigator.of(context).pushNamed(
                Routes.WebView,
                arguments: {
                  'url': 'https://facebook.com/herly.cp',
                  'title': 'Facebook'
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
