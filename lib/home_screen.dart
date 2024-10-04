import 'package:flutter/material.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'call_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Stream Video Call'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Create Call'),
          onPressed: () async {
            try {
              var call = StreamVideo.instance.makeCall(
                callType: StreamCallType.defaultType(),
                id: 'HKhW0LkeAVlp', // Replace with actual Call ID
              );
              
              await call.getOrCreate();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallScreen(call: call),
                ),
              );
            } catch (e) {
              debugPrint('Error creating/joining call: $e');
            }
          },
        ),
      ),
    );
  }
}
