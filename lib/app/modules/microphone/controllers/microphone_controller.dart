import 'package:get/get.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';

class MicrophoneController extends GetxController {
  //TODO: Implement MicrophoneController
 final FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _audioPlayer = FlutterSoundPlayer();
  var isRecording = false.obs;  
  var filePath = "".obs;  

  @override
  void onInit() {
    super.onInit();
 
    _initializeRecorder();
    _initializePlayer();
  }

 
  Future<void> _initializeRecorder() async {
    try {
      await _audioRecorder.openRecorder();
    } catch (e) {
      print('Error opening recorder: $e');
    }
  }

 
  Future<void> _initializePlayer() async {
    try {
      await _audioPlayer.openPlayer();
    } catch (e) {
      print('Error opening player: $e');
    }
  }

 
  Future<void> checkMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
  }

 
  Future<void> startRecording() async {
    await checkMicrophonePermission();
    if (await Permission.microphone.isGranted) {
      isRecording.value = true;
      String path = await _getRecordingPath();
      try {
        await _audioRecorder.startRecorder(
          toFile: path,
          codec: Codec.pcm16WAV,
        );
        filePath.value = path; 
      } catch (e) {
        print("Error starting recorder: $e");
      }
    } else {
      print("Izin mikrofon ditolak.");
    }
  }

 
  Future<void> stopRecording() async {
    isRecording.value = false;
    try {
      await _audioRecorder.stopRecorder();
 
      playRecording();
    } catch (e) {
      print("Error stopping recorder: $e");
    }
  }

  // Mendapatkan path untuk menyimpan file rekaman
  Future<String> _getRecordingPath() async {
    final directory = Directory.systemTemp; // Menggunakan direktori sementara
    String filePath = '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.wav';
    return filePath;
  }

  // Memutar rekaman yang telah disimpan
  Future<void> playRecording() async {
    if (filePath.value.isNotEmpty) {
      try {
        await _audioPlayer.startPlayer(
          fromURI: filePath.value,
          codec: Codec.pcm16WAV,
        );
      } catch (e) {
        print("Error playing recording: $e");
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    _audioRecorder.closeRecorder();
    _audioPlayer.closePlayer();
  }
}
