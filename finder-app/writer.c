#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <string.h>

int main(int argc, char* argv[]) {
    openlog("FileWriter", LOG_CONS | LOG_PID, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Error: Insufficient arguments. Usage: %s <writefile> <writestr>", argv[0]);
        closelog();
        exit(1);
    }

    char* writefile = argv[1];
    char* writestr = argv[2];

    // Check if writefile and writestr are not empty
    if (strlen(writefile) == 0 || strlen(writestr) == 0) {
        syslog(LOG_ERR, "Error: Empty arguments are not allowed.");
        closelog();
        exit(1);
    }

    FILE* file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Unable to open file for writing.");
        closelog();
        exit(1);
    }

    // Write the string to the file
    fprintf(file, "%s", writestr);
    fclose(file);

    syslog(LOG_DEBUG, "Writing '%s' to '%s'", writestr, writefile);

    closelog();

    return 0;
}
