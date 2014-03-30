function export
  set arr (echo $argv|tr = \n)
  set -gx $arr[1] $arr[2]
end
