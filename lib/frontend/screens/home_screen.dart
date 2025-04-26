import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildSidebar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.yellow[100],
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(Icons.menu, size: 35),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          color:Colors.yellow[100],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 100,left: 10,right: 10),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("lib/frontend/assets/images/splash_image_main_withoutBG.png",fit: BoxFit.cover,)),
                ),
              ),
              SizedBox(
                  width: 300,
                  height: 70,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, "/select_game_details",arguments: {"isGameVsComputer" : true});
                  }, child: Text("Play vs Computer",
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),style: ElevatedButton.styleFrom(backgroundColor:Colors.blue[500],side: BorderSide(color: Colors.black,strokeAlign: 2,width: 3)),)),
              SizedBox(height: 50,),
              SizedBox(
                  width: 300,
                  height: 70,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, "/select_game_details",arguments: {"isGameVsComputer" : false});
                  }, child: Text("Local Multiplayer",
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),style: ElevatedButton.styleFrom(backgroundColor:Colors.blue[500],side: BorderSide(color: Colors.black,strokeAlign: 2,width: 3)),))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSidebar() {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[800]
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                       Image.asset("lib/frontend/assets/images/splash_image_main_withoutBG.png",height: 130,width: 200,),
                    ],
                  ),
                ],
              ),
            ),
            // Settings & More
            _buildDrawerSectionTitle('SETTINGS'),
            _buildDrawerItem(
              icon: Icons.settings,
              title: 'Game Settings',
              onTap: () {
               Navigator.pushNamed(context, "/under_construction");
              },
            ),
            _buildDrawerItem(
              icon: Icons.help,
              title: 'How to Play',
              onTap: () {
                Navigator.pushNamed(context, "/how_to_play");
              },
            ),
            _buildDrawerItem(
              icon: Icons.info,
              title: 'About',
              onTap: () {
                Navigator.pushNamed(context, "/about");
              },
            ),

            Divider(color: Colors.white.withOpacity(0.3), thickness: 1),

            // Profile & Account
            _buildDrawerSectionTitle('ACCOUNT'),
            _buildDrawerItem(
              icon: Icons.person,
              title: 'Profile',
              onTap: () {
                Navigator.pushNamed(context, "/under_construction");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: GoogleFonts.orbitron(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      onTap: onTap,
      hoverColor: Colors.white.withOpacity(0.1),
    );
  }

  Widget _buildDrawerSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}