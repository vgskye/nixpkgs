{ lib, buildPythonPackage, fetchPypi
, pythonOlder
, setuptools
, setuptools-changelog-shortener
, requests
, pytestCheckHook
, lazy
}:

buildPythonPackage rec {
  pname = "devpi-common";
  version = "4.0.0";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-N4f43B1Dg1mCnDF3Sj2341vVXNdjlDzF1vn7ORoLWJ8=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-changelog-shortener
  ];

  propagatedBuildInputs = [
    requests
    lazy
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "devpi_common"
  ];

  meta = with lib; {
    homepage = "https://github.com/devpi/devpi";
    description = "Utilities jointly used by devpi-server and devpi-client";
    changelog = "https://github.com/devpi/devpi/blob/common-${version}/common/CHANGELOG";
    license = licenses.mit;
    maintainers = with maintainers; [ lewo makefu ];
  };
}
