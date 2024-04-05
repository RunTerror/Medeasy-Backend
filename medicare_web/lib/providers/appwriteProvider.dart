import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:medicare_web/constants/constants.dart';
import 'package:medicare_web/models/patients.dart';

class AppwriteProvider extends ChangeNotifier {
  Client client = Client();
  late Account account;
  late Databases databases;
  late Storage storage;
  late bool _isLoading;
  List<Patient>? _listItem;

  bool get isLoading => _isLoading;
  List<Patient>? get listItem => _listItem;

  AppwriteProvider() {
    _isLoading = true;
    initialize();
  }

  initialize() {
    print('initialized');
    client
      ..setEndpoint(kApiEndpoint)
      ..setProject(kProjectId);

    account = Account(client);
    databases = Databases(client);
    storage = Storage(client);
    createAnon();
  }

  createAnon() async {
    try {
      await account.get();
    } catch (_) {
      await account.createAnonymousSession();
      _isLoading = false;
      notifyListeners();
    }
  }

  createDocument(String name, String dob, String gender, String phoneNumber,
      String bloodPressure, String bodyTemperature, context) async {
    try {
      final response = await databases.createDocument(
          databaseId: kdbDev,
          collectionId: kPtCollections,
          documentId: ID.unique(),
          data: {
            'name': name,
            'dob': dob,
            'gender': gender,
            'phone': phoneNumber,
            'bloodPressure': bloodPressure,
            'bodyTemperature': bodyTemperature
          });
      if (response.data.isNotEmpty) {
        print(response
            .data['name']); // Return the unique ID of the created patient
      } else {
        throw Exception('Failed to create patient');
      }
    } catch (e) {
      rethrow;
    }
  }

  listDocument() async {
    try {
      final response = await databases.listDocuments(
          databaseId: kdbDev, collectionId: kPtCollections);
      _listItem = response.documents
          .map((listitem) => Patient.fromJson(listitem.data))
          .toList();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // Function to update patient's symptoms
  Future<void> updateSymptoms({
    required String patientId,
    required String symptoms,
  }) async {
    try {
      await databases.updateDocument(
        databaseId: kdbDev,
        collectionId: kPtCollections,
        documentId: patientId,
        data: {
          'symptoms': symptoms,
        },
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // Function to update patient's health records
  Future<void> updateHealthRecords({
    required String patientId,
    required String healthRecords,
  }) async {
    try {
      await databases.updateDocument(
        databaseId: kdbDev,
        collectionId: kPtCollections,
        documentId: patientId,
        data: {
          'healthRecords': healthRecords,
        },
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // Function to update patient's diagnosis analysis
  Future<void> updateDiagnosisAnalysis({
    required String patientId,
    required String diagnosisAnalysis,
  }) async {
    try {
      await databases.updateDocument(
        collectionId: kPtCollections,
        databaseId: kdbDev,
        documentId: patientId,
        data: {
          'diagnosisAnalysis': diagnosisAnalysis,
        },
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // Function to upload a file (e.g., a health record document)
  Future uploadFile({
    required String patientId,
    required String filePath,
  }) async {
    // Create an InputFile instance from the file path
    InputFile file = InputFile.fromPath(path: filePath);
    try {
      await storage.createFile(
        bucketId: 'YOUR_BUCKET_ID',
        file: file,
        permissions: ['*'],
        fileId: ID.unique(),
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
