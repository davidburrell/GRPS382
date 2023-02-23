#
# GRPS382: Provides access to the groups of order 3^8*2
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "GRPS382" );

TestDirectory(DirectoriesPackageLibrary( "GRPS382", "tst" ),
  rec(exitGAP := true));

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
