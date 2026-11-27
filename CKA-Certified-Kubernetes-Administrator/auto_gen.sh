mkdir -p CKA-05/ans
cd CKA-05/ans
for i in {1..17}; do
  mkdir -p "$i"
  touch "$i/$i.md"
  touch "$i/$i.yaml"
done