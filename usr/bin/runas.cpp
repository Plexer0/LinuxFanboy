#include <iostream>
int main()
{
	char user = system("echo -n $USER");
	std::cout << user << " is wasting their time running silly Windows commands. This incident will be reported to Tux.\n";
}
