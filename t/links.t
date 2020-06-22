mkdir tmp

echo foo > tmp/foo
t_diag "Creates links for tmp/foo"
./links tmp/foo tmp/sym
./links -H tmp/foo tmp/link
t_symlink tmp/sym
t_file tmp/link "tmp/link is a hard link"
t_is "$(cat tmp/foo)" "$(cat tmp/link)" "tmp/foo and tmp/link are identical"

echo bar > tmp/bar
./links tmp/bar tmp/sym
t_ne $? 0 "Fail to make symlink on existing symlink"
./links --force tmp/bar tmp/sym
t_eq $? 0 "Overwrite existing symlink w/ --force option"
t_is "$(readlink tmp/sym)" tmp/bar "tmp/sym -> tmp/bar"

./links tmp/bar tmp/link
t_ne $? 0 "Can't create symlink on existing file"
./links --force tmp/bar tmp/link
t_ne $? 0 "Can't create symlink on existing file even if \"--force\" option is specified"

rm -rf tmp
