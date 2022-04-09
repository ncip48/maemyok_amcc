import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/homepage'),
              child: Container(
                padding: EdgeInsets.only(top: 15),
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 28,
                      child: Image(
                        image: AssetImage('assets/icon/home.png'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Home',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/profile'),
              child: Container(
                padding: EdgeInsets.only(top: 15),
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 28,
                      child: Image(
                        image: AssetImage('assets/icon/user.png'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 32),
            GestureDetector(
              onTap: () async {
                await launch('mailto:mbahcip00@gmail.com');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.redAccent,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.email),
                  ),
                  SizedBox(width: 15),
                  Text('mbahcip00@gmail.com'),
                ],
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () async {
                await launch('tel:085156842765');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.redAccent,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.phone),
                  ),
                  SizedBox(width: 15),
                  Text('085156842765'),
                ],
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/webview'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.redAccent,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.abc),
                  ),
                  SizedBox(width: 15),
                  Text('Linkedin'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
