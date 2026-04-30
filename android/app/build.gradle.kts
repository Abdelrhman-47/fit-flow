plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.fit_flow"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.fit_flow"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    flavorDimensions += "app"

    productFlavors {
        create("dev") {
            dimension = "app"
            applicationId = "com.example.fit_flow.dev"
            versionCode = (flutter.versionCode?.toString()?.toInt() ?: 1) + 100
            versionName = "${flutter.versionName}-dev"
        }
        create("staging") {
            dimension = "app"
            applicationId = "com.example.fit_flow.staging"
            versionCode = (flutter.versionCode?.toString()?.toInt() ?: 1) + 200
            versionName = "${flutter.versionName}-staging"
        }
        create("prod") {
            dimension = "app"
            applicationId = "com.example.fit_flow"
            versionCode = flutter.versionCode
            versionName = flutter.versionName
        }
    }

    // All flavors use the same google-services.json file (single Firebase project)
    // Make sure your google-services.json includes all three package names as separate clients

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
