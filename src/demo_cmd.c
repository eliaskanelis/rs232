
/**************************************************

file: demo_cmd.c
purpose: simple demo that sends a command to a microcontroller in ttyACM0 port
exit the program by pressing Ctrl-C

**************************************************/

#include <stdlib.h>
#include <stdio.h>

#ifdef _WIN32
#include <Windows.h>
#else
#include <unistd.h>
#endif

#include "rs232.h"



int main( int argc, char **argv )
{
	(void)argc;				/* Make compiler happy */

	int i, n,
		cport_nr=24,       /* /dev/ttyACMO (Linux) */
		bdrate=115200;     /* baud */

	unsigned char buf[4096];

	char mode[]={'8','N','1',0};


	if(RS232_OpenComport(cport_nr, bdrate, mode))
	{
		printf("Can not open comport\n");

		return(0);
	}

	if( argv[1] != NULL )
	{
		RS232_cputs(cport_nr, argv[1] );
		RS232_cputs(cport_nr, "\n" );
	}

	int got_data = 0;
	do
	{
		n = RS232_PollComport(cport_nr, buf, 4095);

		if(n > 0)
		{
			buf[n] = 0;   /* always put a "null" at the end of a string! */

			for(i=0; i < n; i++)
			{
			/*	if(buf[i] < 32)   //replace unreadable control-codes by dots 
			{
				buf[i] = '.';
			}*/
			}

			//printf("received %i bytes: %s\n", n, (char *)buf);
			printf("%s", (char *)buf);
			got_data = 1;
		}

#ifdef _WIN32
	Sleep(100);
#else
	usleep(100000);  /* sleep for 100 milliSeconds */
#endif
	}
	while(!got_data);

	RS232_CloseComport(cport_nr);

	return(0);
}

