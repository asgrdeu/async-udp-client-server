#include <iostream>

#include <boost/asio.hpp>

std::string paramof(std::string pname, int argc, char *argv[]) {
	for (int i = 0; i < argc; i++) {
		if (!strcmp(pname.c_str(), static_cast<const char*>(argv[i])))
			return argv[i + 1];	
	}
	return std::string();	
}

using namespace boost::asio;

io_service service;

void handle_connections() {
	using namespace ip;

	char buff[1024];
	udp::socket sock(service, udp::endpoint(udp::v4(), 8001));
	
	while(true) {
		udp::endpoint sender_ep;
		int bytes = sock.receive_from(buffer(buff), sender_ep);
		std::string msg(buff, bytes);
		sock.send_to(buffer(msg), sender_ep);
	}	
}

int main(int argc, char *argv[]) {
	handle_connections();	
	return 0;
}
