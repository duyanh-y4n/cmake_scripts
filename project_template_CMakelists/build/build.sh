cmake -DMCU=STM32F769xx \
    -DDEBUG_OUTPUT_EN=ON \
    -DSEGGER_SYSVIEW=OFF \
    -DFREERTOS=ON \
    -DFATFS=ON \
    --graphviz=dependency.dot .. 
dot -Tpng -o ../docs/dependency.png dependency.dot 
make -j4 
cp compile_commands.json ..
