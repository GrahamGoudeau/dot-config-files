import sys
if len(sys.argv) != 2:
    print("Incorrect usage; use with 'py' or 'c' option to set style")
    sys.exit()

if sys.argv[1] != "c" and sys.argv[1] != "py":
    print("Options: 'c' or 'py'")
    sys.exit()

filename = '/Users/graham/.vimrc'

begin_c = 'begin c'
end_c = 'end c'
begin_py = 'begin py'
end_py = 'end py'

setting_c = (sys.argv[1] == 'c')
setting_py = (sys.argv[1] == 'py')

f = open(filename, 'r')
lines = [line for line in f]
f.close()

new_content = []
mod_c = mod_py = False

for line in lines:
    if begin_c in line:
        mod_c = True
    if end_c in line:
        mod_c = False
    if begin_py in line:
        mod_py = True
    if end_py in line:
        mod_py = False

    if (mod_c and setting_c) or (mod_py and setting_py):
        line = line.replace("\"set", "set")
    if (mod_c and setting_py) or (mod_py and setting_c):
        line = line.replace("set", "\"set")

    new_content.append(line)

f = open(filename, 'w')
for line in new_content:
    f.write(line)
f.close()

