cmake -DMCU=STM32F769xx --graphviz=dependency.dot .. 
dot -Tpng -o ../docs/dependency.png dependency.dot 
make -j4 
cp compile_commands.json ..
