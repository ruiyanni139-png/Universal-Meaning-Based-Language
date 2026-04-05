function RawBlock(el)
  if el.format == "markdown" then
    local filename = el.text:match("@include:%s*(.*)")
    if filename then
      local f = io.open(filename, "r")
      local content = f:read("*all")
      f:close()
      return pandoc.read(content, "markdown").blocks
    end
  end
end


