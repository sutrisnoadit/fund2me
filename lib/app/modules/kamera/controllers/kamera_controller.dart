 import 'package:get/get.dart';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
class KameraController extends GetxController {
  //TODO: Implement KameraController

  final ImagePicker _picker = ImagePicker();  
  final box = GetStorage(); 

  var selectedImagePath = ''.obs;  
  var isImageLoading = false.obs;  

  var selectedVideoPath = ''.obs;  
  var isVideoPlaying = false.obs; 
  VideoPlayerController? videoPlayerController; 

  @override
  void onInit() {
    super.onInit();
    KameraController();
    _loadStoredData();
  }

  @override
  void onReady() {
    super.onReady();
    _loadStoredData();
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }

 
  Future<void> pickImage(ImageSource source) async {
    try {
      isImageLoading.value = true;
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        box.write(
            'imagePath', pickedFile.path);  
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    } finally {
      isImageLoading.value = false;
    }
  }

  Future<void> pickVideo(ImageSource source) async {
    try {
      isImageLoading.value = true;
      final XFile? pickedFile = await _picker.pickVideo(source: source);
      if (pickedFile != null) {
        selectedVideoPath.value = pickedFile.path;
        box.write('videoPath', pickedFile.path);

 
        videoPlayerController =
            VideoPlayerController.file(File(pickedFile.path))
              ..initialize().then((_) {
   
                videoPlayerController!.play();
                isVideoPlaying.value = true;  
                update();  
              });
      } else {  
        print('No video selected.');
      }
    } catch (e) {
      print('Error picking video: $e');
    } finally {
      isImageLoading.value = false;
    }
  }

  void _loadStoredData() {
    selectedImagePath.value = box.read('imagePath') ?? '';
    selectedVideoPath.value = box.read('videoPath') ?? '';

    if (selectedVideoPath.value.isNotEmpty) {
      videoPlayerController =
          VideoPlayerController.file(File(selectedVideoPath.value))
            ..initialize().then((_) {
              videoPlayerController!.play();
 
            });
    }
  }

  void play() {
    videoPlayerController?.play();
    isVideoPlaying.value = true;  
    update(); 
  }

  void pause() {
    videoPlayerController?.pause();
    isVideoPlaying.value = false; 
    update();
  }

  void togglePlayPause() {
    if (videoPlayerController != null) {
      if (videoPlayerController!.value.isPlaying) {
        videoPlayerController!.pause();
        isVideoPlaying.value = false;  
      } else {
        videoPlayerController!.play();
        isVideoPlaying.value = true;  
      }
      update();  
    }
  }
}
