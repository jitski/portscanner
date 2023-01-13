import os
import net

fn main(){
    mut remote_ip := " "
    remote_ip = os.args[1]
    ports := {'ftp':21, 'ssh':22, 'telnet':23, 'http':80, 'https':443, 'openvpn':1194, 'wireguard':51820, 'git':9418, 'rtsp':554, 'mysql':3306, 'bgp':179, 'snmp':161, 'smb':445,'postgreql':5432,'dns':53}
    for service, value in ports {

        mut conn := net.dial_tcp("$remote_ip:$value") or { continue }
        if ip := conn.peer_ip() {
            println("Port: $value is open - protocol: $service")
        } else {

        }

        conn.close() or {}
    }
}
