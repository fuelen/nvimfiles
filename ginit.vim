" if neovim-qt
if exists(':GuiFont')
  " with ! to suppress warning Font \"Terminus\" reports bad fixed pitch
  " metrics
  GuiFont! Terminus:h14
  GuiTabline 0
  GuiPopupmenu 0
end
