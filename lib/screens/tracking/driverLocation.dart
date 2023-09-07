
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'package:google_maps/google_maps.dart';

class DriverLocation extends StatefulWidget {
  const DriverLocation({super.key});

  @override
  State<DriverLocation> createState() => _DriverLocationState();
}

class _DriverLocationState extends State<DriverLocation> {

  Completer<AndroidMapRenderer?>? _initializedRendererCompleter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
