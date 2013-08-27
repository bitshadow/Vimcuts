if !has('python')
    echo "not supported python version"
    finish
endif

function! Hellovimcuts()
python << EOF

import vim, urllib2
import json

vim.command(':set splitright')
vim.command('vnew');
vim.current.window.width = 40

fp = open('data.txt', 'r')
data = fp.read()
spl = data.split('\n');
for dat in spl:
    vim.current.buffer.append(dat);

fp.close()

#vim.current.buffer.append(VC)
#vim.current.buffer.append("DATA: %s"%json_response)
EOF
endfunction
