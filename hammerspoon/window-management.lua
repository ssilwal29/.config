-- Modal window management
-- Set animation duration
hs.window.animationDuration = 0
hs.grid.setMargins({0, 0})
hs.grid.setGrid('24x18')

k=hs.hotkey.modal.new({"alt"}, "tab")
function k:entered()
  hs.alert.show("Entered window mode", _, _, 0)
end
function k:exited()
  hs.alert.show("Exited window mode", _, _, 0)
end


k:bind({}, "space", function()
  local win = hs.window.focusedWindow()
  win:move(hs.layout.maximized)
  hs.grid.snap(win)
end)

k:bind({}, "up", function()
  local win = hs.window.focusedWindow()
  hs.grid.pushWindowUp(win)
end)
k:bind({}, "down", function()
  local win = hs.window.focusedWindow()
  hs.grid.pushWindowDown(win)
end)
k:bind({}, "left", function()
  local win = hs.window.focusedWindow()
  hs.grid.pushWindowLeft(win)
end)
k:bind({}, "right", function()
  local win = hs.window.focusedWindow()
  hs.grid.pushWindowRight(win)
end)

-- CTRL: shrink windows
k:bind({"ctrl"}, "up", function()
  local win = hs.window.focusedWindow()
  hs.grid.resizeWindowShorter(win)
end)
k:bind({"ctrl"}, "down", function()
  local win = hs.window.focusedWindow()
  hs.grid.pushWindowDown(win)
  hs.grid.resizeWindowShorter(win)
end)
k:bind({"ctrl"}, "left", function()
  local win = hs.window.focusedWindow()
  hs.grid.resizeWindowThinner(win)
end)
k:bind({"ctrl"}, "right", function()
  local win = hs.window.focusedWindow()
  hs.grid.pushWindowRight(win)
  hs.grid.resizeWindowThinner(win)
end)

-- OPTION: grow windows
k:bind({"alt"}, "up", function()
  local win = hs.window.focusedWindow()
  hs.grid.pushWindowUp(win)
  hs.grid.pushWindowUp(win)
  hs.grid.resizeWindowTaller(win)
end)
k:bind({"alt"}, "down", function()
  local win = hs.window.focusedWindow()
  hs.grid.resizeWindowTaller(win)
end)
k:bind({"alt"}, "left", function()
  local win = hs.window.focusedWindow()
  hs.grid.pushWindowLeft(win)
  hs.grid.pushWindowLeft(win)
  hs.grid.resizeWindowWider(win)
end)
k:bind({"alt"}, "right", function()
  local win = hs.window.focusedWindow()
  hs.grid.resizeWindowWider(win)
end)

k:bind({"cmd"}, "up", function()
  local win = hs.window.focusedWindow()
  win:move({0,0,1,0.5})
  hs.grid.snap(win)
end)
k:bind({"cmd"}, "down", function()
  local win = hs.window.focusedWindow()
  win:move({0,0.5,1,0.5})
  hs.grid.snap(win)
end)
k:bind({"cmd"}, "left", function()
  local win = hs.window.focusedWindow()
  win:move(hs.layout.left50)
  hs.grid.snap(win)
end)
k:bind({"cmd"}, "right", function()
  local win = hs.window.focusedWindow()
  win:move(hs.layout.right50)
  hs.grid.snap(win)
end)

k:bind({}, 'escape', function() k:exit() end)
