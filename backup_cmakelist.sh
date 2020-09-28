cd ..
find . -path ./cmake -prune -false -o -type f -name 'CMakeLists.txt' -exec cp --parents --verbose {} cmake/project_template_CMakelists \;
cp build/build.sh cmake/project_template_CMakelists/build
