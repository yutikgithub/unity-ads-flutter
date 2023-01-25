import 'package:flutter/material.dart';
import 'package:unity_ads_demo/ads/unity_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AdManager.loadUnityIntAd();
      await AdManager.loadUnityRewardedAd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await AdManager.showIntAd();
              },
              child: const Text("Int Ad"),
            ),
            ElevatedButton(
              onPressed: () async {
                await AdManager.showRewardedAd();
              },
              child: const Text("Rewarded Ad"),
            ),
          ],
        ),
      ),
    );
  }
}
