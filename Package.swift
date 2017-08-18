import Foundation
import PackageDescription

var isSwiftPackagerManagerTest: Bool {
    let environment = ProcessInfo.processInfo.environment
    guard let value = environment["SWIFTPM_TEST_ReactiveSwift"] else { return false }
    return NSString(string: value).boolValue
}

let package = Package(
    name: "ReactiveSwift",
    dependencies: {
        var deps: [Package.Dependency] = [
            .Package(url: "https://github.com/antitypical/Result.git", versions: Version(3, 2, 1)..<Version(3, .max, .max)),
        ]
        if isSwiftPackagerManagerTest {
            deps += [
                .Package(url: "https://github.com/Quick/Quick.git", majorVersion: 1, minor: 1),
                .Package(url: "https://github.com/Quick/Nimble.git", majorVersion: 7),
            ]
        }
        return deps
    }(),
    swiftLanguageVersions: [3, 4]
)
