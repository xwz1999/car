import 'package:pub_semver/pub_semver.dart';

enum VersionNumber {
  major,
  minor,
  patch,
}

class VersionTool {
  Version version;
  VersionTool(this.version);
  VersionTool.fromText(String text) : version = Version.parse(text);

  Version get nextMajor => _addBuildNumber(VersionNumber.major);
  Version get nextMinor => _addBuildNumber(VersionNumber.minor);
  Version get nextPatch => _addBuildNumber(VersionNumber.patch);

  Version nextMajorTag(String tag) => _addBuildNumber(
        VersionNumber.major,
        tag: tag,
      );
  Version nextMinorTag(String tag) => _addBuildNumber(
        VersionNumber.minor,
        tag: tag,
      );
  Version nextPatchTag(String tag) => _addBuildNumber(
        VersionNumber.patch,
        tag: tag,
      );

  Version _addBuildNumber(VersionNumber type, {String? tag}) {
    switch (type) {
      case VersionNumber.major:
        return Version(
          version.major,
          version.minor,
          version.patch + 1,
          pre: tag,
          build: '${(version.build.first as int) + 1}',
        );
      case VersionNumber.minor:
        return Version(
          version.major,
          version.minor + 1,
          0,
          pre: tag,
          build: '${(version.build.first as int) + 1}',
        );
      case VersionNumber.patch:
        return Version(
          version.major + 1,
          0,
          0,
          pre: tag,
          build: '${(version.build.first as int) + 1}',
        );
    }
  }
}
