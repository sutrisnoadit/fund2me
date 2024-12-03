import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/microphone_controller.dart';

class MicrophoneView extends GetView<MicrophoneController> {
  const MicrophoneView({Key? key}) : super(key: key);
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voice Recorder & Player"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Text(
              controller.isRecording.value ? "Recording..." : "Tap to Start Recording",
              style: const TextStyle(fontSize: 24, color: Colors.black),
            )),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
              onPressed: controller.isRecording.value ? controller.stopRecording : controller.startRecording,
              child: Text(controller.isRecording.value ? "Stop Recording" : "Start Recording"),
            )),
            const SizedBox(height: 20),
            Obx(() => controller.isRecording.value
                ? Text('Recording in progress...', style: TextStyle(color: Colors.red))
                : controller.filePath.value.isNotEmpty
                    ? Column(
                        children: [
                          Text('Recording saved to: ${controller.filePath.value}'),
                          ElevatedButton(
                            onPressed: controller.playRecording,
                            child: Text("Play Recording"),
                          ),
                        ],
                      )
                    : Container()),
          ],
        ),
      ),
    );
  }
}
