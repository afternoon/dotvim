setlocal tabstop=2 shiftwidth=2 softtabstop=2
setlocal equalprg=python\ -c\ \"import\ sys,json;print\ json.dumps(json.loads(sys.stdin.read()),indent=2)\"
