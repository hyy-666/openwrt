module("luci.controller.qBittorrent-Enhanced-Edition",package.seeall)

function index()
  if not nixio.fs.access("/etc/config/qBittorrentEE")then
    return
  end
  entry({"admin","nas","qBittorrent-Enhanced-Edition"},cbi("qbittorrentEE"),_("qbittorrentEE"))
  entry({"admin","nas","qBittorrent-Enhanced-Edition","status"},call("act_status")).leaf=true
end

function act_status()
  local e={}
  e.running=luci.sys.call("pgrep qBittorrentEE-nox >/dev/null")==0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
