rm -rf javalibs
mkdir javalibs
./gradlew getDeps
haxe --run BuildFromDirectory
haxe compile.hxml
./gradlew build