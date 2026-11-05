#!/usr/bin/env bash
# Maintainer check: compiles the Unity C# templates of this repository with the Roslyn
# compiler bundled in a Unity install, against the engine assemblies and the
# ScriptAssemblies of an already imported Unity project (for UGUI, TextMeshPro and the
# test framework). Does not start Unity and does not modify the project.
#
# Usage: tools/compile_unity_templates.sh <unity-project> [unity-editor-dir]
set -euo pipefail

repo="$(cd "$(dirname "$0")/.." && pwd)"
project="$(cd "$1" && pwd)"
version="$(sed -n 's/^m_EditorVersion: //p' "$project/ProjectSettings/ProjectVersion.txt")"
editor="${2:-/Applications/Unity/Hub/Editor/$version}"
scripting="$editor/Unity.app/Contents/Resources/Scripting"
managed="$scripting/Managed/UnityEngine"
assemblies="$project/Library/ScriptAssemblies"
templates="$repo/skills/ui-first-development/assets/unity"

dotnet="$scripting/DotNetSdk/dotnet"
csc="$(find "$scripting/DotNetSdk/sdk" -path '*Roslyn/bincore/csc.dll' | head -1)"
netstandard="$(find "$scripting/DotNetSdk/packs/NETStandard.Library.Ref" -name netstandard.dll | head -1)"
# NUnit targets .NET Framework, so the tests also need the mscorlib facade.
mscorlib="$(find "$scripting" -name mscorlib.dll -path '*netfx*' | head -1)"
nunit="$(find "$project/Library/PackageCache" -path '*com.unity.ext.nunit*unity-custom/nunit.framework.dll' | head -1)"

engine=()
for dll in "$managed"/UnityEngine*.dll; do engine+=("-r:$dll"); done
editor_refs=()
for dll in "$managed"/UnityEditor*.dll; do editor_refs+=("-r:$dll"); done

out="$(mktemp -d)"
compile() {
  local name="$1"; shift
  "$dotnet" "$csc" -nologo -noconfig -nostdlib -target:library -langversion:9 \
    -nowarn:1701,1702,0649 -warnaserror+:0618 -out:"$out/$name.dll" -r:"$netstandard" "$@"
  echo "compiled $name"
}

echo "Unity $version, project $project"
compile Runtime "${engine[@]}" -r:"$assemblies/UnityEngine.UI.dll" -r:"$assemblies/Unity.TextMeshPro.dll" \
  "$templates"/Runtime/*.cs
compile Editor "${engine[@]}" "${editor_refs[@]}" -r:"$out/Runtime.dll" "$templates"/Editor/*.cs
compile Tests "${engine[@]}" -r:"$out/Runtime.dll" -r:"$assemblies/UnityEngine.TestRunner.dll" -r:"$nunit" -r:"$mscorlib" \
  "$templates"/Tests/*.cs
rm -rf "$out"
echo "all templates compile"
