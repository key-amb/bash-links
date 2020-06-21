mkdir tmp

echo foo > tmp/foo
./links tmp/foo tmp/foos
./links -H tmp/foo tmp/fooh
t_symlink tmp/foos
t_file tmp/fooh
t_is "$(cat tmp/foo)" "$(cat tmp/fooh)" "tmp/foo and tmp/fooh are identical"

msg="[NOTICE] File exists: tmp/foo"
t_is "$(./links tmp/fooh tmp/foo)" $msg $msg
t_is "$(./links --force tmp/fooh tmp/foo)" $msg $msg

rm -rf tmp
