cd project_template_CMakelists
find . -path ./cmake -prune -false -o -type f -name 'CMakeLists.txt' -exec cp --parents --verbose {} ../.. \;
cp -r build ../../
