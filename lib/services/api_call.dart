import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RestApi {
  Future<String?> uploadImage(Uint8List bytes, String fileName) async {
    Uri url = Uri.parse("https://api.imgbb.com/1/upload");
    var request = http.MultipartRequest("POST", url);
    
    request.fields['key'] = dotenv.env['API_Key']!;

    var myFile = http.MultipartFile.fromBytes(
      "image", 
      bytes, 
      filename: fileName,   
    );
    request.files.add(myFile);

    // Gửi request
    final response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = jsonDecode(data);
      print(jsonData);
      return jsonData["data"]["url"];  // Lấy URL của ảnh từ response
    } else {
      print("Upload failed with status: ${response.statusCode}");
      print("Response: ${await response.stream.bytesToString()}");
    }
    return null;
  }
}
