from rplidar import RPLidar
print('starting script')
PORT_NAME = '/dev/ttyUSB0'
lidar = RPLidar(PORT_NAME)
info = lidar.get_info()
print(info)
print('hello')
try:
    for i, scan in enumerate(lidar.iter_scans()):
        print('%d: Got %d measurments' % (i, len(scan)))
        if i > 10:
            break
except KeyboardInterrupt:
    print('Stoping.')