search_dir=.
output_file_path=./database.dat
rm -rf $output_file_path

for entry in */
do
  if [[ "$entry" != "_platform/" ]]; then
    echo ${entry:0:$((${#entry} - 1))} >> $output_file_path
  fi
done

cat database.dat
