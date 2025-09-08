import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory
import com.android.build.gradle.BaseExtension

// ✅ Global SDK configuration for all modules/plugins
extra.set("compileSdkVersion", 36)
extra.set("targetSdkVersion", 34)
extra.set("minSdkVersion", 24)

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Optional: change root build output directory
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    afterEvaluate {
        if (plugins.hasPlugin("com.android.application") || plugins.hasPlugin("com.android.library")) {
            extensions.findByType(BaseExtension::class.java)?.apply {
                compileSdkVersion(36)
                buildToolsVersion("34.0.0")
            }
        }
    }
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
