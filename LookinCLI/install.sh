#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${LOOKINCTL_REPO_URL:-https://github.com/nova286/Lookin.git}"
REF="${LOOKINCTL_REF:-Develop}"
RELEASE_URL="${LOOKINCTL_RELEASE_URL:-https://github.com/nova286/Lookin/releases/latest/download/lookinctl-macos-universal.tar.gz}"
CHECKSUM_URL="${LOOKINCTL_CHECKSUM_URL:-${RELEASE_URL}.sha256}"
INSTALL_DIR="${LOOKINCTL_INSTALL_DIR:-}"
SCRIPT_PATH="${BASH_SOURCE[0]:-}"
LOCAL_ROOT=""

if [[ -n "${SCRIPT_PATH}" && -f "${SCRIPT_PATH}" ]]; then
  LOCAL_ROOT="$(cd "$(dirname "${SCRIPT_PATH}")/.." && pwd)"
fi

if [[ -z "${INSTALL_DIR}" ]]; then
  if [[ -w "/usr/local/bin" ]]; then
    INSTALL_DIR="/usr/local/bin"
  else
    INSTALL_DIR="${HOME}/.local/bin"
  fi
fi

mkdir -p "${INSTALL_DIR}"

tmpdir="$(mktemp -d)"
cleanup() {
  rm -rf "${tmpdir}"
}
trap cleanup EXIT

install_binary() {
  local binary="$1"
  install -m 0755 "${binary}" "${INSTALL_DIR}/lookinctl"
  echo "Installed lookinctl to ${INSTALL_DIR}/lookinctl"
  if ! command -v lookinctl >/dev/null 2>&1; then
    echo "Add ${INSTALL_DIR} to PATH if your shell cannot find lookinctl."
  fi
}

if [[ -n "${LOCAL_ROOT}" && -x "${LOCAL_ROOT}/Build/lookinctl/lookinctl" ]]; then
  install_binary "${LOCAL_ROOT}/Build/lookinctl/lookinctl"
  exit 0
fi

archive_path="${tmpdir}/lookinctl-macos-universal.tar.gz"
checksum_path="${archive_path}.sha256"

if curl -fsSL "${RELEASE_URL}" -o "${archive_path}"; then
  if ! curl -fsSL "${CHECKSUM_URL}" -o "${checksum_path}"; then
    echo "Release checksum was not available at ${CHECKSUM_URL}." >&2
    exit 1
  fi
  (cd "${tmpdir}" && shasum -a 256 -c "$(basename "${checksum_path}")")
  mkdir -p "${tmpdir}/release"
  tar -xzf "${archive_path}" -C "${tmpdir}/release"
  binary="$(find "${tmpdir}/release" -type f -name lookinctl | head -n 1 || true)"
  if [[ -z "${binary}" ]]; then
    echo "Release archive did not contain lookinctl." >&2
    exit 1
  fi
  codesign --verify --strict --verbose=2 "${binary}"
  install_binary "${binary}"
  exit 0
fi

if [[ -n "${LOCAL_ROOT}" && -x "${LOCAL_ROOT}/LookinCLI/build.sh" ]]; then
  echo "No release binary found at ${RELEASE_URL}; building local checkout."
  "${LOCAL_ROOT}/LookinCLI/build.sh" >/dev/null
  install_binary "${LOCAL_ROOT}/Build/lookinctl/lookinctl"
  exit 0
fi

echo "No release binary found at ${RELEASE_URL}; building from source."
echo "This fallback requires macOS Command Line Tools and git."

git clone --depth 1 --branch "${REF}" "${REPO_URL}" "${tmpdir}/Lookin"
"${tmpdir}/Lookin/LookinCLI/build.sh" >/dev/null
install_binary "${tmpdir}/Lookin/Build/lookinctl/lookinctl"
