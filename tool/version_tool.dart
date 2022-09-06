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

  Version nextMajorTag(String tag, {bool addTag = false}) => _addBuildNumber(
        VersionNumber.major,
        tag: tag,
        addTag: addTag,
      );

  Version nextMinorTag(String tag, {bool addTag = false}) => _addBuildNumber(
        VersionNumber.minor,
        tag: tag,
        addTag: addTag,
      );

  Version nextPatchTag(String tag, {bool addTag = false}) => _addBuildNumber(
        VersionNumber.patch,
        tag: tag,
        addTag: addTag,
      );

  Version _addBuildNumber(VersionNumber type,
      {String? tag, bool addTag = false}) {
    switch (type) {
      case VersionNumber.major:
        return Version(
          version.major,
          version.minor,
          version.patch + 1,
          pre: addTag ? tag : null,
          build: '${(version.build.first as int) + 1}',
        );
      case VersionNumber.minor:
        return Version(
          version.major,
          version.minor + 1,
          0,
          pre: addTag ? tag : null,
          build: '${(version.build.first as int) + 1}',
        );
      case VersionNumber.patch:
        return Version(
          version.major + 1,
          0,
          0,
          pre: addTag ? tag : null,
          build: '${(version.build.first as int) + 1}',
        );
    }
  }
}
