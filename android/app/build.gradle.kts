plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Push through Firebase (the `prod` store build): the google-services plugin reads
// `google-services.json`, which is never committed (see README, "Push"). Without the file
// the plugin is not applied, the build still works and push stays off (periodic fetch).
if (
    file("google-services.json").exists() ||
        file("src/prod/google-services.json").exists() ||
        file("src/dev/google-services.json").exists()
) {
    apply(plugin = "com.google.gms.google-services")
}

android {
    namespace = "org.openbekci.openbekci_mobile"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // flutter_local_notifications needs java.time on older Android versions.
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "org.openbekci.mobile"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        // Uses the version code from pubspec.yaml. When using split APKs, 1000 * ABI_VERSION
        // is added automatically by Flutter. (https://developer.android.com/studio/build/configure-apk-splits#configure-APK-versions)
        // You can force using the value of versionCode by specifying the `-P force-version-code-ignoring-abi=true`
        // flag during build.
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildFeatures {
        resValues = true
    }

    flavorDimensions += "env"
    productFlavors {
        // dev: cleartext http allowed for localhost / 10.0.2.2 (network_security_config in src/dev).
        create("dev") {
            dimension = "env"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
            resValue("string", "app_name", "OpenBekci Dev")
        }
        create("prod") {
            dimension = "env"
            resValue("string", "app_name", "OpenBekci")
        }
        // foss: no Google services; push through UnifiedPush (lib/main_foss.dart). Same application id as
        // prod: they are two builds of one app, never installed together.
        create("foss") {
            dimension = "env"
            resValue("string", "app_name", "OpenBekci")
        }
    }

    signingConfigs {
        // Release signing comes from the environment (tool/release.sh, CI secrets); never committed.
        System.getenv("OPENBEKCI_KEYSTORE")?.let { path ->
            create("release") {
                storeFile = file(path)
                storePassword = System.getenv("OPENBEKCI_KEYSTORE_PASSWORD")
                keyAlias = System.getenv("OPENBEKCI_KEY_ALIAS")
                keyPassword = System.getenv("OPENBEKCI_KEY_PASSWORD")
            }
        }
    }

    buildTypes {
        release {
            // Without a keystore: debug keys, so `flutter run --release` works (not uploadable).
            signingConfig = signingConfigs.findByName("release") ?: signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

// The UnifiedPush connector ships Tink's JVM artifact; flutter_secure_storage ships the Android one.
// Both on the classpath fail the build with duplicate classes: keep the Android one.
configurations.all {
    exclude(group = "com.google.crypto.tink", module = "tink")
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
}

flutter {
    source = "../.."
}
