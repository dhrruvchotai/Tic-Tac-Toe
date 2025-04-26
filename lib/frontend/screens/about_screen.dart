import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/frontend/constants/image_paths.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.yellow[100],
          title: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Tic", style: GoogleFonts.orbitron(color: Colors.blue[800], fontSize: 35)),
                Text("Tac", style: GoogleFonts.orbitron(color: Colors.black87, fontSize: 35)),
                Text("Toe", style: GoogleFonts.orbitron(color: Colors.red[400], fontSize: 35)),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 22, left: 15),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
              icon: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12), // Slightly larger border radius
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 30, // Increased icon size
                ),
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      color: Colors.white.withOpacity(0.8),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.black.withOpacity(0.2), width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'About the Game',
                                style: GoogleFonts.orbitron(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'A modern take on the classic Tic Tac Toe game with beautiful visuals '
                                  'and smooth gameplay. Challenge the computer or play with friends in '
                                  'local multiplayer mode.',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Card(
                      color: Colors.white.withOpacity(0.8),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.black.withOpacity(0.2), width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.blue[800]!, width: 3),
                                image: DecorationImage(
                                  image: AssetImage("lib/frontend/assets/images/Profile.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Dhruv Chotai',
                              style: GoogleFonts.orbitron(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Flutter Developer | BTech CSE Student',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            // About Me Section
                            const SizedBox(height: 20),
                            Text(
                              'About Me',
                              style: GoogleFonts.orbitron(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '2nd year BTech CSE student passionate about building '
                                  'intuitive digital experiences. I specialize in cross-platform '
                                  'development with Flutter and full-stack solutions using MERN stack.',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 10),
                            Divider(height: 25,thickness: 2,),
                            Text(
                              'Technical Skills',
                              style: GoogleFonts.orbitron(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.center,
                              children: [
                                _buildSkillChip('Flutter', Colors.blue[800]!),
                                _buildSkillChip('Dart', Colors.blue[400]!),
                                _buildSkillChip('Express', Colors.grey[600]!),
                                _buildSkillChip('React', Colors.blue[500]!),
                                _buildSkillChip('Node.js', Colors.green[800]!),
                                _buildSkillChip('SQL / MongoDB', Colors.green[600]!),
                                _buildSkillChip('Java', Colors.orange[700]!),
                                _buildSkillChip('Python', Colors.indigo[400]!),
                                _buildSkillChip('C', Colors.purple[600]!),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Divider(height: 10,thickness: 2,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Image.asset("lib/frontend/assets/images/Github.png",width: 40,),
                                  onPressed: () => _launchUrl('https://github.com/dhrruvchotai'),
                                ),
                                IconButton(
                                  icon: Image.asset("lib/frontend/assets/images/LinkedIn.png",width: 40,),
                                  onPressed: () => _launchUrl('https://www.linkedin.com/in/dhruvchotai/'),
                                ),
                              ],
                            ),

                            // Contact Button
                            const SizedBox(height: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                              ),
                              onPressed: () => _launchUrl('mailto:hey.dhruvchotai@gmail.com'),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("lib/frontend/assets/images/Gmail.png",width: 30,),
                                  SizedBox(width: 20,),
                                  Text(
                                    'Contact Me',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Version 1.0.0',
                      style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String text, Color color) {
    return Chip(
      label: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}