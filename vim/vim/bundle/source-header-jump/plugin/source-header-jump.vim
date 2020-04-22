function! SourceHeaderJump()
  let withoutExt = expand('%:r')
  let extension = expand('%:e')
  let candidates = []

  if extension == "h" || extension == "hpp"
    let candidates = [withoutExt.".C", withoutExt.".cpp"]

    if withoutExt =~# "/include/"
      let withoutExtSource = substitute(withoutExt, "/include/", "/src/", "")
      let candidates = candidates + [withoutExtSource.".C", withoutExtSource.".cpp"]
    endif

    if withoutExt =~# "Fwd$"
      let withoutFwd = strpart(withoutExt, 0, strlen(withoutExt)-3)
      let candidates = candidates + [withoutFwd.".h", withoutFwd.".hpp"]
    elseif withoutExt =~# "Impl$"
      let withoutImpl = strpart(withoutExt, 0, strlen(withoutExt)-4)
      let candidates = candidates + [withoutImpl.".h", withoutFwd.".hpp"]
    else
      let candidates = candidates + [withoutExt."Impl.h"]
    endif
  elseif extension == "C" || extension == "cpp"
    let candidates = [withoutExt.".h", withoutExt.".hpp"]

    if withoutExt =~# "/src/"
      let withoutExtInclude = substitute(withoutExt, "/src/", "/include/", "")
      let candidates = candidates + [withoutExtInclude.".h", withoutExtInclude.".hpp"]
    endif
  endif

  for fileToOpen in candidates
    if filereadable(fileToOpen)
      let bnr = bufnr(fileToOpen)
      if bnr > 0
        silent execute 'buffer' bnr
      else
        silent execute 'edit' fileToOpen
      endif

      return
    endif
  endfor

  echo "None of the files [".join(candidates, ", ")."] exist"
endfunction
