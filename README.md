### Multiplatform RS232 C driver

### Description

> RS-232 for Linux, FreeBSD and windows

Credits to original author: Teunis van Beelen
Taken from http://www.teuniz.net/RS-232/

Here you can find code to use the serial port.
It has been tested with GCC on Linux and Mingw-w64 on Windows.
Handshaking or flowcontrol is not supported.
It uses polling to receive characters from the serial port.
Interrupt/event-based is not supported.

### Dependencies:

Workd on Linux/BSD or Windows

### How to build

```sh
make
```

### Maintainer

[Kanelis Ilias](mailto:hkanelhs@yahoo.gr)

### License

[GPL](LICENSE) © Kanelis Ilias