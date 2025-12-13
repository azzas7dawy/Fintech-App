plugins {
    id("com.android.application")
    id("kotlin-android")

    // Flutter plugin لازم يكون آخر واحد
    id("dev.flutter.flutter-gradle-plugin")

    // Firebase موجود بس مش هنستخدمه دلوقتي
    id("com.google.gms.google-services")
    id("com.google.firebase.appdistribution")

    id("com.google.firebase.crashlytics")
}

android {
    namespace = "com.example.fintech_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.fintech_app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // ✅ Flavors
    flavorDimensions += "default"

    productFlavors {
        create("dev") {
            dimension = "default"
            applicationIdSuffix = ".dev"
            resValue(
                type = "string",
                name = "app_name",
                value = "Fintech Development"
            )
        }

        create("prod") {
            dimension = "default"
            applicationIdSuffix = ".prod"
            resValue(
                type = "string",
                name = "app_name",
                value = "Fintech Production"
            )
        }
    }

    buildTypes {
        release {
     
           isMinifyEnabled = false
           isShrinkResources = false
        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("com.google.android.gms:play-services-wallet:19.5.0")
    implementation(platform("com.google.firebase:firebase-bom:33.1.0"))
    
    implementation("com.google.firebase:firebase-crashlytics")
}
