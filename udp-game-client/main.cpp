#include <boost/asio.hpp>
#include <boost/thread.hpp>

#include <iostream>

using namespace boost::asio;

io_service service;
ip::udp::endpoint ep(ip::address::from_string("127.0.0.1"), 8001);

void sync_echo(std::string msg) {
	using namespace ip;
	
	udp::socket sock(service, udp::endpoint(udp::v4(), 0));

	sock.send_to(buffer(msg), ep);

	char buff[1024];
	udp::endpoint sender_ep;
	int bytes = sock.receive_from(buffer(buff), sender_ep);
	std::string copy(buff, bytes);

	std::cout 
		<< "Server echoed our " << msg << ": "
		<< (copy == msg ? "OK" : "FAIL") << std::endl;
	
	sock.close();
}

int main(void) {
	std::string msgs[] = {
		"Hello, Bobby",
		"Hello, Mary",
		"Hello, Tolya"
	};
	boost::thread_group threads;

	for (auto msg : msgs) {
		threads.create_thread(boost::bind(sync_echo, msg.c_str()));
		boost::this_thread::sleep(boost::posix_time::millisec(100));
	}	

	threads.join_all();	
	return 0;
}
