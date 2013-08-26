if !has('python')
    echo "not supported python version"
    finish
endif

function! Hellovimcuts()
python << EOF
import vim, urllib2
import json

VIMCUTS = "foo bar blah blah"

try:
    response = urllib2.urlopen(URL, None, TIMEOUT).read()
    json_response = json.loads(response)

    print "this is not what I want"

except Exception, e:
    print e
vim.command("new")
vim.current.buffer.append("%s"%VIMCUTS);
#vim.current.buffer.append("DATA: %s"%json_response)
EOF
endfunction


