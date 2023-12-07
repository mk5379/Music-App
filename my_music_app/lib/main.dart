import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyMusic(),
    );
  }
}

class MyMusic extends StatefulWidget {
  const MyMusic({super.key});

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  final player = AudioPlayer();
  bool isPlaying = false;
  int current_song = 0;

  List songs = [
    {
      "name" : "My Love",
      "artics" : "Westlife",
      "image" : "images/Westlife.jpeg",
      "url" : "https://docs.google.com/uc?export=download&id=1YfAPL35-_YtZM7MoGlgEt9X2wIZ2zBTa"
    },
    {
      "name" : "Let Her Go",
      "artics" : "Passenger",
      "image" : "images/Passenger.jpeg",
      "url" : ""
    },
    {
      "name" : "Perfect",
      "artics" : "Ed Sheeran",
      "image" : "images/ed_sheeran.png",
      "url" : ""
    },
    {
      "name" : "Never Say Never",
      "artics" : "Justin Bieber",
      "image" : "images/Justin Bieber.jpeg",
      "url" : ""
    },
    {
      "name" : "Night Changes",
      "artics" : "One Direction",
      "image" : "images/One_Direction.jpeg",
      "url" : ""
    },
    {
      "name" : "နှလုံးသွေးများရပ်တန့်သွားပါစေချစ်နေမယ်",
      "artics" : "Lay Phyu",
      "image" : "images/lay_Phyu.jpeg",
      "url" : ""
    },
    {
      "name" : "Moe",
      "artics" : "Myo Gyi",
      "image" : "images/Myo_Gyi.jpeg",
      "url" : ""
    },
    {
      "name" : "All Out Of Loves",
      "artics" : "Francis greg ft. Music Travel Love (Air Supply Cover)",
      "image" : "images/Air_Supply.jpeg",
      "url" : ""
    },
    {
      "name" : "Season In The Sun",
      "artics" : "Westlife",
      "image" : "images/Westlife.jpeg",
      "url" : ""
    },
    {
      "name" : "Photograph",
      "artics" : "Ed Sheeran",
      "image" : "images/ed_sheeran.png",
      "url" : ""
    },
    {
      "name" : "Ghost",
      "artics" : "Justin Bieber",
      "image" : "images/Justin Bieber.jpeg",
      "url" : ""
    },
    {
      "name" : "Midnight Memories",
      "artics" : "One Direction",
      "image" : "images/One_Direction.jpeg",
      "url" : ""
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Center(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Text("MK Music",style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: "Merriweather"),),
            ),
            GlassContainer(
              borderColor: Colors.white24,
              borderRadius: BorderRadius.circular(10),
              height: 300,
              width: 300,
              gradient: LinearGradient(
                colors: [Colors.white.withOpacity(0.40), Colors.white.withOpacity(0.10)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [Colors.white.withOpacity(0.60), Colors.white.withOpacity(0.10), Colors.lightBlueAccent.withOpacity(0.05), Colors.lightBlueAccent.withOpacity(0.6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.39, 0.40, 1.0],
              ),
              blur: 15.0,
              borderWidth: 1.5,
              elevation: 3.0,
              isFrostedGlass: true,
              shadowColor: Colors.black.withOpacity(0.20),
              alignment: Alignment.center,
              frostedOpacity: 0.12,
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: Image(image: AssetImage(songs[0]["image"])),
            ),
            IconButton(
              icon: isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow) ,
              onPressed: () async{
                if(isPlaying == false) {
                  await player.play(UrlSource('https://docs.google.com/uc?export=download&id=1YfAPL35-_YtZM7MoGlgEt9X2wIZ2zBTa'));
                }else{
                  await player.pause();
                }

                setState(() {
                  isPlaying = !isPlaying;
                });
              },
            )

          ],
        )
      ),
    );
  }
}
