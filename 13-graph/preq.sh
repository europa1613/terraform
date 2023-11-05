brew install graphviz
#
terraform init
terraform graph > graph.dot
#yum install graphviz
cat graph.dot | dot -Tsvg > graph.svg