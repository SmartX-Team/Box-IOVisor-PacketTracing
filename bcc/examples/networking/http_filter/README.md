---
### Additional Implementation by Taekho Nam
I upgraded the previous source code to trace more information about http packets. The previous code provides only http packet action(type) for example, GET, HTTP and so on. But I need to have more information about packets. So I implemented some function in the previous source code. Following lists are additional functions.

1. IP version
2. Source IP Address
3. Destination IP Address
4. Destination Port #


As a result, when you run **http-parse-simple.py**, you can see more information about http packets.

### Caution
If you can see following warning message when you execute ```http-parse-simple.py```, you have to change 133th line of the ```/usr/src/linux-headers-4.5.1-040501/include/linux/huge_mm.h``` file.


↓↓↓ Following is the official document about **http-filter** ↓↓↓

---

# HTTP Filter

eBPF application that parses HTTP packets and extracts (and prints on screen) the URL contained in the GET/POST request.

[eBPF HTTP Filter - Short Presentation](https://github.com/iovisor/bpf-docs/blob/master/ebpf_http_filter.pdf)

## Usage Example


    $ sudo python http-parse-complete.py 
    GET /pipermail/iovisor-dev/ HTTP/1.1
    HTTP/1.1 200 OK
    GET /favicon.ico HTTP/1.1
    HTTP/1.1 404 Not Found
    GET /pipermail/iovisor-dev/2016-January/thread.html HTTP/1.1
    HTTP/1.1 200 OK
    GET /pipermail/iovisor-dev/2016-January/000046.html HTTP/1.1
    HTTP/1.1 200 OK


## Implementation overview

The implementation is split in two portions: the former that exploits eBPF code, the latter that performs some additional processing in user space (the python wrapper).

### First part: eBPF filter
This component filters IP and TCP packets containing the "HTTP", "GET", "POST" strings in their payload and all subsequent packets belonging to the same session, having the same (ip.src,ip.dst,port.src,port.dst) tuple.

The program is loaded as PROG_TYPE_SOCKET_FILTER and attached to a socket, bind to eth0.

Matching packets are forwarded to user space, the others are dropped by the filter.

### Second part: python code in user space
The Python script reads filtered raw packets from the socket, if necessary reassembles packets belonging to the same session, and prints on stdout the first line of the HTTP GET/POST request.

## Simple vs. complete

Two versions of this code are available in this repository:

* simple version: it does not handle URLs that span across multiple packets. For instance, if the URL is too long it shows only the portion contained in the first packet.
* complete version: it is able to cope with URLs spanning across multiple packets; if such a situation is detected, the code reassembles packets belonging to the same session and prints the complete URL.

## How to execute this sample

This sample can be executed by typing either one the two commands below:
 
    $ sudo python http-parse-simple.py
    $ sudo python http-parse-complete.py
