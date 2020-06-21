import 'dart:io';
import 'package:path/path.dart' as path;

class FileUtility {
  final String rootFolder;
  static const String USERS_FOLDER = "Users";

  FileUtility(this.rootFolder);

  Future<String> getUsersFolder() async =>
      await getFolder(rootFolder, USERS_FOLDER);

  Future<String> getCommonFolder() async =>
      await getFolder(rootFolder, "Common");

  Future<String> getUserFolder(String username) async =>
      await getFolder(rootFolder, USERS_FOLDER, username);

  Future<String> getProducerFolder(
          String username, String producerCode) async =>
      await getFolder(rootFolder, USERS_FOLDER, username, producerCode);

  Future<String> getProducerDocumentsFolder(
          String username, String producerCode) async =>
      await getFolder(
          rootFolder, USERS_FOLDER, username, producerCode, "Documents");

  Future<String> getProducerPhotosFolder(
          String username, String producerCode) async =>
      await getFolder(
          rootFolder, USERS_FOLDER, username, producerCode, "Photos");

  Future<String> getFolder(String path1,
      [String path2, String path3, String path4, String path5]) async {
    var p = path.join(path1, path2, path3, path4, path5);
    await createFolder(p);
    return p;
  }

  Future createFolder(String path) async {
    var dir = new Directory(path);
    await dir.create(recursive: true);
  }
}
