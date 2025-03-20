import 'package:flutter/material.dart';

void main() {
  runApp(EcoCreatorApp());
}

class EcoCreatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco Creator',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/news': (context) => NewsScreen(),
        // สามารถเพิ่ม route สำหรับ leaderboard ได้ด้วย
        '/leaderboard': (context) => LeaderboardScreen(),
      },
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'asset/logo_splash.png',
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

// Login Screen
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('asset/logo_login.png', height: 150),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.yellow.shade600,
                    hintText: 'Username or Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.pink.shade100,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/news');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Sign In', style: TextStyle(fontSize: 18)),
              ),
              TextButton(
                onPressed: () {
                  // Handle forgot password
                },
                child: Text('Forgot your password?'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.facebook), onPressed: () {}),
                  IconButton(icon: Icon(Icons.facebook), onPressed: () {}),
                  IconButton(icon: Icon(Icons.camera), onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// News Screen
class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Center(child: Image.asset('asset/logo_menu.png', height: 30)),
        actions: [IconButton(icon: Icon(Icons.person), onPressed: () {})],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            child: PageView(
              controller: PageController(viewportFraction: 0.8),
              scrollDirection: Axis.horizontal,
              children: [
                _buildPageItem('', 'asset/carousel.png'),
                _buildPageItem('', 'asset/carousel.png'),
                _buildPageItem('', 'asset/carousel.png'),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Updates For You',
                style: TextStyle(fontSize: 18, color: Colors.purple),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: [
                CustomCard(
                  title: 'About Carbon Footprint',
                  subtitle: '@username',
                  imageAsset: 'asset/card.jpg',
                ),
                CustomCard(
                  title: 'Sustainable Living',
                  subtitle: '@username',
                  imageAsset: 'asset/card2.jpg',
                ),
                CustomCard(
                  title: '7 Million Food Prints',
                  subtitle: '@username',
                  imageAsset: 'asset/card3.jpg',
                ),
                CustomCard(
                  title: '10 Steps to Reduce',
                  subtitle: '@username',
                  imageAsset: 'asset/card.jpg',
                ),
                CustomCard(
                  title: '10 Steps to Reduce',
                  subtitle: '@username',
                  imageAsset: 'asset/card2.jpg',
                ),
                CustomCard(
                  title: '10 Steps to Reduce',
                  subtitle: '@username',
                  imageAsset: 'asset/card3.jpg',
                ),
                CustomCard(
                  title: '10 Steps to Reduce',
                  subtitle: '@username',
                  imageAsset: 'asset/card.jpg',
                ),
                CustomCard(
                  title: '10 Steps to Reduce',
                  subtitle: '@username',
                  imageAsset: 'asset/card.jpg',
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.transparent,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CarbonQuest()),
                  );
                },
                child: Image.asset(
                  'asset/logo_login.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageItem(String text, String imageAsset) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// Custom Card Component
class CustomCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imageAsset;

  CustomCard({
    required this.title,
    required this.subtitle,
    required this.imageAsset,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.green[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.imageAsset,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: IconButton(
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.pink : Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

// CarbonQuest Screen
class CarbonQuest extends StatefulWidget {
  @override
  _CarbonQuestState createState() => _CarbonQuestState();
}

class _CarbonQuestState extends State<CarbonQuest> {
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 2)); // จำลองการโหลด 2 วินาที
    setState(() {
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _isLoaded
              ? Stack(
                children: [
                  // พื้นหลัง
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('asset/carbon_quest_background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Header แสดง User Info
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('asset/user.png'),
                                  radius: 30,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'username',
                                      style: TextStyle(
                                        color: Colors.purple[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '5000 GEP',
                                      style: TextStyle(
                                        color: Colors.pink[400],
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                'asset/logo_login.png',
                              ),
                              radius: 30,
                            ),
                          ],
                        ),
                      ),
                      // ปุ่มและตัวเลือก
                      Padding(
                        padding: const EdgeInsets.all(60.0),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DailyMissionsScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink[100],
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                'Play Game!',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ShopScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow[200],
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 65,
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    'Shop',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // ปุ่ม Leaderboard ที่แก้ไขให้ไปยังหน้า LeaderboardScreen
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => LeaderboardScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow[200],
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 35,
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    'Leaderboard',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewsScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow[200],
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 60,
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    'back',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      'asset/logo_login.png', // รูปตรงกลางหลังโหลดเสร็จ
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              )
              : Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('asset/carbon_quest_background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'asset/logo_login.png',
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
    );
  }
}

// DailyMissionsScreen (ตัวอย่างหน้าภารกิจ)
class DailyMissionsScreen extends StatefulWidget {
  @override
  _DailyMissionsScreenState createState() => _DailyMissionsScreenState();
}

class _DailyMissionsScreenState extends State<DailyMissionsScreen> {
  int points = 5000; // คะแนนเริ่มต้น

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/carbon_quest_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // แสดง User info ที่มุมบน
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('asset/user.png'),
                          radius: 30,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'username',
                              style: TextStyle(
                                color: Colors.purple[600],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$points GEP',
                              style: TextStyle(
                                color: Colors.pink[400],
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('asset/logo_login.png'),
                      radius: 30,
                    ),
                  ],
                ),
              ),

              // ปุ่ม Back
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[200],
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          'BACK',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Spacer(),

              // แสดงภารกิจเป็นปุ่ม
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildMissionBubble('100 GEP', 'ภารกิจที่ 1'),
                  SizedBox(width: 10),
                  _buildMissionBubble('200 GEP', 'แยกขยะ'),
                  SizedBox(width: 10),
                  _buildMissionBubble('500 GEP', 'ภารกิจที่ 3'),
                ],
              ),

              Spacer(),

              // รูป people ที่ด้านล่าง
              Container(
                height: 400,
                child: Image.asset('asset/people.png', fit: BoxFit.contain),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMissionBubble(String points, String mission) {
    return GestureDetector(
      onTap: () {
        _handleMissionComplete(int.parse(points.split(' ')[0]));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WasteSeparationScreen(points: points),
          ),
        ).then((_) {
          setState(() {});
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.yellow[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              points,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              mission,
              style: TextStyle(fontSize: 14, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _handleMissionComplete(int pointReward) {
    setState(() {
      points += pointReward;
    });
  }
}

// WasteSeparationScreen (หน้าแยกขยะ)
class WasteSeparationScreen extends StatelessWidget {
  final String points;

  WasteSeparationScreen({required this.points});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // พื้นหลัง
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/carbon_quest_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // แสดง User info ที่มุมบน
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('asset/user.png'),
                            radius: 30,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'username',
                                style: TextStyle(
                                  color: Colors.purple[600],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('asset/logo_login.png'),
                        radius: 30,
                      ),
                    ],
                  ),
                ),
                // เนื้อหาหลักภารกิจและคะแนน
                Expanded(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ภารกิจคัดแยกขยะ',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'คุณได้รับ $points คะแนน!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // รูป people ด้านล่าง
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    'asset/people.png',
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          // ปุ่ม Back ที่มุมซ้ายบน
          Positioned(
            top: 120,
            left: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[200],
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    'BACK',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Leaderboard Screen (หน้า Leaderboard)
class LeaderboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> leaderboard = [
    {"rank": 1, "username": "Alice", "score": 1200},
    {"rank": 2, "username": "Bob", "score": 1100},
    {"rank": 3, "username": "Charlie", "score": 1000},
    {"rank": 4, "username": "David", "score": 900},
    {"rank": 5, "username": "Eve", "score": 800},
  ];

  final List<Color> pastelColors = [
    Color(0xFFFFD1DC), // ชมพูอ่อน
    Color(0xFFFFF0C1), // เหลืองพาสเทล
    Color(0xFFC1E1C1), // เขียวพาสเทล
    Color(0xFFD1E8FF), // ฟ้าพาสเทล
    Color(0xFFE0C1FF), // ม่วงพาสเทล
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/background.jpg'), // พื้นหลัง
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // จัดให้อยู่กลาง
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // จัดให้อยู่กลางแนวตั้ง
            children: [
              Text(
                '🏆 Leaderboard 🏆',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height:
                    350, // กำหนดความสูงเพื่อให้ ListView ไม่กินพื้นที่ทั้งหมด
                child: ListView.builder(
                  shrinkWrap: true, // จำกัดขนาดให้พอดี
                  itemCount: leaderboard.length,
                  itemBuilder: (context, index) {
                    final player = leaderboard[index];
                    return Card(
                      color: pastelColors[index % pastelColors.length],
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            '${player["rank"]}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          player["username"],
                          textAlign: TextAlign.center, // จัดกลางชื่อ
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '${player["score"]} GEP',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// shop
class ShopScreen extends StatelessWidget {
  final List<Map<String, dynamic>> shopItems = [
    {"name": "กระเป๋าผ้า", "price": 500, "image": "asset/item1.png"},
    {"name": "แก้วกระดาษ", "price": 750, "image": "asset/item2.png"},
    {"name": "ถุงกระดาษ", "price": 1000, "image": "asset/item3.png"},
  ];
  final List<Color> pastelColors = [
    Color(0xFFFFD1DC), // ชมพูอ่อน
    Color(0xFFFFF0C1), // เหลืองพาสเทล
    Color(0xFFC1E1C1), // เขียวพาสเทล
    Color(0xFFD1E8FF), // ฟ้าพาสเทล
    Color(0xFFE0C1FF), // ม่วงพาสเทล
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shop')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/background.jpg'), // พื้นหลัง
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กลางจอ
            children: [
              Text(
                '🛒 Shop 🛒',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 350, // กำหนดความสูงเพื่อให้ Shop ไม่เต็มหน้าจอ
                child: ListView.builder(
                  shrinkWrap: true, // จำกัดขนาดให้พอดี
                  itemCount: shopItems.length,
                  itemBuilder: (context, index) {
                    final item = shopItems[index];
                    return Card(
                      color: pastelColors[index % pastelColors.length],
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            // รูปภาพสินค้า
                            Image.asset(
                              item["image"],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 16),

                            // ชื่อสินค้า
                            Expanded(
                              child: Text(
                                item["name"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            // ราคาสินค้า + ปุ่มซื้อ
                            Column(
                              children: [
                                Text(
                                  '${item["price"]} P',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // ฟังก์ชันซื้อสินค้า (ต้องเพิ่มเอง)
                                  },
                                  child: Text("แลก"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
