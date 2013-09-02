if !has('python')
    echo "not supported python version"
    finish
endif

function! OpenVC()
python << EOF
import vim

def OpenVC():
    vc_name="__VIMCUTS__"
    vim.command(':set splitright')
    vim.command('vnew ' + vc_name)
    vim.current.window.width = 50

    fp = open('data.mkd', 'r')
    data = fp.read()
    spl = data.split('\n');
    for dat in spl:
        vim.current.buffer.append(dat);
    fp.close()
    vc_isopen = True;

target = int(vim.eval("bufwinnr('__VIMCUTS__')"))-1
if target >= 0 and target < len(vim.windows):
    print "vimcuts is already open at window: ", target+1
else:
    OpenVC()

EOF
endfunction

function! CloseVC()
python << EOF
import vim

def CloseVc():
    target = int(vim.eval("bufwinnr('__VIMCUTS__')"))
    #vim.current.buffer.append(str(target)+ " " + str(len(vim.windows)))
    if target >= 0 and target <= len(vim.windows):
            vim.command('%dwincmd w' % target)
            vim.command('wincmd c')
    else:
        print "vimcuts is already closed!"
CloseVc()
EOF
endfunction

