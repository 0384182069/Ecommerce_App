import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class RestApi {
  Future<String?> uploadImage(Uint8List bytes, String fileName) async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/files/upload");
    var request = http.MultipartRequest("POST", url);
    var myFile = http.MultipartFile.fromBytes(
      "file", 
      bytes, 
      filename: "upload_image.jpg",   
    );
    print(myFile);
    request.files.add(myFile);
    
    final response = await request.send();
    if (response.statusCode == 201) {
      var data = await response.stream.bytesToString();
      var jsonData = jsonDecode(data);
      return jsonData["location"];  // Lấy phần location từ response
    }
    else{
      print("Upload failed with status: ${response.statusCode}");
      print("Response: ${await response.stream.bytesToString()}");
    }
    return null;
  }
}
