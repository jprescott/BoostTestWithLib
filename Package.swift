// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "BoostTest",
    products: [
        .executable(
            name: "BoostTest",
            targets: ["BoostTest"]),
    ],
    targets: [
        .target(
            name: "CXXBoost"
            , exclude: ["include"]
            , cxxSettings: [.unsafeFlags(["-D","BOOST_ALL_NO_LIB=1","-D","DATE_TIME_INLINE","-D","NDEBUG","-m64"])]
        ),
        /// The C++ library
        .target(
            name: "CXXLib"
            , dependencies: ["CXXBoost"]
            , exclude: ["include"] // will be fixed with PR-2814
        ),
        /// The C wrapper
        .target(
            name: "CWrapper"
            , dependencies: ["CXXLib"]
         ),
        .target(
            name: "BoostTest",
            dependencies: ["CWrapper"])
    ],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx14
)
