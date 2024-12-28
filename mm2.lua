
local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function dec(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

loadstring(dec([[
bG9jYWwgT3Jpb25MaWIgPSBsb2Fkc3RyaW5nKGdhbWU6SHR0cEdldCgoJ2h0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9zaGxleHdhcmUvT3Jpb24vbWFpbi9zb3VyY2UnKSkpKCkKbG9jYWwgV2luZG93ID0gT3Jpb25MaWI6TWFrZVdpbmRvdyh7CiAgICBOYW1lID0gIkt5b3VraSBQcmVtaXVtIiwKICAgIEhpZGVQcmVtaXVtID0gZmFsc2UsCiAgICBTYXZlQ29uZmlnID0gdHJ1ZSwKICAgIENvbmZpZ0ZvbGRlciA9ICJLeW91a2lDb25maWciLAogICAgSW50cm9FbmFibGVkID0gdHJ1ZSwKICAgIEludHJvVGV4dCA9ICJLeW91a2kgUHJlbWl1bSIsCiAgICBJbnRyb0ljb24gPSAicmJ4YXNzZXRpZDovLzc3MzM5NTU3NDAiCn0pCgpsb2NhbCBQbGF5ZXJzID0gZ2FtZTpHZXRTZXJ2aWNlKCJQbGF5ZXJzIikKbG9jYWwgTG9jYWxQbGF5ZXIgPSBQbGF5ZXJzLkxvY2FsUGxheWVyCmxvY2FsIFJlcGxpY2F0ZWRTdG9yYWdlID0gZ2FtZTpHZXRTZXJ2aWNlKCJSZXBsaWNhdGVkU3RvcmFnZSIpCmxvY2FsIFJ1blNlcnZpY2UgPSBnYW1lOkdldFNlcnZpY2UoIlJ1blNlcnZpY2UiKQpsb2NhbCBVc2VySW5wdXRTZXJ2aWNlID0gZ2FtZTpHZXRTZXJ2aWNlKCJVc2VySW5wdXRTZXJ2aWNlIikKCmxvY2FsIE1haW5UYWIgPSBXaW5kb3c6TWFrZVRhYih7TmFtZSA9ICJNYWluIiwgSWNvbiA9ICJyYnhhc3NldGlkOi8vNDQ4MzM0NTk5OCJ9KQpsb2NhbCBNdXJkZXJUYWIgPSBXaW5kb3c6TWFrZVRhYih7TmFtZSA9ICJNdXJkZXIiLCBJY29uID0gInJieGFzc2V0aWQ6Ly80NDgzMzQ1OTk4In0pCmxvY2FsIFNoZXJpZmZUYWIgPSBXaW5kb3c6TWFrZVRhYih7TmFtZSA9ICJTaGVyaWZmIiwgSWNvbiA9ICJyYnhhc3NldGlkOi8vNDQ4MzM0NTk5OCJ9KQpsb2NhbCBQbGF5ZXJUYWIgPSBXaW5kb3c6TWFrZVRhYih7TmFtZSA9ICJQbGF5ZXIiLCBJY29uID0gInJieGFzc2V0aWQ6Ly80NDgzMzQ1OTk4In0pCmxvY2FsIFRlbGVwb3J0c1RhYiA9IFdpbmRvdzpNYWtlVGFiKHtOYW1lID0gIlRlbGVwb3J0cyIsIEljb24gPSAicmJ4YXNzZXRpZDovLzQ0ODMzNDU5OTgifSkKbG9jYWwgVmlzdWFsc1RhYiA9IFdpbmRvdzpNYWtlVGFiKHtOYW1lID0gIlZpc3VhbHMiLCBJY29uID0gInJieGFzc2V0aWQ6Ly80NDgzMzQ1OTk4In0pCmxvY2FsIEV4cGxvaXRzVGFiID0gV2luZG93Ok1ha2VUYWIoe05hbWUgPSAiRXhwbG9pdHMiLCBJY29uID0gInJieGFzc2V0aWQ6Ly80NDgzMzQ1OTk4In0pCgpsb2NhbCBmdW5jdGlvbiB1cGRhdGVFU1AoKQogICAgaWYgbm90IGdldGdlbnYoKS5Sb2xlRVNQIHRoZW4gcmV0dXJuIGVuZAogICAgCiAgICBmb3IgXywgcGxheWVyIGluIHBhaXJzKFBsYXllcnM6R2V0UGxheWVycygpKSBkbwogICAgICAgIGlmIHBsYXllci5DaGFyYWN0ZXIgYW5kIHBsYXllciB+PSBMb2NhbFBsYXllciB0aGVuCiAgICAgICAgICAgIGxvY2FsIGhpZ2hsaWdodCA9IHBsYXllci5DaGFyYWN0ZXI6RmluZEZpcnN0Q2hpbGQoIkhpZ2hsaWdodCIpCiAgICAgICAgICAgIGlmIG5vdCBoaWdobGlnaHQgdGhlbgogICAgICAgICAgICAgICAgaGlnaGxpZ2h0ID0gSW5zdGFuY2UubmV3KCJIaWdobGlnaHQiKQogICAgICAgICAgICAgICAgaGlnaGxpZ2h0LlBhcmVudCA9IHBsYXllci5DaGFyYWN0ZXIKICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIAogICAgICAgICAgICBsb2NhbCBoYXNLbmlmZSA9IChwbGF5ZXIuQmFja3BhY2sgYW5kIHBsYXllci5CYWNrcGFjazpGaW5kRmlyc3RDaGlsZCgiS25pZmUiKSkgb3IgKHBsYXllci5DaGFyYWN0ZXIgYW5kIHBsYXllci5DaGFyYWN0ZXI6RmluZEZpcnN0Q2hpbGQoIktuaWZlIikpCiAgICAgICAgICAgIGxvY2FsIGhhc0d1biA9IChwbGF5ZXIuQmFja3BhY2sgYW5kIHBsYXllci5CYWNrcGFjazpGaW5kRmlyc3RDaGlsZCgiR3VuIikpIG9yIChwbGF5ZXIuQ2hhcmFjdGVyIGFuZCBwbGF5ZXIuQ2hhcmFjdGVyOkZpbmRGaXJzdENoaWxkKCJHdW4iKSkKICAgICAgICAgICAgCiAgICAgICAgICAgIGlmIGhhc0tuaWZlIHRoZW4KICAgICAgICAgICAgICAgIGhpZ2hsaWdodC5GaWxsQ29sb3IgPSBDb2xvcjMuZnJvbVJHQigyNTUsIDAsIDApCiAgICAgICAgICAgICAgICBoaWdobGlnaHQuT3V0bGluZUNvbG9yID0gQ29sb3IzLmZyb21SR0IoMjU1LCAwLCAwKQogICAgICAgICAgICBlbHNlaWYgaGFzR3VuIHRoZW4KICAgICAgICAgICAgICAgIGhpZ2hsaWdodC5GaWxsQ29sb3IgPSBDb2xvcjMuZnJvbVJHQigwLCAwLCAyNTUpCiAgICAgICAgICAgICAgICBoaWdobGlnaHQuT3V0bGluZUNvbG9yID0gQ29sb3IzLmZyb21SR0IoMCwgMCwgMjU1KQogICAgICAgICAgICBlbHNlCiAgICAgICAgICAgICAgICBoaWdobGlnaHQuRmlsbENvbG9yID0gQ29sb3IzLmZyb21SR0IoMjU1LCAyNTUsIDI1NSkKICAgICAgICAgICAgICAgIGhpZ2hsaWdodC5PdXRsaW5lQ29sb3IgPSBDb2xvcjMuZnJvbVJHQigyNTUsIDI1NSwgMjU1KQogICAgICAgICAgICBlbmQKICAgICAgICBlbmQKICAgIGVuZAplbmQKClJlcGxpY2F0ZWRTdG9yYWdlLkNoaWxkQWRkZWQ6Q29ubmVjdChmdW5jdGlvbihjaGlsZCkKICAgIGlmIGNoaWxkLk5hbWUgPT0gIlJvdW5kU3RhcnQiIHRoZW4KICAgICAgICB0YXNrLndhaXQoMykKICAgICAgICB1cGRhdGVFU1AoKQogICAgZW5kCmVuZCkKCk1haW5UYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiUm9sZSBFU1AiLAogICAgRGVmYXVsdCA9IGZhbHNlLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbihWYWx1ZSkKICAgICAgICBnZXRnZW52KCkuUm9sZUVTUCA9IFZhbHVlCiAgICAgICAgCiAgICAgICAgaWYgbm90IFZhbHVlIHRoZW4KICAgICAgICAgICAgZm9yIF8sIHBsYXllciBpbiBwYWlycyhQbGF5ZXJzOkdldFBsYXllcnMoKSkgZG8KICAgICAgICAgICAgICAgIGlmIHBsYXllci5DaGFyYWN0ZXIgdGhlbgogICAgICAgICAgICAgICAgICAgIGxvY2FsIGhpZ2hsaWdodCA9IHBsYXllci5DaGFyYWN0ZXI6RmluZEZpcnN0Q2hpbGQoIkhpZ2hsaWdodCIpCiAgICAgICAgICAgICAgICAgICAgaWYgaGlnaGxpZ2h0IHRoZW4KICAgICAgICAgICAgICAgICAgICAgICAgaGlnaGxpZ2h0OkRlc3Ryb3koKQogICAgICAgICAgICAgICAgICAgIGVuZAogICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIGVuZAogICAgICAgICAgICByZXR1cm4KICAgICAgICBlbmQKICAgICAgICAKICAgICAgICB3aGlsZSBnZXRnZW52KCkuUm9sZUVTUCBkbwogICAgICAgICAgICB1cGRhdGVFU1AoKQogICAgICAgICAgICB0YXNrLndhaXQoMC4xKQogICAgICAgIGVuZAogICAgZW5kCn0pCgpNYWluVGFiOkFkZFRvZ2dsZSh7CiAgICBOYW1lID0gIkNvaW4gTWFnbmV0IiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLkNvaW5NYWduZXQgPSBWYWx1ZQogICAgICAgIHdoaWxlIGdldGdlbnYoKS5Db2luTWFnbmV0IGRvCiAgICAgICAgICAgIGZvciBfLCBjb2luIGluIHBhaXJzKHdvcmtzcGFjZTpHZXREZXNjZW5kYW50cygpKSBkbwogICAgICAgICAgICAgICAgaWYgY29pbi5OYW1lID09ICJDb2luX1NlcnZlciIgYW5kIGNvaW46SXNBKCJQYXJ0IikgdGhlbgogICAgICAgICAgICAgICAgICAgIGNvaW4uQ0ZyYW1lID0gTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkUm9vdFBhcnQuQ0ZyYW1lCiAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIHRhc2sud2FpdCgpCiAgICAgICAgZW5kCiAgICBlbmQKfSkKCk1haW5UYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiQXV0byBDb2xsZWN0IEd1biIsCiAgICBEZWZhdWx0ID0gZmFsc2UsCiAgICBDYWxsYmFjayA9IGZ1bmN0aW9uKFZhbHVlKQogICAgICAgIGdldGdlbnYoKS5BdXRvR3VuID0gVmFsdWUKICAgICAgICB3aGlsZSBnZXRnZW52KCkuQXV0b0d1biBkbwogICAgICAgICAgICBmb3IgXywgaXRlbSBpbiBwYWlycyh3b3Jrc3BhY2U6R2V0RGVzY2VuZGFudHMoKSkgZG8KICAgICAgICAgICAgICAgIGlmIGl0ZW0uTmFtZSA9PSAiR3VuRHJvcCIgYW5kIGl0ZW06SXNBKCJQYXJ0IikgdGhlbgogICAgICAgICAgICAgICAgICAgIExvY2FsUGxheWVyLkNoYXJhY3Rlci5IdW1hbm9pZFJvb3RQYXJ0LkNGcmFtZSA9IGl0ZW0uQ0ZyYW1lCiAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIHRhc2sud2FpdCgpCiAgICAgICAgZW5kCiAgICBlbmQKfSkKCk1haW5UYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiS2lsbCBBdXJhIiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLktpbGxBdXJhID0gVmFsdWUKICAgICAgICB3aGlsZSBnZXRnZW52KCkuS2lsbEF1cmEgZG8KICAgICAgICAgICAgZm9yIF8sIHBsYXllciBpbiBwYWlycyhQbGF5ZXJzOkdldFBsYXllcnMoKSkgZG8KICAgICAgICAgICAgICAgIGlmIHBsYXllciB+PSBMb2NhbFBsYXllciBhbmQgcGxheWVyLkNoYXJhY3RlciBhbmQgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyIHRoZW4KICAgICAgICAgICAgICAgICAgICBsb2NhbCBkaXN0YW5jZSA9IChwbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkUm9vdFBhcnQuUG9zaXRpb24gLSBMb2NhbFBsYXllci5DaGFyYWN0ZXIuSHVtYW5vaWRSb290UGFydC5Qb3NpdGlvbikuTWFnbml0dWRlCiAgICAgICAgICAgICAgICAgICAgaWYgZGlzdGFuY2UgPD0gMTAgYW5kIExvY2FsUGxheWVyLkNoYXJhY3RlcjpGaW5kRmlyc3RDaGlsZCgiS25pZmUiKSB0aGVuCiAgICAgICAgICAgICAgICAgICAgICAgIGxvY2FsIGFyZ3MgPSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBbMV0gPSBwbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkUm9vdFBhcnQKICAgICAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgICAgICAgICBMb2NhbFBsYXllci5DaGFyYWN0ZXIuS25pZmUuU3RhYjpGaXJlU2VydmVyKHVucGFjayhhcmdzKSkKICAgICAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgICAgIGVuZAogICAgICAgICAgICBlbmQKICAgICAgICAgICAgdGFzay53YWl0KCkKICAgICAgICBlbmQKICAgIGVuZAp9KQoKTWFpblRhYjpBZGRUb2dnbGUoewogICAgTmFtZSA9ICJBdXRvIFByZWRpY3QgTXVyZGVyIiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLlByZWRpY3RNdXJkZXIgPSBWYWx1ZQogICAgICAgIHdoaWxlIGdldGdlbnYoKS5QcmVkaWN0TXVyZGVyIGRvCiAgICAgICAgICAgIGZvciBfLCBwbGF5ZXIgaW4gcGFpcnMoUGxheWVyczpHZXRQbGF5ZXJzKCkpIGRvCiAgICAgICAgICAgICAgICBpZiBwbGF5ZXIuQmFja3BhY2s6RmluZEZpcnN0Q2hpbGQoIktuaWZlIikgb3IgcGxheWVyLkNoYXJhY3RlciBhbmQgcGxheWVyLkNoYXJhY3RlcjpGaW5kRmlyc3RDaGlsZCgiS25pZmUiKSB0aGVuCiAgICAgICAgICAgICAgICAgICAgT3Jpb25MaWI6TWFrZU5vdGlmaWNhdGlvbih7CiAgICAgICAgICAgICAgICAgICAgICAgIE5hbWUgPSAiTXVyZGVyIEZvdW5kISIsCiAgICAgICAgICAgICAgICAgICAgICAgIENvbnRlbnQgPSBwbGF5ZXIuTmFtZSAuLiAiIGlzIHRoZSBNdXJkZXIhIiwKICAgICAgICAgICAgICAgICAgICAgICAgVGltZSA9IDUKICAgICAgICAgICAgICAgICAgICB9KQogICAgICAgICAgICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIHRhc2sud2FpdCgxKQogICAgICAgIGVuZAogICAgZW5kCn0pCgpNYWluVGFiOkFkZFRvZ2dsZSh7CiAgICBOYW1lID0gIkF1dG8gUHJlZGljdCBTaGVyaWZmIiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLlByZWRpY3RTaGVyaWZmID0gVmFsdWUKICAgICAgICB3aGlsZSBnZXRnZW52KCkuUHJlZGljdFNoZXJpZmYgZG8KICAgICAgICAgICAgZm9yIF8sIHBsYXllciBpbiBwYWlycyhQbGF5ZXJzOkdldFBsYXllcnMoKSkgZG8KICAgICAgICAgICAgICAgIGlmIHBsYXllci5CYWNrcGFjazpGaW5kRmlyc3RDaGlsZCgiR3VuIikgb3IgcGxheWVyLkNoYXJhY3RlciBhbmQgcGxheWVyLkNoYXJhY3RlcjpGaW5kRmlyc3RDaGlsZCgiR3VuIikgdGhlbgogICAgICAgICAgICAgICAgICAgIE9yaW9uTGliOk1ha2VOb3RpZmljYXRpb24oewogICAgICAgICAgICAgICAgICAgICAgICBOYW1lID0gIlNoZXJpZmYgRm91bmQhIiwKICAgICAgICAgICAgICAgICAgICAgICAgQ29udGVudCA9IHBsYXllci5OYW1lIC4uICIgaXMgdGhlIFNoZXJpZmYhIiwKICAgICAgICAgICAgICAgICAgICAgICAgVGltZSA9IDUKICAgICAgICAgICAgICAgICAgICB9KQogICAgICAgICAgICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIHRhc2sud2FpdCgxKQogICAgICAgIGVuZAogICAgZW5kCn0pCgpNYWluVGFiOkFkZFRvZ2dsZSh7CiAgICBOYW1lID0gIlRyYXAgRVNQIiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLlRyYXBFU1AgPSBWYWx1ZQogICAgICAgIHdoaWxlIGdldGdlbnYoKS5UcmFwRVNQIGRvCiAgICAgICAgICAgIGZvciBfLCB0cmFwIGluIHBhaXJzKHdvcmtzcGFjZTpHZXREZXNjZW5kYW50cygpKSBkbwogICAgICAgICAgICAgICAgaWYgdHJhcC5OYW1lID09ICJUcmFwIiBhbmQgdHJhcDpJc0EoIkJhc2VQYXJ0IikgdGhlbgogICAgICAgICAgICAgICAgICAgIGxvY2FsIGhpZ2hsaWdodCA9IHRyYXA6RmluZEZpcnN0Q2hpbGQoIkhpZ2hsaWdodCIpIG9yIEluc3RhbmNlLm5ldygiSGlnaGxpZ2h0IikKICAgICAgICAgICAgICAgICAgICBoaWdobGlnaHQuUGFyZW50ID0gdHJhcAogICAgICAgICAgICAgICAgICAgIGhpZ2hsaWdodC5GaWxsQ29sb3IgPSBDb2xvcjMuZnJvbVJHQigyNTUsIDAsIDApCiAgICAgICAgICAgICAgICAgICAgaGlnaGxpZ2h0Lk91dGxpbmVDb2xvciA9IENvbG9yMy5mcm9tUkdCKDI1NSwgMCwgMCkKICAgICAgICAgICAgICAgIGVuZAogICAgICAgICAgICBlbmQKICAgICAgICAgICAgdGFzay53YWl0KDAuNSkKICAgICAgICBlbmQKICAgIGVuZAp9KQoKTXVyZGVyVGFiOkFkZEJ1dHRvbih7CiAgICBOYW1lID0gIktpbGwgQWxsIChNdXN0IGJlIE11cmRlcikiLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbigpCiAgICAgICAgaWYgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyIGFuZCBMb2NhbFBsYXllci5DaGFyYWN0ZXI6RmluZEZpcnN0Q2hpbGQoIktuaWZlIikgdGhlbgogICAgICAgICAgICBsb2NhbCBvcmlnaW5hbFBvc2l0aW9uID0gTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkUm9vdFBhcnQuQ0ZyYW1lCiAgICAgICAgICAgIGZvciBfLCBwbGF5ZXIgaW4gcGFpcnMoUGxheWVyczpHZXRQbGF5ZXJzKCkpIGRvCiAgICAgICAgICAgICAgICBpZiBwbGF5ZXIgfj0gTG9jYWxQbGF5ZXIgYW5kIHBsYXllci5DaGFyYWN0ZXIgdGhlbgogICAgICAgICAgICAgICAgICAgIExvY2FsUGxheWVyLkNoYXJhY3Rlci5IdW1hbm9pZFJvb3RQYXJ0LkNGcmFtZSA9IHBsYXllci5DaGFyYWN0ZXIuSHVtYW5vaWRSb290UGFydC5DRnJhbWUKICAgICAgICAgICAgICAgICAgICBsb2NhbCBhcmdzID0ge1sxXSA9IHBsYXllci5DaGFyYWN0ZXIuSHVtYW5vaWRSb290UGFydH0KICAgICAgICAgICAgICAgICAgICBMb2NhbFBsYXllci5DaGFyYWN0ZXIuS25pZmUuU3RhYjpGaXJlU2VydmVyKHVucGFjayhhcmdzKSkKICAgICAgICAgICAgICAgICAgICB0YXNrLndhaXQoMC4xKQogICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIGVuZAogICAgICAgICAgICBMb2NhbFBsYXllci5DaGFyYWN0ZXIuSHVtYW5vaWRSb290UGFydC5DRnJhbWUgPSBvcmlnaW5hbFBvc2l0aW9uCiAgICAgICAgZW5kCiAgICBlbmQKfSkKCk11cmRlclRhYjpBZGRUb2dnbGUoewogICAgTmFtZSA9ICJBdXRvIEtpbGwgQWxsIiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLkF1dG9LaWxsQWxsID0gVmFsdWUKICAgICAgICB3aGlsZSBnZXRnZW52KCkuQXV0b0tpbGxBbGwgZG8KICAgICAgICAgICAgaWYgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyIGFuZCBMb2NhbFBsYXllci5DaGFyYWN0ZXI6RmluZEZpcnN0Q2hpbGQoIktuaWZlIikgdGhlbgogICAgICAgICAgICAgICAgbG9jYWwgb3JpZ2luYWxQb3NpdGlvbiA9IExvY2FsUGxheWVyLkNoYXJhY3Rlci5IdW1hbm9pZFJvb3RQYXJ0LkNGcmFtZQogICAgICAgICAgICAgICAgZm9yIF8sIHBsYXllciBpbiBwYWlycyhQbGF5ZXJzOkdldFBsYXllcnMoKSkgZG8KICAgICAgICAgICAgICAgICAgICBpZiBwbGF5ZXIgfj0gTG9jYWxQbGF5ZXIgYW5kIHBsYXllci5DaGFyYWN0ZXIgYW5kIHBsYXllci5DaGFyYWN0ZXI6RmluZEZpcnN0Q2hpbGQoIkh1bWFub2lkIikgYW5kIHBsYXllci5DaGFyYWN0ZXIuSHVtYW5vaWQuSGVhbHRoID4gMCB0aGVuCiAgICAgICAgICAgICAgICAgICAgICAgIExvY2FsUGxheWVyLkNoYXJhY3Rlci5IdW1hbm9pZFJvb3RQYXJ0LkNGcmFtZSA9IHBsYXllci5DaGFyYWN0ZXIuSHVtYW5vaWRSb290UGFydC5DRnJhbWUKICAgICAgICAgICAgICAgICAgICAgICAgbG9jYWwgYXJncyA9IHtbMV0gPSBwbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkUm9vdFBhcnR9CiAgICAgICAgICAgICAgICAgICAgICAgIExvY2FsUGxheWVyLkNoYXJhY3Rlci5LbmlmZS5TdGFiOkZpcmVTZXJ2ZXIodW5wYWNrKGFyZ3MpKQogICAgICAgICAgICAgICAgICAgICAgICB0YXNrLndhaXQoMC4xKQogICAgICAgICAgICAgICAgICAgIGVuZAogICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgICAgICBMb2NhbFBsYXllci5DaGFyYWN0ZXIuSHVtYW5vaWRSb290UGFydC5DRnJhbWUgPSBvcmlnaW5hbFBvc2l0aW9uCiAgICAgICAgICAgIGVuZAogICAgICAgICAgICB0YXNrLndhaXQoMC41KQogICAgICAgIGVuZAogICAgZW5kCn0pCgpNdXJkZXJUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiS25pZmUgUmFuZ2UgRXh0ZW5kZXIiLAogICAgRGVmYXVsdCA9IGZhbHNlLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbihWYWx1ZSkKICAgICAgICBnZXRnZW52KCkuS25pZmVSYW5nZSA9IFZhbHVlCiAgICAgICAgbG9jYWwgb2xkTmFtZWNhbGwKICAgICAgICBvbGROYW1lY2FsbCA9IGhvb2ttZXRhbWV0aG9kKGdhbWUsICJfX25hbWVjYWxsIiwgZnVuY3Rpb24oc2VsZiwgLi4uKQogICAgICAgICAgICBsb2NhbCBhcmdzID0gey4uLn0KICAgICAgICAgICAgbG9jYWwgbWV0aG9kID0gZ2V0bmFtZWNhbGxtZXRob2QoKQogICAgICAgICAgICAKICAgICAgICAgICAgaWYgZ2V0Z2VudigpLktuaWZlUmFuZ2UgYW5kIG1ldGhvZCA9PSAiRmlyZVNlcnZlciIgYW5kIHNlbGYuTmFtZSA9PSAiU3RhYiIgdGhlbgogICAgICAgICAgICAgICAgbG9jYWwgdGFyZ2V0ID0gYXJnc1sxXQogICAgICAgICAgICAgICAgaWYgdGFyZ2V0IGFuZCB0YXJnZXQ6SXNBKCJCYXNlUGFydCIpIHRoZW4KICAgICAgICAgICAgICAgICAgICByZXR1cm4gb2xkTmFtZWNhbGwoc2VsZiwgdW5wYWNrKGFyZ3MpKQogICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIGVuZAogICAgICAgICAgICByZXR1cm4gb2xkTmFtZWNhbGwoc2VsZiwgdW5wYWNrKGFyZ3MpKQogICAgICAgIGVuZCkKICAgIGVuZAp9KQoKTXVyZGVyVGFiOkFkZFRvZ2dsZSh7CiAgICBOYW1lID0gIktuaWZlIEF1cmEiLAogICAgRGVmYXVsdCA9IGZhbHNlLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbihWYWx1ZSkKICAgICAgICBnZXRnZW52KCkuS25pZmVBdXJhID0gVmFsdWUKICAgICAgICB3aGlsZSBnZXRnZW52KCkuS25pZmVBdXJhIGRvCiAgICAgICAgICAgIGlmIExvY2FsUGxheWVyLkNoYXJhY3RlciBhbmQgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyOkZpbmRGaXJzdENoaWxkKCJLbmlmZSIpIHRoZW4KICAgICAgICAgICAgICAgIGZvciBfLCBwbGF5ZXIgaW4gcGFpcnMoUGxheWVyczpHZXRQbGF5ZXJzKCkpIGRvCiAgICAgICAgICAgICAgICAgICAgaWYgcGxheWVyIH49IExvY2FsUGxheWVyIGFuZCBwbGF5ZXIuQ2hhcmFjdGVyIGFuZCAKICAgICAgICAgICAgICAgICAgICBwbGF5ZXIuQ2hhcmFjdGVyOkZpbmRGaXJzdENoaWxkKCJIdW1hbm9pZFJvb3RQYXJ0IikgdGhlbgogICAgICAgICAgICAgICAgICAgICAgICBsb2NhbCBhcmdzID0ge1sxXSA9IHBsYXllci5DaGFyYWN0ZXIuSHVtYW5vaWRSb290UGFydH0KICAgICAgICAgICAgICAgICAgICAgICAgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyLktuaWZlLlN0YWI6RmlyZVNlcnZlcih1bnBhY2soYXJncykpCiAgICAgICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIHRhc2sud2FpdCgwLjEpCiAgICAgICAgZW5kCiAgICBlbmQKfSkKClNoZXJpZmZUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiU2lsZW50IEFpbSIsCiAgICBEZWZhdWx0ID0gZmFsc2UsCiAgICBDYWxsYmFjayA9IGZ1bmN0aW9uKFZhbHVlKQogICAgICAgIGdldGdlbnYoKS5TaWxlbnRBaW0gPSBWYWx1ZQogICAgICAgIAogICAgICAgIGxvY2FsIG9sZE5hbWVjYWxsCiAgICAgICAgb2xkTmFtZWNhbGwgPSBob29rbWV0YW1ldGhvZChnYW1lLCAiX19uYW1lY2FsbCIsIGZ1bmN0aW9uKHNlbGYsIC4uLikKICAgICAgICAgICAgbG9jYWwgYXJncyA9IHsuLi59CiAgICAgICAgICAgIGxvY2FsIG1ldGhvZCA9IGdldG5hbWVjYWxsbWV0aG9kKCkKICAgICAgICAgICAgCiAgICAgICAgICAgIGlmIGdldGdlbnYoKS5TaWxlbnRBaW0gYW5kIG1ldGhvZCA9PSAiRmlyZVNlcnZlciIgYW5kIHNlbGYuTmFtZSA9PSAiU2hvb3RHdW4iIHRoZW4KICAgICAgICAgICAgICAgIGZvciBfLCBwbGF5ZXIgaW4gcGFpcnMoUGxheWVyczpHZXRQbGF5ZXJzKCkpIGRvCiAgICAgICAgICAgICAgICAgICAgaWYgcGxheWVyIH49IExvY2FsUGxheWVyIGFuZCBwbGF5ZXIuQ2hhcmFjdGVyIGFuZCAKICAgICAgICAgICAgICAgICAgICBwbGF5ZXIuQ2hhcmFjdGVyOkZpbmRGaXJzdENoaWxkKCJLbmlmZSIpIHRoZW4KICAgICAgICAgICAgICAgICAgICAgICAgYXJnc1sxXSA9IHBsYXllci5DaGFyYWN0ZXIuSHVtYW5vaWRSb290UGFydAogICAgICAgICAgICAgICAgICAgICAgICBicmVhawogICAgICAgICAgICAgICAgICAgIGVuZAogICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIGVuZAogICAgICAgICAgICAKICAgICAgICAgICAgcmV0dXJuIG9sZE5hbWVjYWxsKHNlbGYsIHVucGFjayhhcmdzKSkKICAgICAgICBlbmQpCiAgICBlbmQKfSkKClNoZXJpZmZUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiQXV0byBTaG9vdCBNdXJkZXIiLAogICAgRGVmYXVsdCA9IGZhbHNlLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbihWYWx1ZSkKICAgICAgICBnZXRnZW52KCkuQXV0b1Nob290TXVyZGVyID0gVmFsdWUKICAgICAgICB3aGlsZSBnZXRnZW52KCkuQXV0b1Nob290TXVyZGVyIGRvCiAgICAgICAgICAgIGlmIExvY2FsUGxheWVyLkNoYXJhY3RlciBhbmQgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyOkZpbmRGaXJzdENoaWxkKCJHdW4iKSB0aGVuCiAgICAgICAgICAgICAgICBmb3IgXywgcGxheWVyIGluIHBhaXJzKFBsYXllcnM6R2V0UGxheWVycygpKSBkbwogICAgICAgICAgICAgICAgICAgIGlmIHBsYXllciB+PSBMb2NhbFBsYXllciBhbmQgcGxheWVyLkNoYXJhY3RlciBhbmQgCiAgICAgICAgICAgICAgICAgICAgcGxheWVyLkNoYXJhY3RlcjpGaW5kRmlyc3RDaGlsZCgiS25pZmUiKSB0aGVuCiAgICAgICAgICAgICAgICAgICAgICAgIGxvY2FsIGFyZ3MgPSB7WzFdID0gcGxheWVyLkNoYXJhY3Rlci5IdW1hbm9pZFJvb3RQYXJ0fQogICAgICAgICAgICAgICAgICAgICAgICBMb2NhbFBsYXllci5DaGFyYWN0ZXIuR3VuLktuaWZlU2VydmVyLlNob290R3VuOkZpcmVTZXJ2ZXIodW5wYWNrKGFyZ3MpKQogICAgICAgICAgICAgICAgICAgICAgICBicmVhawogICAgICAgICAgICAgICAgICAgIGVuZAogICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIGVuZAogICAgICAgICAgICB0YXNrLndhaXQoMC4xKQogICAgICAgIGVuZAogICAgZW5kCn0pCgpTaGVyaWZmVGFiOkFkZFRvZ2dsZSh7CiAgICBOYW1lID0gIkd1biBSYW5nZSBFeHRlbmRlciIsCiAgICBEZWZhdWx0ID0gZmFsc2UsCiAgICBDYWxsYmFjayA9IGZ1bmN0aW9uKFZhbHVlKQogICAgICAgIGdldGdlbnYoKS5HdW5SYW5nZSA9IFZhbHVlCiAgICAgICAgbG9jYWwgb2xkTmFtZWNhbGwKICAgICAgICBvbGROYW1lY2FsbCA9IGhvb2ttZXRhbWV0aG9kKGdhbWUsICJfX25hbWVjYWxsIiwgZnVuY3Rpb24oc2VsZiwgLi4uKQogICAgICAgICAgICBsb2NhbCBhcmdzID0gey4uLn0KICAgICAgICAgICAgbG9jYWwgbWV0aG9kID0gZ2V0bmFtZWNhbGxtZXRob2QoKQogICAgICAgICAgICAKICAgICAgICAgICAgaWYgZ2V0Z2VudigpLkd1blJhbmdlIGFuZCBtZXRob2QgPT0gIkZpcmVTZXJ2ZXIiIGFuZCBzZWxmLk5hbWUgPT0gIlNob290R3VuIiB0aGVuCiAgICAgICAgICAgICAgICByZXR1cm4gb2xkTmFtZWNhbGwoc2VsZiwgdW5wYWNrKGFyZ3MpKQogICAgICAgICAgICBlbmQKICAgICAgICAgICAgcmV0dXJuIG9sZE5hbWVjYWxsKHNlbGYsIHVucGFjayhhcmdzKSkKICAgICAgICBlbmQpCiAgICBlbmQKfSkKClNoZXJpZmZUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiUmFwaWQgRmlyZSIsCiAgICBEZWZhdWx0ID0gZmFsc2UsCiAgICBDYWxsYmFjayA9IGZ1bmN0aW9uKFZhbHVlKQogICAgICAgIGdldGdlbnYoKS5SYXBpZEZpcmUgPSBWYWx1ZQogICAgICAgIHdoaWxlIGdldGdlbnYoKS5SYXBpZEZpcmUgZG8KICAgICAgICAgICAgaWYgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyIGFuZCBMb2NhbFBsYXllci5DaGFyYWN0ZXI6RmluZEZpcnN0Q2hpbGQoIkd1biIpIHRoZW4KICAgICAgICAgICAgICAgIGZvciBfLCBwbGF5ZXIgaW4gcGFpcnMoUGxheWVyczpHZXRQbGF5ZXJzKCkpIGRvCiAgICAgICAgICAgICAgICAgICAgaWYgcGxheWVyIH49IExvY2FsUGxheWVyIGFuZCBwbGF5ZXIuQ2hhcmFjdGVyIHRoZW4KICAgICAgICAgICAgICAgICAgICAgICAgbG9jYWwgYXJncyA9IHtbMV0gPSBwbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkUm9vdFBhcnR9CiAgICAgICAgICAgICAgICAgICAgICAgIExvY2FsUGxheWVyLkNoYXJhY3Rlci5HdW4uS25pZmVTZXJ2ZXIuU2hvb3RHdW46RmlyZVNlcnZlcih1bnBhY2soYXJncykpCiAgICAgICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIHRhc2sud2FpdCgwLjEpCiAgICAgICAgZW5kCiAgICBlbmQKfSkKClNoZXJpZmZUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiQXV0byBSZWxvYWQiLAogICAgRGVmYXVsdCA9IGZhbHNlLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbihWYWx1ZSkKICAgICAgICBnZXRnZW52KCkuQXV0b1JlbG9hZCA9IFZhbHVlCiAgICAgICAgd2hpbGUgZ2V0Z2VudigpLkF1dG9SZWxvYWQgZG8KICAgICAgICAgICAgaWYgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyIGFuZCBMb2NhbFBsYXllci5DaGFyYWN0ZXI6RmluZEZpcnN0Q2hpbGQoIkd1biIpIHRoZW4KICAgICAgICAgICAgICAgIExvY2FsUGxheWVyLkNoYXJhY3Rlci5HdW4uS25pZmVTZXJ2ZXIuUmVsb2FkOkZpcmVTZXJ2ZXIoKQogICAgICAgICAgICBlbmQKICAgICAgICAgICAgdGFzay53YWl0KDAuNSkKICAgICAgICBlbmQKICAgIGVuZAp9KQoKU2hlcmlmZlRhYjpBZGRUb2dnbGUoewogICAgTmFtZSA9ICJXYWxsYmFuZyIsCiAgICBEZWZhdWx0ID0gZmFsc2UsCiAgICBDYWxsYmFjayA9IGZ1bmN0aW9uKFZhbHVlKQogICAgICAgIGdldGdlbnYoKS5XYWxsYmFuZyA9IFZhbHVlCiAgICAgICAgbG9jYWwgb2xkTmFtZWNhbGwKICAgICAgICBvbGROYW1lY2FsbCA9IGhvb2ttZXRhbWV0aG9kKGdhbWUsICJfX25hbWVjYWxsIiwgZnVuY3Rpb24oc2VsZiwgLi4uKQogICAgICAgICAgICBsb2NhbCBhcmdzID0gey4uLn0KICAgICAgICAgICAgbG9jYWwgbWV0aG9kID0gZ2V0bmFtZWNhbGxtZXRob2QoKQogICAgICAgICAgICAKICAgICAgICAgICAgaWYgZ2V0Z2VudigpLldhbGxiYW5nIGFuZCBtZXRob2QgPT0gIkZpcmVTZXJ2ZXIiIGFuZCBzZWxmLk5hbWUgPT0gIlNob290R3VuIiB0aGVuCiAgICAgICAgICAgICAgICByZXR1cm4gb2xkTmFtZWNhbGwoc2VsZiwgdW5wYWNrKGFyZ3MpKQogICAgICAgICAgICBlbmQKICAgICAgICAgICAgcmV0dXJuIG9sZE5hbWVjYWxsKHNlbGYsIHVucGFjayhhcmdzKSkKICAgICAgICBlbmQpCiAgICBlbmQKfSkKClNoZXJpZmZUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiQXV0byBMb2NrIE11cmRlciIsCiAgICBEZWZhdWx0ID0gZmFsc2UsCiAgICBDYWxsYmFjayA9IGZ1bmN0aW9uKFZhbHVlKQogICAgICAgIGdldGdlbnYoKS5Mb2NrTXVyZGVyID0gVmFsdWUKICAgICAgICB3aGlsZSBnZXRnZW52KCkuTG9ja011cmRlciBkbwogICAgICAgICAgICBpZiBMb2NhbFBsYXllci5DaGFyYWN0ZXIgYW5kIExvY2FsUGxheWVyLkNoYXJhY3RlcjpGaW5kRmlyc3RDaGlsZCgiR3VuIikgdGhlbgogICAgICAgICAgICAgICAgZm9yIF8sIHBsYXllciBpbiBwYWlycyhQbGF5ZXJzOkdldFBsYXllcnMoKSkgZG8KICAgICAgICAgICAgICAgICAgICBpZiBwbGF5ZXIgfj0gTG9jYWxQbGF5ZXIgYW5kIHBsYXllci5DaGFyYWN0ZXIgYW5kIAogICAgICAgICAgICAgICAgICAgIChwbGF5ZXIuQmFja3BhY2s6RmluZEZpcnN0Q2hpbGQoIktuaWZlIikgb3IgcGxheWVyLkNoYXJhY3RlcjpGaW5kRmlyc3RDaGlsZCgiS25pZmUiKSkgdGhlbgogICAgICAgICAgICAgICAgICAgICAgICBMb2NhbFBsYXllci5DaGFyYWN0ZXIuSHVtYW5vaWRSb290UGFydC5DRnJhbWUgPSBwbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkUm9vdFBhcnQuQ0ZyYW1lICogQ0ZyYW1lLm5ldygwLCAwLCA1KQogICAgICAgICAgICAgICAgICAgICAgICBicmVhawogICAgICAgICAgICAgICAgICAgIGVuZAogICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIGVuZAogICAgICAgICAgICB0YXNrLndhaXQoMC4xKQogICAgICAgIGVuZAogICAgZW5kCn0pCgpQbGF5ZXJUYWI6QWRkU2xpZGVyKHsKICAgIE5hbWUgPSAiV2FsayBTcGVlZCIsCiAgICBNaW4gPSAxNiwKICAgIE1heCA9IDUwMCwKICAgIERlZmF1bHQgPSAxNiwKICAgIEluY3JlbWVudCA9IDEsCiAgICBWYWx1ZU5hbWUgPSAiU3BlZWQiLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbihWYWx1ZSkKICAgICAgICBpZiBMb2NhbFBsYXllci5DaGFyYWN0ZXIgYW5kIExvY2FsUGxheWVyLkNoYXJhY3RlcjpGaW5kRmlyc3RDaGlsZCgiSHVtYW5vaWQiKSB0aGVuCiAgICAgICAgICAgIExvY2FsUGxheWVyLkNoYXJhY3Rlci5IdW1hbm9pZC5XYWxrU3BlZWQgPSBWYWx1ZQogICAgICAgIGVuZAogICAgZW5kCn0pCgpQbGF5ZXJUYWI6QWRkU2xpZGVyKHsKICAgIE5hbWUgPSAiSnVtcCBQb3dlciIsCiAgICBNaW4gPSA1MCwKICAgIE1heCA9IDUwMCwKICAgIERlZmF1bHQgPSA1MCwKICAgIEluY3JlbWVudCA9IDEsCiAgICBWYWx1ZU5hbWUgPSAiUG93ZXIiLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbihWYWx1ZSkKICAgICAgICBpZiBMb2NhbFBsYXllci5DaGFyYWN0ZXIgYW5kIExvY2FsUGxheWVyLkNoYXJhY3RlcjpGaW5kRmlyc3RDaGlsZCgiSHVtYW5vaWQiKSB0aGVuCiAgICAgICAgICAgIExvY2FsUGxheWVyLkNoYXJhY3Rlci5IdW1hbm9pZC5KdW1wUG93ZXIgPSBWYWx1ZQogICAgICAgIGVuZAogICAgZW5kCn0pCgpQbGF5ZXJUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiTm9jbGlwIiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLk5vY2xpcCA9IFZhbHVlCiAgICAgICAgZ2FtZTpHZXRTZXJ2aWNlKCJSdW5TZXJ2aWNlIikuU3RlcHBlZDpDb25uZWN0KGZ1bmN0aW9uKCkKICAgICAgICAgICAgaWYgZ2V0Z2VudigpLk5vY2xpcCB0aGVuCiAgICAgICAgICAgICAgICBmb3IgXywgcGFydCBpbiBwYWlycyhMb2NhbFBsYXllci5DaGFyYWN0ZXI6R2V0RGVzY2VuZGFudHMoKSkgZG8KICAgICAgICAgICAgICAgICAgICBpZiBwYXJ0OklzQSgiQmFzZVBhcnQiKSB0aGVuCiAgICAgICAgICAgICAgICAgICAgICAgIHBhcnQuQ2FuQ29sbGlkZSA9IGZhbHNlCiAgICAgICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgZW5kCiAgICAgICAgZW5kKQogICAgZW5kCn0pCgpQbGF5ZXJUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiR29kIE1vZGUiLAogICAgRGVmYXVsdCA9IGZhbHNlLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbihWYWx1ZSkKICAgICAgICBnZXRnZW52KCkuR29kTW9kZSA9IFZhbHVlCiAgICAgICAgd2hpbGUgZ2V0Z2VudigpLkdvZE1vZGUgZG8KICAgICAgICAgICAgaWYgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyIGFuZCBMb2NhbFBsYXllci5DaGFyYWN0ZXI6RmluZEZpcnN0Q2hpbGQoIkh1bWFub2lkIikgdGhlbgogICAgICAgICAgICAgICAgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkLk1heEhlYWx0aCA9IG1hdGguaHVnZQogICAgICAgICAgICAgICAgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkLkhlYWx0aCA9IG1hdGguaHVnZQogICAgICAgICAgICBlbmQKICAgICAgICAgICAgdGFzay53YWl0KCkKICAgICAgICBlbmQKICAgIGVuZAp9KQoKUGxheWVyVGFiOkFkZFRvZ2dsZSh7CiAgICBOYW1lID0gIkluZmluaXRlIEp1bXAiLAogICAgRGVmYXVsdCA9IGZhbHNlLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbihWYWx1ZSkKICAgICAgICBnZXRnZW52KCkuSW5maW5pdGVKdW1wID0gVmFsdWUKICAgICAgICBVc2VySW5wdXRTZXJ2aWNlLkp1bXBSZXF1ZXN0OkNvbm5lY3QoZnVuY3Rpb24oKQogICAgICAgICAgICBpZiBnZXRnZW52KCkuSW5maW5pdGVKdW1wIHRoZW4KICAgICAgICAgICAgICAgIExvY2FsUGxheWVyLkNoYXJhY3Rlci5IdW1hbm9pZDpDaGFuZ2VTdGF0ZSgiSnVtcGluZyIpCiAgICAgICAgICAgIGVuZAogICAgICAgIGVuZCkKICAgIGVuZAp9KQoKUGxheWVyVGFiOkFkZFRvZ2dsZSh7CiAgICBOYW1lID0gIkFudGkgUmFnZG9sbCIsCiAgICBEZWZhdWx0ID0gZmFsc2UsCiAgICBDYWxsYmFjayA9IGZ1bmN0aW9uKFZhbHVlKQogICAgICAgIGdldGdlbnYoKS5BbnRpUmFnZG9sbCA9IFZhbHVlCiAgICAgICAgd2hpbGUgZ2V0Z2VudigpLkFudGlSYWdkb2xsIGRvCiAgICAgICAgICAgIGlmIExvY2FsUGxheWVyLkNoYXJhY3RlciB0aGVuCiAgICAgICAgICAgICAgICBmb3IgXywgdiBpbiBwYWlycyhMb2NhbFBsYXllci5DaGFyYWN0ZXI6R2V0Q2hpbGRyZW4oKSkgZG8KICAgICAgICAgICAgICAgICAgICBpZiB2Lk5hbWUgPT0gIlJhZ2RvbGxlZCIgdGhlbgogICAgICAgICAgICAgICAgICAgICAgICB2OkRlc3Ryb3koKQogICAgICAgICAgICAgICAgICAgIGVuZAogICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIGVuZAogICAgICAgICAgICB0YXNrLndhaXQoKQogICAgICAgIGVuZAogICAgZW5kCn0pCgpQbGF5ZXJUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiQXV0byBTcHJpbnQiLAogICAgRGVmYXVsdCA9IGZhbHNlLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbihWYWx1ZSkKICAgICAgICBnZXRnZW52KCkuQXV0b1NwcmludCA9IFZhbHVlCiAgICAgICAgd2hpbGUgZ2V0Z2VudigpLkF1dG9TcHJpbnQgZG8KICAgICAgICAgICAgaWYgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyIGFuZCBMb2NhbFBsYXllci5DaGFyYWN0ZXI6RmluZEZpcnN0Q2hpbGQoIkh1bWFub2lkIikgdGhlbgogICAgICAgICAgICAgICAgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkLldhbGtTcGVlZCA9IDI0CiAgICAgICAgICAgIGVuZAogICAgICAgICAgICB0YXNrLndhaXQoKQogICAgICAgIGVuZAogICAgZW5kCn0pCgpQbGF5ZXJUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiQW50aSBTdHVuIiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLkFudGlTdHVuID0gVmFsdWUKICAgICAgICB3aGlsZSBnZXRnZW52KCkuQW50aVN0dW4gZG8KICAgICAgICAgICAgaWYgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyIHRoZW4KICAgICAgICAgICAgICAgIGZvciBfLCB2IGluIHBhaXJzKExvY2FsUGxheWVyLkNoYXJhY3RlcjpHZXRDaGlsZHJlbigpKSBkbwogICAgICAgICAgICAgICAgICAgIGlmIHYuTmFtZSA9PSAiU3R1bm5lZCIgdGhlbgogICAgICAgICAgICAgICAgICAgICAgICB2OkRlc3Ryb3koKQogICAgICAgICAgICAgICAgICAgIGVuZAogICAgICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIGVuZAogICAgICAgICAgICB0YXNrLndhaXQoKQogICAgICAgIGVuZAogICAgZW5kCn0pCgpQbGF5ZXJUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiQW50aSBUcmFwIiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLkFudGlUcmFwID0gVmFsdWUKICAgICAgICB3aGlsZSBnZXRnZW52KCkuQW50aVRyYXAgZG8KICAgICAgICAgICAgaWYgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyIHRoZW4KICAgICAgICAgICAgICAgIGZvciBfLCB2IGluIHBhaXJzKHdvcmtzcGFjZTpHZXREZXNjZW5kYW50cygpKSBkbwogICAgICAgICAgICAgICAgICAgIGlmIHYuTmFtZSA9PSAiVHJhcCIgYW5kIHY6SXNBKCJCYXNlUGFydCIpIHRoZW4KICAgICAgICAgICAgICAgICAgICAgICAgdjpEZXN0cm95KCkKICAgICAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgICAgIGVuZAogICAgICAgICAgICBlbmQKICAgICAgICAgICAgdGFzay53YWl0KCkKICAgICAgICBlbmQKICAgIGVuZAp9KQoKVGVsZXBvcnRzVGFiOkFkZEJ1dHRvbih7CiAgICBOYW1lID0gIlRlbGVwb3J0IHRvIExvYmJ5IiwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oKQogICAgICAgIGlmIHdvcmtzcGFjZTpGaW5kRmlyc3RDaGlsZCgiTG9iYnkiKSB0aGVuCiAgICAgICAgICAgIExvY2FsUGxheWVyLkNoYXJhY3Rlci5IdW1hbm9pZFJvb3RQYXJ0LkNGcmFtZSA9IHdvcmtzcGFjZS5Mb2JieS5TcGF3bnMuU3Bhd24uQ0ZyYW1lCiAgICAgICAgZW5kCiAgICBlbmQKfSkKClRlbGVwb3J0c1RhYjpBZGRCdXR0b24oewogICAgTmFtZSA9ICJUZWxlcG9ydCB0byBNYXAiLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbigpCiAgICAgICAgaWYgd29ya3NwYWNlOkZpbmRGaXJzdENoaWxkKCJNYXAiKSB0aGVuCiAgICAgICAgICAgIExvY2FsUGxheWVyLkNoYXJhY3Rlci5IdW1hbm9pZFJvb3RQYXJ0LkNGcmFtZSA9IHdvcmtzcGFjZS5NYXAuU3Bhd25zLlNwYXduLkNGcmFtZQogICAgICAgIGVuZAogICAgZW5kCn0pCgpFeHBsb2l0c1RhYjpBZGRUb2dnbGUoewogICAgTmFtZSA9ICJHcmFiIEd1biBUaHJvdWdoIFdhbGxzIiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLkdyYWJHdW5UaHJvdWdoV2FsbHMgPSBWYWx1ZQogICAgICAgIHdoaWxlIGdldGdlbnYoKS5HcmFiR3VuVGhyb3VnaFdhbGxzIGRvCiAgICAgICAgICAgIGZvciBfLCBpdGVtIGluIHBhaXJzKHdvcmtzcGFjZTpHZXREZXNjZW5kYW50cygpKSBkbwogICAgICAgICAgICAgICAgaWYgaXRlbS5OYW1lID09ICJHdW5Ecm9wIiBhbmQgaXRlbTpJc0EoIlBhcnQiKSB0aGVuCiAgICAgICAgICAgICAgICAgICAgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkUm9vdFBhcnQuQ0ZyYW1lID0gaXRlbS5DRnJhbWUKICAgICAgICAgICAgICAgICAgICB0YXNrLndhaXQoMC4xKQogICAgICAgICAgICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIHRhc2sud2FpdCgpCiAgICAgICAgZW5kCiAgICBlbmQKfSkKCkV4cGxvaXRzVGFiOkFkZFRvZ2dsZSh7CiAgICBOYW1lID0gIkF1dG8gR3JhYiBEcm9wcGVkIEtuaWZlIiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLkdyYWJLbmlmZSA9IFZhbHVlCiAgICAgICAgd2hpbGUgZ2V0Z2VudigpLkdyYWJLbmlmZSBkbwogICAgICAgICAgICBmb3IgXywgaXRlbSBpbiBwYWlycyh3b3Jrc3BhY2U6R2V0RGVzY2VuZGFudHMoKSkgZG8KICAgICAgICAgICAgICAgIGlmIGl0ZW0uTmFtZSA9PSAiS25pZmVEcm9wIiBhbmQgaXRlbTpJc0EoIlBhcnQiKSB0aGVuCiAgICAgICAgICAgICAgICAgICAgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkUm9vdFBhcnQuQ0ZyYW1lID0gaXRlbS5DRnJhbWUKICAgICAgICAgICAgICAgICAgICB0YXNrLndhaXQoMC4xKQogICAgICAgICAgICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIHRhc2sud2FpdCgpCiAgICAgICAgZW5kCiAgICBlbmQKfSkKClZpc3VhbHNUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiWC1SYXkiLAogICAgRGVmYXVsdCA9IGZhbHNlLAogICAgQ2FsbGJhY2sgPSBmdW5jdGlvbihWYWx1ZSkKICAgICAgICBmb3IgXywgcGFydCBpbiBwYWlycyh3b3Jrc3BhY2U6R2V0RGVzY2VuZGFudHMoKSkgZG8KICAgICAgICAgICAgaWYgcGFydDpJc0EoIkJhc2VQYXJ0IikgdGhlbgogICAgICAgICAgICAgICAgcGFydC5Mb2NhbFRyYW5zcGFyZW5jeU1vZGlmaWVyID0gVmFsdWUgYW5kIDAuNSBvciAwCiAgICAgICAgICAgIGVuZAogICAgICAgIGVuZAogICAgZW5kCn0pCgpFeHBsb2l0c1RhYjpBZGRUb2dnbGUoewogICAgTmFtZSA9ICJBdXRvIFdpbiAoQ29pbiBGYXJtKSIsCiAgICBEZWZhdWx0ID0gZmFsc2UsCiAgICBDYWxsYmFjayA9IGZ1bmN0aW9uKFZhbHVlKQogICAgICAgIGdldGdlbnYoKS5BdXRvV2luID0gVmFsdWUKICAgICAgICB3aGlsZSBnZXRnZW52KCkuQXV0b1dpbiBkbwogICAgICAgICAgICBpZiB3b3Jrc3BhY2U6RmluZEZpcnN0Q2hpbGQoIkNvaW5Db250YWluZXIiKSB0aGVuCiAgICAgICAgICAgICAgICBmb3IgXywgY29pbiBpbiBwYWlycyh3b3Jrc3BhY2UuQ29pbkNvbnRhaW5lcjpHZXRDaGlsZHJlbigpKSBkbwogICAgICAgICAgICAgICAgICAgIGlmIGNvaW46SXNBKCJQYXJ0IikgdGhlbgogICAgICAgICAgICAgICAgICAgICAgICBMb2NhbFBsYXllci5DaGFyYWN0ZXIuSHVtYW5vaWRSb290UGFydC5DRnJhbWUgPSBjb2luLkNGcmFtZQogICAgICAgICAgICAgICAgICAgICAgICB3YWl0KDAuMSkKICAgICAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgICAgIGVuZAogICAgICAgICAgICBlbmQKICAgICAgICAgICAgdGFzay53YWl0KCkKICAgICAgICBlbmQKICAgIGVuZAp9KQoKRXhwbG9pdHNUYWI6QWRkVG9nZ2xlKHsKICAgIE5hbWUgPSAiQXV0byBHcmFiIERyb3BwZWQgR3VuIiwKICAgIERlZmF1bHQgPSBmYWxzZSwKICAgIENhbGxiYWNrID0gZnVuY3Rpb24oVmFsdWUpCiAgICAgICAgZ2V0Z2VudigpLkdyYWJHdW4gPSBWYWx1ZQogICAgICAgIHdoaWxlIGdldGdlbnYoKS5HcmFiR3VuIGRvCiAgICAgICAgICAgIGZvciBfLCBpdGVtIGluIHBhaXJzKHdvcmtzcGFjZTpHZXREZXNjZW5kYW50cygpKSBkbwogICAgICAgICAgICAgICAgaWYgaXRlbS5OYW1lID09ICJHdW5Ecm9wIiBhbmQgaXRlbTpJc0EoIlBhcnQiKSB0aGVuCiAgICAgICAgICAgICAgICAgICAgTG9jYWxQbGF5ZXIuQ2hhcmFjdGVyLkh1bWFub2lkUm9vdFBhcnQuQ0ZyYW1lID0gaXRlbS5DRnJhbWUKICAgICAgICAgICAgICAgICAgICB0YXNrLndhaXQoMC4xKQogICAgICAgICAgICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgICAgICBlbmQKICAgICAgICAgICAgZW5kCiAgICAgICAgICAgIHRhc2sud2FpdCgpCiAgICAgICAgZW5kCiAgICBlbmQKfSkKCgpPcmlvbkxpYjpJbml0KCkK
]]))()