# MEDEASY - AI HEALTH Assistant Tool

MEDEASY is a web application designed to assist doctors in recording patient data, capturing audio notes, and creating verified diagnoses based on patient information.

<p align="center">
  <img src="https://github.com/Photon3009/Medeasy/assets/100941430/35f54b81-85d7-4c79-94c8-17964a2ce745" alt="Desktop - 3" width="200" style="margin-right: 40px;">
</p>


## Description

MEDEASY provides a user-friendly interface for doctors to streamline their workflow and enhance patient care. It allows doctors to efficiently record patient data, including medical history, symptoms, and treatment plans, and store them securely in the system. Additionally, doctors can use MEDEASY to record audio notes during patient consultations, which are automatically transcribed and added to the patient's medical record.

One of the key features of MEDEASY is its diagnosis generation functionality. Based on the recorded patient data and audio notes, MEDEASY utilizes advanced algorithms and medical knowledge databases to suggest potential diagnoses for the patient's condition. Doctors can review and verify these diagnoses, ensuring accuracy and reliability in patient care.

Welcome to our project! This guide will help you set up your development environment and get started with our Flutter web app, which uses Appwrite for backend services, a custom multilabel classification model, and FastAPI for endpoints.

## Prerequisites

Before you begin, ensure you have the following installed:

- Flutter SDK: Follow the [Flutter SDK installation instructions](https://flutter.dev/docs/get-started/install).
- Chrome: Required for debugging the web app.
- An IDE that supports Flutter, such as Visual Studio Code, Android Studio, or IntelliJ IDEA. Install the Flutter and Dart plugins for your IDE.

## Setting Up the Flutter Web App

1. **Create a New Flutter Project**: Open your terminal or command prompt and run the following command to create a new Flutter project with web support:
2. ```bash:
   flutter create my_project
3. **Navigate into your project directory**:
   ```bash:
   cd my_project
4. **Add Web Support**: To enable web support, run:
      ```bash:
   flutter config --enable-web
5. **Get the web dependencies**:
       ```bash:
    flutter pub get
   
6. **Integrate Appwrite**: Open `lib/main.dart` and replace `<YOUR_PROJECT_ID>` with your actual Appwrite project ID

7. **Run Your Project**: To run your project, use the following command:

       ```bash:
    flutter run -d chrome

## Features

- **Patient Symptom Recording**: Records patient symptoms to initiate the diagnosis process.
- **Question Generation**: Generates questions for patients to help filter potential diseases.
- **Suggested Tests**: Provides suggested tests based on the patient's symptoms and responses.
- **Phase 1 Generation**: Offers a phase 1 generation of diagnosis based on test results.
- **Language Translation**: Translates Hinglish into English to ensure accurate communication.
- **Language Detection**: Detects the languages spoken by patients.
- **Report Analysis**: Analyzes patient reports to determine if they are normal or not.

## UI Preview

<p align="center">
  <img src="https://github.com/Photon3009/Medeasy/assets/100941430/980169d4-8a29-4b1c-b055-d0669605d1be" alt="Desktop - 3" width="500" style="margin-right: 40px;">
  <img src="https://github.com/Photon3009/Medeasy/assets/100941430/8fc0b2c0-5349-4151-8558-151cb45bf3d0" alt="Desktop - 6" width="500" style="margin-right: 20px;">
</p>

<p align="center">
  <img src="https://github.com/Photon3009/Medeasy/assets/100941430/8c00f75b-0823-406a-8d57-205f4ee82908" alt="Desktop - 2" width="500" style="margin-right: 20px;">
  <img src="https://github.com/Photon3009/Medeasy/assets/100941430/4cfe77e9-5da4-43bf-b746-70af342bd7d3" alt="Desktop - 4" width="500">
</p>

<p align="center">
  <img src="https://github.com/Photon3009/Medeasy/assets/100941430/613e6cfc-412a-4d26-a63c-f14df77cfadd" alt="Desktop - 7" width="500">
   <img src="https://github.com/Photon3009/Medeasy/assets/100941430/3eed85e2-f450-4fe8-bcea-b6f05b98966d" alt="Desktop - 5" width="500" style="margin-right: 20px;">
</p>

## Technologies Used

- **Frontend**: Flutter Web for building the user interface.
- **Backend**: Appwrite as the BaaS for handling data storage, authentication, and other backend services.
- **Machine Learning**: TensorFlow for developing the custom ML model for multi-label classification.
- **API**: FastAPI for creating the API service that integrates the ML model.
