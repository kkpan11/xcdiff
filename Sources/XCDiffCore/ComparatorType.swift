//
// Copyright 2019 Bloomberg Finance L.P.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

public enum ComparatorType {
    case fileReferences
    case buildPhases
    case copyFiles
    case targets
    case headers
    case sources
    case resources
    case runScripts
    case configurations
    case settings
    case resolvedSettings
    case sourceTrees
    case dependencies
    case linkedDependecies
    case attributes
    case swiftPackages
    case fileSystemSynchronizedGroups
    case custom(Comparator)

    public var tag: String {
        return comparator().tag
    }

    // swiftlint:disable cyclomatic_complexity
    func comparator() -> Comparator {
        switch self {
        case .fileReferences:
            return FileReferencesComparator()
        case .buildPhases:
            return BuildPhasesComparator()
        case .copyFiles:
            return CopyFilesComparator()
        case .targets:
            return TargetsComparator()
        case .headers:
            return HeadersComparator()
        case .sources:
            return SourcesComparator()
        case .resources:
            return ResourcesComparator()
        case .runScripts:
            return RunScriptComparator()
        case .configurations:
            return ConfigurationsComparator()
        case .settings:
            return SettingsComparator()
        case .resolvedSettings:
            return ResolvedSettingsComparator(system: DefaultSystem())
        case .sourceTrees:
            return SourceTreesComparator()
        case .dependencies:
            return DependenciesComparator()
        case .linkedDependecies:
            return LinkedDependenciesComparator()
        case .attributes:
            return AttributesComparator()
        case .swiftPackages:
            return SwiftPackagesComparator()
        case .fileSystemSynchronizedGroups:
            return FileSytemSynchronizedGroupsComparator()
        case let .custom(comparator):
            return comparator
        }
    }
}

public extension Array where Element == ComparatorType {
    static var allAvailableComparators: [ComparatorType] {
        return [
            .fileReferences,
            .buildPhases,
            .copyFiles,
            .targets,
            .headers,
            .sources,
            .resources,
            .runScripts,
            .configurations,
            .settings,
            .resolvedSettings,
            .sourceTrees,
            .dependencies,
            .linkedDependecies,
            .attributes,
            .swiftPackages,
            .fileSystemSynchronizedGroups,
        ]
    }

    static var defaultComparators: [ComparatorType] {
        return [
            .fileReferences,
            .buildPhases,
            .copyFiles,
            .targets,
            .headers,
            .sources,
            .resources,
            .runScripts,
            .configurations,
            .settings,
            .sourceTrees,
            .dependencies,
            .linkedDependecies,
            .attributes,
            .swiftPackages,
            .fileSystemSynchronizedGroups,
        ]
    }
}
