{ lib
, stdenv
# any fetchers
# any dependencies
}:
stdenv.mkDerivation rec {
  pname = "ultraleap-hand-tracking-service";
  version = "5.17.1";

  unfree = true;

  src = fetchurl {
    url = "https://repo.ultraleap.com/apt/pool/main/u/ultraleap-hand-tracking-service/ultraleap-hand-tracking-service_5.17.1.0-a9f25232-1.0_amd64.deb";
    hash = "sha256-1r70k2mmzzyy9vh1w3vhpcndm0iwqdy15s6063sggb1ks7j654cx";
  };
  
  nativeBuildInputs = [
    binutils
  ];

  buildInputs = [
    # maybe?
  ];
  
  buildPhase = ''
    runHook preBuild
    mkdir data
    ar vx $src
    tar xvf data.tar.gz
    sed -i '$ d' data/usr/lib/x86_64-linux-gnu/cmake/LeapSDK/leapsdk-config.cmake
    echo "include(../../../cmake/LeapC/LeapCTargets.cmake)" >> data/usr/lib/x86_64-linux-gnu/cmake/LeapSDK/leapsdk-config.cmake
    runHook postBuild
  '';
  
  installPhase = ''
    runHook preInstall

    cp -R usr/* $out/

    # Configuration
    # install -D -m444 etc/ultraleap/hand_tracker_config.json $out/etc/ultraleap/hand_tracker_config.json

    # Binaries
    # install -D -m555 usr/bin/leapctl $out/bin/leapctl
    # install -D -m555 usr/bin/leapd $out/bin/leapd

    # Libraries
    #install -D -m444 usr/lib/ultraleap-hand-tracking-service/liblibrealuvc.so.0.1.1 $out/lib/librealuvc.so.0.1.1
    #install -D -m444 usr/lib/ultraleap-hand-tracking-service/liblibrealuvc.so.0.1.1 $out/lib/librealuvc.so.0
    #install -D -m444 usr/lib/ultraleap-hand-tracking-service/liblibrealuvc.so.0.1.1 $out/lib/librealuvc.so
    #install -D -m444 usr/lib/ultraleap-hand-tracking-service/libLeapC.so.5 $out/lib/libLeapC.so.5
    #install -D -m444 usr/lib/ultraleap-hand-tracking-service/libLeapC.so.5 $out/lib/libLeapC.so

    # Data blobs (TODO: Is $out/usr/share/ultraleap/ the right place for this?)
    #install -D -m444 usr/share/ultraleap/ldat-426392.ldat $out/usr/share/ultraleap/ldat-426392.ldat
    #install -D -m444 usr/share/ultraleap/ldat-426437.ldat $out/usr/share/ultraleap/ldat-426437.ldat
    #install -D -m444 usr/share/ultraleap/ldat-426643.ldat $out/usr/share/ultraleap/ldat-426643.ldat
    #install -D -m444 usr/share/ultraleap/ldat-429281.ldat $out/usr/share/ultraleap/ldat-429281.ldat
    #install -D -m444 usr/share/ultraleap/ldat-429419.ldat $out/usr/share/ultraleap/ldat-429419.ldat
    #install -D -m444 usr/share/ultraleap/ldat-430152.ldat $out/usr/share/ultraleap/ldat-430152.ldat
    #install -D -m444 usr/share/ultraleap/ldat-430856.ldat $out/usr/share/ultraleap/ldat-430856.ldat
    #install -D -m444 usr/share/ultraleap/ldat-430861.ldat $out/usr/share/ultraleap/ldat-430861.ldat
    #install -D -m444 usr/share/ultraleap/ldat-431319.ldat $out/usr/share/ultraleap/ldat-431319.ldat
    #install -D -m444 usr/share/ultraleap/ldat-432858.ldat $out/usr/share/ultraleap/ldat-432858.ldat

    # Firmware blobs (TODO: Is $out/usr/share/ultraleap/firmware/ the right place for this?)
    #install -D -m444 usr/share/ultraleap/firmware/CyPeripheral-1.7.0.ldat $out/usr/share/ultraleap/firmware/CyPeripheral-1.7.0.ldat
    #install -D -m444 usr/share/ultraleap/firmware/leap2_v3.8.6.ldat $out/usr/share/ultraleap/firmware/leap2_v3.8.6.ldat
    #install -D -m444 usr/share/ultraleap/firmware/SIR170_v3.8.6.ldat $out/usr/share/ultraleap/firmware/SIR170_v3.8.6.ldat

    # Development files (TODO: Likewise, are these in the right place?)
    #install -D -m444 usr/lib/ultraleap-hand-tracking-service/cmake/LeapCTargets.cmake $out/usr/lib/cmake/LeapC/LeapCTargets.cmake
    #install -D -m444 usr/lib/ultraleap-hand-tracking-service/cmake/LeapCTargets-release.cmake $out/usr/lib/cmake/LeapC/LeapCTargets-release.cmake

    #install -D -m444 usr/lib/x86_64-linux-gnu/cmake/LeapSDK/leapsdk-config.cmake $out/usr/lib/cmake/leapsdk-config/leapsdk-config.cmake
    #install -D -m444 usr/lib/x86_64-linux-gnu/cmake/LeapSDK/leapsdk-configVersion.cmake $out/usr/lib/cmake/leapsdk-config/leapsdk-configVersion.cmake

    #install -D -m444 usr/include/LeapC.h $out/usr/include/LeapC.h

    # Documentation (TODO: Again, is $out/usr/share/doc/ultraleap-hand-tracking-service/ the right place?)
    #install -D -m444 usr/share/doc/ultraleap-hand-tracking-service/copyright $out/usr/share/doc/ultraleap-hand-tracking-service/copyright
    #install -D -m444 usr/share/doc/ultraleap-hand-tracking-service/LICENSE.md $out/usr/share/doc/ultraleap-hand-tracking-service/LICENSE.md
    #install -D -m444 usr/share/doc/ultraleap-hand-tracking-service/README.md $out/usr/share/doc/ultraleap-hand-tracking-service/README.md
    #install -D -m444 usr/share/doc/ultraleap-hand-tracking-service/ThirdPartyNotices.md $out/usr/share/doc/ultraleap-hand-tracking-service/ThirdPartyNotices.md
    #install -D -m444 usr/share/doc/ultraleap-hand-tracking-service/UltraleapEULA.pdf $out/usr/share/doc/ultraleap-hand-tracking-service/UltraleapEULA.pdf

    #install -D -m444 usr/lib/ultraleap-hand-tracking-service/LICENSE.protobuf $out/usr/share/doc/ultraleap-hand-tracking-service/LICENSE.protobuf

    # Udev rules (TODO: This should be its own package)
    install -D -m444 lib/systemd/system/ultraleap-hand-tracking-service.service $out/usr/lib/systemd/system/ultraleap-hand-tracking-service.service
    install -D -m444 lib/udev/rules.d/99-SIR170.rules $out/lib/udev/rules.d/99-SIR170.rules
    install -D -m444 lib/udev/rules.d/99-LMC.rules $out/lib/udev/rules.d/99-LMC.rules
    install -D -m444 lib/udev/rules.d/99-LMC2.rules $out/lib/udev/rules.d/99-LMC2.rules

    # Custom files (TODO: Make this actually work)
    install -D -m444 leap.conf $out/usr/lib/sysusers.d/leap.conf
    install -D -m444 leap-tmpfiles.conf $out/usr/lib/tmpfiles.d/leap.conf
    install -D -m444 analytics_config.json $out/etc/ultraleap/analytics_config.json
    install -D -m444 ultraleap-hand-tracking-service.conf $out/etc/ld.so.conf.d/ultraleap-hand-tracking-service.conf

    runHook postInstall
  '';
}
