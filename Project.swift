import ProjectDescription

let project = Project(
    name: "PatternsIOS",
    organizationName: "PatternsIOS",
    settings: Settings.settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release")
    ]),
    targets: [
        .target(
            name: "PatternsIOSApp",
            destinations: [.iPhone, .iPad],
            product: .app,
            bundleId: "com.patternsios.app",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .default,
            sources: ["App/**"],
            resources: [],
            dependencies: [
                .target(name: "PatternsIOS")
            ]
        ),
        .target(
            name: "PatternsIOS",
            destinations: [.iPhone, .iPad],
            product: .framework,
            bundleId: "com.patternsios.library",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: [],
            dependencies: []
        ),
        .target(
            name: "PatternsIOSTests",
            destinations: [.iPhone, .iPad],
            product: .unitTests,
            bundleId: "com.patternsios.tests",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "PatternsIOS")
            ]
        )
    ]
)
