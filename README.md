# Prapare and Publish Flutter App

## Splash Screen

### Android
Open luncher screen `android/app/src/main/res/drawable/launch_background.xml`

      

Modify this file to customize your launch splash screen. For make sure splash image support into all app screen generate mipmap image [App Icon Generator](https://appicon.co/).

      <layer-list xmlns:android="http://schemas.android.com/apk/res/android">
          <item android:drawable="@android:color/white" />                    // Screen background color
      
          <!-- You can insert your own image assets here -->
           <item>
              <bitmap
                  android:gravity="center"
                  android:src="@mipmap/splash_image" />                       // Screen center image
          </item>
      </layer-list>
      
### iOS
You can customize the launch screen with your own desired assets by replacing the image files in this directory.

You can also do it by opening your Flutter project's Xcode project with `open ios/Runner.xcworkspace`, selecting `Runner/Assets.xcassets` in the Project Navigator and dropping in the desired images.

### Best practices to design a splash screen
- Avoid texts
- Avoid static image 
- Don't advertise 
- Nearly identical to the first screen 

## App Icon
Adding Icon Manually for Android
- Generate different size of icon by [App Incon Genarator](https://appicon.co/)
- Navigate to the path `android/app/src/main/res` 
- Replace generated icon to the mipmap folder.

iOS
- Generate different size of icon by [App Incon Genarator](https://appicon.co/)
- Navigate to the path `ios/Runner/assets.xcssets/appicon.appiconset`
- Replace generated icon to the appicon.appiconset

### Adding Icon Automatically Android & iOS
  
      dev_dependencies:
        flutter_launcher_icons: "^0.10.0"

      flutter_icons:
        image_path: "assets/images/user.png"
      #  image_path_android: "assets/images/android/user.png"
      #  image_path_ios: "assets/images/ios/user.png"
        android: true
        ios: true

If you name your configuration file something other than flutter_launcher_icons.yaml or pubspec.yaml you will need to specify the name of the file when running the package

      flutter pub get
      flutter pub run flutter_launcher_icons:main -f <your config file name here>
      
### Auto Generate Different Image Sizes for iOS and Android
- Go to [App Icon Generator](https://appicon.co/#image-sets)

### Change App Display Name Manually
Android:
- Navigate to `android/app/src/main/androidManifest.xml`
- Change label default name.

iOS:
- Navigate to `iOS/Runner/info.plist`.
- Change `CMBundleName` default name.

another way,
- Open iOS module in Xcode `open ios/Runner.xcworkspace`. 
- Select project `TARGETS/General`.
- Change display name.

### Change App Display Name Android & iOS Automatically
Set your dev dependencies and your app's name

      dev_dependencies:
        flutter_app_name: ^0.1.0

      flutter_app_name:
        name: "My Cool App"
        
Run flutter_app_name in your project's directory
      
      flutter pub get
      flutter pub run flutter_app_name

### Signing the app
Create and upload keystore

Copy Java Binary path: `/Applications/Android\ Studio.app/Contents/jre/Contents/Home/bin/java` and place into terminal

      /Applications/Android\ Studio.app/Contents/jre/Contents/Home/bin/  keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

- Enter keystore password:
- Re-enter new password: 
- What is yiur first & last name:
- What is the name of your organization:
- What is the name of your City or Locality:
- What is the name of yourWtState or province:
- What is the two-letter country code for this unit:
- Confermation: 
- Enter key password for <key> (RETURN if same as keystore password): 

### Reference the keystore from the app
Create a file named `[project]/android/key.properties` that contains a reference to your keystore:

      storePassword=<password from previous step>
      keyPassword=<password from previous step>
      keyAlias=upload
      storeFile=<location of the key store file, such as /Users/<user name>/upload-keystore.jks>
      
### Configure signing in gradle
Configure gradle to use your upload key when building your app in release mode by editing the `[project]/android/app/build.gradle` file.
Add the keystore information from your properties file before the android block:

         def keystoreProperties = new Properties()
         def keystorePropertiesFile = rootProject.file('key.properties')
         if (keystorePropertiesFile.exists()) {
             keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
         }

         android {
               ...
         }

Find the `buildTypes` block:

         buildTypes {
             release {
                 // TODO: Add your own signing config for the release build.
                 // Signing with the debug keys for now,
                 // so `flutter run --release` works.
                 signingConfig signingConfigs.debug
             }
         }

And replace it with the following signing configuration info:

         signingConfigs {
             release {
                 keyAlias keystoreProperties['keyAlias']
                 keyPassword keystoreProperties['keyPassword']
                 storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
                 storePassword keystoreProperties['storePassword']
             }
         }
         buildTypes {
             release {
                 signingConfig signingConfigs.release
             }
         }
         
Build Android App Bundle(.aab):

      flutter clean
      flutter build appbundle 



Official [ducumentation](https://docs.flutter.dev/deployment/android) for Android & iOS App Release.
