# Flutter
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Isar
-keep class dev.isar.** { *; }

# json_serializable + freezed
-keep class **.model.** { *; }
-keepclassmembers class * {
    @dart.annotation.Keep <fields>;
    @dart.annotation.Keep <methods>;
}

# Riverpod
-keep class **.riverpod.** { *; }

# flutter_secure_storage
-keep class com.it_nomads.fluttersecurestorage.** { *; }

# General keep for reflection
-keep class * {
    @dart.annotation.Keep *;
}

# Your existing suppressions
-dontwarn com.google.errorprone.annotations.**
-dontwarn javax.annotation.**
